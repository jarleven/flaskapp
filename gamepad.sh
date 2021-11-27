#!/bin/bash

cd /home/pi
git clone https://github.com/luser/gamepadtest

cd gamepadtest
wget https://raw.githubusercontent.com/jarleven/flaskapp/main/gamepad.diff

git apply gamepad.diff

sudo rm /var/www/html/index.html
sudo cp index.html /var/www/html/
sudo cp gamepadtest.js /var/www/html/



: '

from flask import Flask, request, jsonify
import pigpio
import json
#import logging
 

app = Flask(__name__)
pi = pigpio.pi()

# Log file ends up in/home/pi
#logging.basicConfig(filename='record.log', level=logging.DEBUG, format=f'%(asctime)s %(levelname)s %(name)s %(threadName)s : %(message)s')

#app.logger.info('Is this ever printed ')
#app.logger.warning('Can you see this ')


# {{url}}/led?status=on
@app.route('/', methods=['GET'])
def led():

    #red =   int(request.args.get('red'))   if (request.args.get('red'))   else 0
    #green = int(request.args.get('green')) if (request.args.get('green')) else 0
    #blue =  int(request.args.get('blue'))  if (request.args.get('blue'))  else 0
    
    red = int(request.args.get('red'))
    green = int(request.args.get('green'))
    blue = int(request.args.get('blue'))
    
    #app.logger.info('RGB LED function')

    pi.set_PWM_dutycycle(24, red)
    pi.set_PWM_dutycycle(20, blue)
    pi.set_PWM_dutycycle(25, green)

    return jsonify({"red": red, "green": green, "blue": blue})

'





