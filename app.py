from flask import Flask, render_template, url_for, request
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
# from flask_paginate import Pagination, get_page_args
import nltk
import numpy as np
import random
import string

cred = credentials.Certificate('caffiene-overflow-service-acc.json')
firebase_admin.initialize_app(cred)
db = firestore.client()
print('Connected')

app=Flask(__name__)

@app.route("/")
def index():
    comments = db.collection(u'public_feedbacks').stream()
    report_list = db.collection(u'weekly_reports').order_by(u'Date', direction=firestore.Query.DESCENDING).stream()
    return render_template("index.html", comments=comments, report_list=report_list)

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
    # print(d)
    return render_template('reports.html', text=d)

@app.route('/report_list/', methods=['POST', 'GET'])
def print_report():
    select = request.form.get('select-report')
    select = str(select)
    report_query = db.collection(u'weekly_reports').document(select).get()
    return render_template('report_list.html', report_query=report_query.to_dict())

if __name__=='__main__':
    app.run(debug=True, port=5050)
