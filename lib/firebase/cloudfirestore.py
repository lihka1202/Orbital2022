from tkinter.font import names
from bs4 import BeautifulSoup
from httplib2 import Credentials
from numpy import append
import requests

URL = "https://justpark.capitaland.com/LotsAvail"

response = requests.get(URL)
page_content = BeautifulSoup(response.content, "html.parser")

body = page_content.find_all("div", class_="listing-item")

locations = []
lotscount = []
for indiv in body:
    name = indiv.find("p").text
    number = indiv.find('span').text
    locations.append(name)
    lotscount.append(number)

lots_info = dict(zip(locations, lotscount))

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import datetime
from datetime import datetime
import pytz

tz = pytz.timezone('Asia/Singapore')
timedb = {'Time': datetime.now(tz)}

cred = credentials.Certificate("orbital2022-a6638-firebase-adminsdk-6xut9-b51dac9b51.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

def save(collection_id, data, snapshot):
    db.collection(collection_id).document('Malls').set(data)
    db.collection(collection_id).document('Snapshot').set(snapshot)

save(
    collection_id="Carpark Availability",
    #document_id=time,
    data = lots_info,
    snapshot = timedb
    
)

