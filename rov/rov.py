from flask import Flask, request, jsonify
import json
import logging
import serial 

# Arduino Uno is normally /dev/ttyACM0. Setup non blocking serialport
#ser = serial.Serial('/dev/ttyACM0', 115200, timeout=0,  writeTimeout=0)
ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=0,  writeTimeout=0)

app = Flask(__name__)

# Log file ends up in /home/pi
logging.basicConfig(filename='record.log', level=logging.DEBUG, format=f'%(asctime)s %(levelname)s %(name)s %(threadName)s : %(message)s')

app.logger.info('Is this ever printed....')


# {{url}}/led?status=on
@app.route('/', methods=['GET'])
def led():

    #red =   int(request.args.get('red'))   if (request.args.get('red'))   else 0
    #green = int(request.args.get('green')) if (request.args.get('green')) else 0
    
    # Axis 1 left
    left = float(request.args.get('red'))
    
    # Axis 3 right
    right = float(request.args.get('green'))

    #app.logger.info('RGB LED function %f  %f' % (left, right))
    
    # send Left and Right values over the serial port
    serialdata=("%s,%s,s\n" % (str(int(right * 255)), str(int(left * 255))))
    #app.logger.info(serialdata)
    
    if ser.out_waiting < 20:
        ser.write(serialdata.encode())


    return jsonify({"red": left, "green": right, "blue": 0})

