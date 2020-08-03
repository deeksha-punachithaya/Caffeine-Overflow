from flask import Flask, render_template, url_for, request, Response
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import json
import plotly.graph_objects as go
import io
import random
import os
import plotly
from skimage.measure import compare_ssim
import argparse
import imutils
import matplotlib.pyplot as plt
import os
import cv2
import numpy as np
from PIL import Image, ImageDraw,ImageFont
import plotly.express as px

cred = credentials.Certificate('caffiene-overflow-service-acc.json')
firebase_admin.initialize_app(cred)
db = firestore.client()
print('Connected')

IMAGEFOLDER = os.path.join('static', 'images')

hists = os.listdir('static/surface')
hists = ['surface/' + file for file in hists]

app=Flask(__name__)
app.config['imagefolder'] = IMAGEFOLDER

def relative_score(y):
    y1 = list()
    x1 = list()
    for i in range(1,len(y)):
        x1.append(i)
        per = ((y[i] -y[i-1])/y[i-1])*100
        y1.append(per)
    return x1, y1

def cal1(previous_image , curr_image):
    previous_image = cv2.imread(previous_image)
    curr_image = cv2.imread(curr_image)
    previous_image = pre_process(previous_image)
    curr_image = pre_process(curr_image)
    grayA = cv2.cvtColor(previous_image, cv2.COLOR_BGR2GRAY)
    grayB = cv2.cvtColor(curr_image, cv2.COLOR_BGR2GRAY)
    (score, diff) = compare_ssim(grayA, grayB, full=True)
    return score

def progress(y,previous_image , curr_image):
    y_dummy = y[1:]
    score = cal1(previous_image , curr_image)
    y_dummy.append(1-score)
    print(1-score)
    return y_dummy

def pre_process(img):
    g = cv2.blur(img,(5,5),0)
    g = cv2.GaussianBlur(img,(5,5),0)
    g = cv2.medianBlur(g,3)
    return g

def plot_daily():
    base = np.load('base.npy')
    base = list(base)
    base = progress(base, 'frames0.jpg', 'frames1.jpg')
    x, y = relative_score(base)
    data = [
        go.Scatter(x=x, y=y)
    ]
    graphJSON = json.dumps(data, cls=plotly.utils.PlotlyJSONEncoder)
    return graphJSON

def plot_weekly():
    base = np.load('base_weekly.npy')
    base = list(base)
    base = progress(base, 'frames0_weekly.jpg', 'frames1_weekly.jpg')
    x, y = relative_score(base)
    data = [
        go.Bar(x=x, y=y)
    ]
    graphJSON = json.dumps(data, cls=plotly.utils.PlotlyJSONEncoder)
    return graphJSON

@app.route("/")
@app.route("/index")
def index():
    comments = db.collection(u'public_feedbacks').stream()
    report_list = db.collection(u'weekly_reports').order_by(u'Date', direction=firestore.Query.DESCENDING).stream()
    filename = os.path.join(app.config['imagefolder'], 'donut.png')
    construction_img = os.path.join(app.config['imagefolder'], 'construction.jpeg')
    bar = grouped_bar()
    progress = gauge_chart()
    daily_progress = plot_daily()
    weekly_progress = plot_weekly()
    return render_template("index.html", hists = hists, user_image = filename, comments=comments, report_list=report_list, plot=bar, progress=progress, daily_progress=daily_progress, weekly_progress=weekly_progress, construction_img=construction_img)

def gauge_chart():
    data = db.collection(u'percent_complete').stream()
    dic = {}
    for obj in data:
        dic[obj.id] = obj.to_dict()
    listy = []
    for i in dic[obj.id]['items']:
        listy.append(dic[obj.id]['items'][i])
    val = sum(listy)/len(listy)
    data = [
        go.Indicator(
            mode = "gauge+number",
            value = val,
            domain = {'x': [0, 1], 'y': [0, 1]},
            title = {'text': "Total Progress"},
            gauge = {'axis': {'range': [None, 100]}})
    ]
    graphJSON = json.dumps(data, cls=plotly.utils.PlotlyJSONEncoder)
    return graphJSON

def grouped_bar():
    data = db.collection(u'percent_complete').stream()
    dic = {}
    percent = {}
    for obj in data:
        dic[obj.id] = obj.to_dict()
    listy = []
    listx = []
    for i in dic[obj.id]['items']:
        listy.append(dic[obj.id]['items'][i])
        listx.append(i)
    print(listx)
    print(listy)
    last_doc = db.collection(u'percent_complete').order_by(u'time', direction=firestore.Query.DESCENDING).limit(1).stream()
    dic = {}
    for doc in last_doc:
        dic[doc.id] = doc.to_dict()
    today = dic[doc.id]['time']
    estimates = db.collection(u'estimates').stream()
    dic = {}
    days = {}
    from_today = {}
    for obj in estimates:
        dic[obj.id] = obj.to_dict()
        vals = dic[obj.id]['tasks']
    print(vals['bathroom'])
    diff = vals['bathroom']-vals['foundation']
    print(diff)
    for val in vals:
        if val == 'start':
            continue
        days[val] = (vals[val] - vals['start']).days
        from_today[val] = (vals[val] - today).days
    listy1 = []
    listy2 = []
    for task in listx:
        listy1.append(days[task])
        listy2.append(from_today[task])
    animals = listx
    data=[
        go.Bar(name='Completed percentage', x = animals, y = listy),
        go.Bar(name='Total estimated days', x = animals, y = listy1),
        go.Bar(name='Time till estimated date', x = animals, y = listy2)
    ]
    graphJSON = json.dumps(data, cls=plotly.utils.PlotlyJSONEncoder)
    return graphJSON
    fig.update_layout(barmode='group')
    fig.show()

@app.route("/reports/", methods=['POST', 'GET'])
def search_report():
    text = request.form['search']
    text = int(text)
    docs = db.collection(u'weekly_reports')
    query = docs.where(
        u'Area', u'==', text).order_by(u'Date', direction=firestore.Query.DESCENDING).limit(1)
    results = query.stream()
    print('done')
    d = {}
    for result in results:
        d[result.id] = result.to_dict()
    new = d[result.id]
    return render_template('reports.html', text=new)

@app.route('/report_list/', methods=['POST', 'GET'])
def print_report():
    select = request.form.get('select-report')
    select = str(select)
    report_query = db.collection(u'weekly_reports').document(select).get()
    return render_template('report_list.html', report_query=report_query.to_dict())

if __name__=='__main__':
    app.run(debug=True, port=5050)
