from flask import Flask, request, jsonify
#import pigpio
import json
import logging
 

app = Flask(__name__)
#pi = pigpio.pi()

# Log file ends up in/home/pi
logging.basicConfig(filename='record.log', level=logging.DEBUG, format=f'%(asctime)s %(levelname)s %(name)s %(threadName)s : %(message)s')

app.logger.info('Is this ever printed')


def pwm(val):
    
    if(abs(val) < 0.1):
    	val=0

    if(val > 0):
        fwd = val*255
        rev = 0
    else:
        fwd = 0
        rev = abs(val)*255

    return fwd, rev



# {{url}}/led?status=on
@app.route('/', methods=['GET'])
def led():

    #red =   int(request.args.get('red'))   if (request.args.get('red'))   else 0
    #green = int(request.args.get('green')) if (request.args.get('green')) else 0
    
    # Axis 1 left
    left = float(request.args.get('red'))
    
    # Axis 3 right
    right = float(request.args.get('green'))

    app.logger.info('RGB LED function %f  %f' % (left, right))

 
    redR,greenR = pwm(right)
    redL,greenL = pwm(left)
 
    
    #pi.set_PWM_dutycycle(24, redR)
    #pi.set_PWM_dutycycle(25, greenR)

    #pi.set_PWM_dutycycle(20, redL)
    #pi.set_PWM_dutycycle(18, greenL)
    

    return jsonify({"red": left, "green": right, "blue": 0})

