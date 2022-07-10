from tkinter.font import names
from bs4 import BeautifulSoup
from httplib2 import Credentials
from numpy import append
import requests

#URL = "https://www.bursamalaysia.com/market_information/market_statistic/securities"
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
    # data = {}
    # data['location'] = names
    # data['loscount'] = lotsavail
    # lots_info[names] = lotsavail

lots_info = dict(zip(locations, lotscount))

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import datetime
from datetime import datetime
import pytz

tz = pytz.timezone('Asia/Singapore')
time = datetime.now(tz).strftime('%Y-%m-%d %H:%M:%S')

cred = credentials.Certificate("orbital2022-a6638-firebase-adminsdk-6xut9-b51dac9b51.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

def save(collection_id, document_id, data):
    db.collection(collection_id).document(document_id).set(data)

save(
    collection_id="Carpark Availability",
    document_id=time,
    data = lots_info
)