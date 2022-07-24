from tkinter.font import names
from bs4 import BeautifulSoup
from httplib2 import Credentials
from numpy import append
import requests

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import datetime
from datetime import datetime
import pytz

cred = credentials.Certificate("orbital2022-a6638-firebase-adminsdk-6xut9-b51dac9b51.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

import time

while (True):

    URL = "https://justpark.capitaland.com/LotsAvail"

    response = requests.get(URL)
    page_content = BeautifulSoup(response.content, "html.parser")

    body = page_content.find_all("div", class_="listing-item")

    locations = []
    lotscount = []
    full = []
    for indiv in body:
        name = indiv.find("p").text
        number = indiv.find('span').text
        my_dic = {'name': name, 'lots': number}
        locations.append(name)
        full.append(my_dic)

        #lotscount.append(number)
    #lots_info = dict(zip(locations, lotscount))

    #print(full)

    #d = {'Malls':[{'name': a, 'lots': t} for a, t in zip(locations, lotscount)]}
    #print( json.dumps(d, indent=2) )

    # a = json.dumps([{'name': name, 'lots': lots} for name, lots in zip(locations, lotscount) ])
    # print(a)


    tz = pytz.timezone('Asia/Singapore')
    timedb = {'Time': datetime.now(tz)}

    # class Malls(object):
    #     def __init__(self, name, lots=0):
    #         self.name =name
    #         self.lots=lots


    def save(collection_id, time_id, data, snapshot):
        for i in range(len(full)):
            db.collection(collection_id).document(locations[i-1]).set(data[i-1])
            db.collection(time_id).document('Snapshot').set(snapshot)

    # def save(collection_id, data, snapshot):
    #     db.collection(collection_id).document('Malls').set(data)
    #     db.collection(collection_id).document('Snapshot').set(snapshot)

    save(
        collection_id="Carpark Availability",
        time_id='Time',
        data = full,
        snapshot = timedb,
    )

    time_in_seconds = 30
    time.sleep(time_in_seconds)
