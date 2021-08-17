#!/usr/bin/env python3

import json
import smtplib
import ssl
import requests
from datetime import datetime, timedelta
import smtplib
import ssl
h = {
    'Referer': 'https://www.walgreens.com/findcare/vaccination/covid-19/location-screening',
    'Content-Type': 'application/json; charset=utf-8'
}
positions = {"keller": {"latitude": 32.9341893, "longitude": -97.229298},
             "plano": {"latitude": 33.0787152, "longitude": -96.8083063},
             "fort_worth": {"latitude": 32.7554883, "longitude": -97.3307658},
             "denton": {"latitude": 33.2148412, "longitude": -97.13306829999999},
             "arlington": {"latitude": 32.735687, "longitude": -97.10806559999999},
             "mckinney": {"latitude": 33.1983388, "longitude": -96.6389342},
             "richardson": {"latitude": 32.9483335, "longitude": -96.7298519}
             }
future = datetime.today() + timedelta(days=1)
date = future.strftime("%Y-%m-%d")
zip_codes_available = []
for p in positions:
    body = {"serviceId": "99",
            "position": positions[p],
            "appointmentAvailability": {"startDateTime": date},
            "radius": 25}
    res = json.loads(requests.post(
            "https://www.walgreens.com/hcschedulersvc/svc/v1/immunizationLocations/availability",
            headers=h,
            data=json.dumps(body)
        ).text)
    if res['appointmentsAvailable']:
        zip_codes_available.append(res['zipCode'])
        print(res)
print(zip_codes_available)
if len(zip_codes_available) > 0:
    formatted_msg = '\n'.join(zip_codes_available) + '\nhttps://www.walgreens.com/findcare/vaccination/covid-19/location-screening'
    print(formatted_msg)
    headers = {'Content-type': 'application/json'}
    app_token = ''
    user_token = ''
    data = {
        'token': app_token,
        'user': user_token,
        'title': 'Walgreens Vaccine Available',
        'message': formatted_msg,
        }
    print(response.text)
