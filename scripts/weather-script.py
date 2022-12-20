import requests
import pandas as pd
from datetime import datetime
import json
import sqlalchemy
from google.cloud import bigquery
import pandas_gbq
from pandas import json_normalize
import pytz
import os

def testing_api(event, context):
    API_keys = 'insert your api key from weatherapp'
    #list the countries
    countries = ['Brunei', 'Cambodia', 'Indonesia', 'Singapore', 'Malaysia', 'Thailand', 'Laos', 'Vietnam']
    #create empty folder to fetch
    results = []
    #loop through the country
    for country_names in countries:

        url = f'http://api.openweathermap.org/data/2.5/weather?q={country_names}&APPID={API_keys}&units=metric'
        r = requests.get(url)       
        result = r.json()
        results.append(result)
        getting_json = json_normalize(results)
        getting_json_2 = json_normalize(results,"weather",['weather'])
        df = pd.DataFrame(getting_json)
        df2 = pd.DataFrame(getting_json_2)
        df2 =df2[["main","description"]]
        df = pd.concat([df, df2], axis=1)
        #create a timestamp to store the current time.
        df.insert(0, 'TimeStamps', datetime.now(pytz.timezone('Asia/Jakarta')).strftime('%Y-%m-%d %H:%M:%S'))
        del df["weather"]
        df.columns = df.columns.str.replace('.', '')

    pandas_gbq.to_gbq(df, 'insert_table_id', project_id='insert_projectid',if_exists='append')