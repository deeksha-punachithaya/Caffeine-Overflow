from flask import Flask, render_template, url_for, request
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import matplotlib.pyplot as plt
import numpy as np
import plotly.graph_objects as go

cred = credentials.Certificate('caffiene-overflow-service-acc.json')
firebase_admin.initialize_app(cred)
db = firestore.client()
print('Connected')

data = db.collection(u'percent_complete').stream()
dic = {}
percent = {}
for obj in data:
    dic[obj.id] = obj.to_dict()
# percent = dic[obj.id]['items']
# today = dic[obj.id]['time']
listy = []
listx = []
for i in dic[obj.id]['items']:
    listy.append(dic[obj.id]['items'][i])
    listx.append(i)
print(listx)
print(listy)
# print(percent)
# plot percentage

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
# # print(dic)
# print(days)
# print(from_today)

listy1 = []
listy2 = []

for task in listx:
    listy1.append(days[task])
    listy2.append(from_today[task])

print(listx)
print(listy)
print(listy1)
print(listy2)

data = [
    go.Indicator(
        mode = "gauge+number",
        value = 270,
        domain = {'x': [0, 1], 'y': [0, 1]},
        title = {'text': "Speed"}))
]
graphJSON = json.dumps(data, cls=plotly.utils.PlotlyJSONEncoder)
return graphJSON
# animals = listx

# fig = go.Figure(data=[
#     go.Bar(name='Completed percentage', x = animals, y = listy),
#     go.Bar(name='Total estimated days', x = animals, y = listy1),
#     go.Bar(name='Time till estimated date', x = animals, y = listy2)
# ])
# data=[
#     go.Bar(name='Completed percentage', x = animals, y = listy),
#     go.Bar(name='Total estimated days', x = animals, y = listy1),
#     go.Bar(name='Time till estimated date', x = animals, y = listy2)
# ]
#
#     graphJSON = json.dumps(data, cls=plotly.utils.PlotlyJSONEncoder)
#
#     return graphJSON
# # Change the bar mode
# fig.update_layout(barmode='group')
# fig.show()
# barWidth = 0.25
#
# # set height of bar
# bars1 = listy
# bars2 = listy1
# bars3 = listy2
#
# # Set position of bar on X axis
# r1 = np.arange(len(bars1))
# r2 = [x + barWidth for x in r1]
# r3 = [x + barWidth for x in r2]
#
# # Make the plot
# plt.bar(r1, bars1, color='#7f6d5f', width=barWidth, edgecolor='white', label='var1')
# plt.bar(r2, bars2, color='#557f2d', width=barWidth, edgecolor='white', label='var2')
# plt.bar(r3, bars3, color='#2d7f5e', width=barWidth, edgecolor='white', label='var3')
# fig = plt.gcf()
# plt.tight_layout()
#
# # Add xticks on the middle of the group bars
# plt.xlabel('group', fontweight='bold')
# plt.xticks([r + barWidth for r in range(len(bars1))], listx)
#
# # Create legend & Show graphic
# plt.xticks(rotation=90)
# fig.set_size_inches(18.5, 10.5, forward=True)
# plt.legend()
# plt.show()

# import matplotlib.pyplot as plt
# from matplotlib import cm
# from math import log10
#
# labels = listx
# data = listy
# #number of data points
# n = len(data)
# #find max value for full ring
# k = 10 ** int(log10(max(data)))
# m = k * (1 + max(data) // k)
#
# #radius of donut chart
# r = 1.5
# #calculate width of each ring
# w = r / n
#
# #create colors along a chosen colormap
# colors = [cm.terrain(i / n) for i in range(n)]
#
# #create figure, axis
# fig, ax = plt.subplots()
# ax.axis("equal")
#
# #cre
# for i in range(n):
#     #hide labels in segments with textprops: alpha = 0 - transparent, alpha = 1 - visible
#     innerring, _ = ax.pie([m - data[i], data[i]], radius = r - i * w, startangle = 90, labels = ["", labels[i]], labeldistance = 1 - 1 / (1.5 * (n - i)), textprops = {"alpha": 0}, colors = ["white", colors[i]])
#     plt.setp(innerring, width = w, edgecolor = "white")
#
# plt.legend()
# plt.show()
