
# import firebase_admin
# from firebase_admin import credentials
# from firebase_admin import firestore
# import datetime
# from datetime import datetime
# import pytz

# tz = pytz.timezone('Asia/Singapore')
# timedb = {'Time': datetime.now(tz)}

# # class Malls(object):
# #     def __init__(self, name, lots=0):
# #         self.name =name
# #         self.lots=lots

# cred = credentials.Certificate("orbital2022-a6638-firebase-adminsdk-6xut9-b51dac9b51.json")
# firebase_admin.initialize_app(cred)
# db = firestore.client()

# def save(collection_id, data, snapshot, name):
#     db.collection(collection_id).document(name).set(name)
#     db.collection(collection_id).document('Snapshot').set(snapshot)

# # def save(collection_id, data, snapshot):
# #     db.collection(collection_id).document('Malls').set(data)
# #     db.collection(collection_id).document('Snapshot').set(snapshot)

# save(
#     collection_id="Carpark Availability",
#     #document_id=time,
#     #data = lots_info,
#     data = None,
#     snapshot = timedb,
#     name = str(locations[1])
# )

