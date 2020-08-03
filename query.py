import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate('caffiene-overflow-service-acc.json')
firebase_admin.initialize_app(cred)
db = firestore.client()
print('Connected')

text = 1
docs = db.collection(u'weekly_reports')
query = docs.where(
    u'Area', u'==', text).order_by(u'Date', direction=firestore.Query.DESCENDING).limit(1)
results = query.stream()
print('done')
d = {}
for result in results:
    d[result.id] = result.to_dict()
# print("%s is %d years old." % (name, age))
print(d[result.id]['Contractor'])
report = '''Area: %d \nType of work: %s \nContract Labourers this week: %d\nActual days charged: %d
\nPercent of contract complete: %d/% \nWage per day: %d \nContractor: %s \nMinimum Days a week:
%d\nNumber of Plots: %d \n''' % (d[result.id]['Area'], d[result.id]['Type of work'],
d[result.id]['Contract labourers this week'], d[result.id]['Actual days charged'],
d[result.id]['Percent of contract complete'], d[result.id]['Wage per day'],
d[result.id]['Contractor'], d[result.id]['Minimum Days a week'], d[result.id]['Number of Plots'])
print(report)
