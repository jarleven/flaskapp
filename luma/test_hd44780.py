
# Thanks to : https://github.com/rm-hull/luma.lcd/issues/90

import time

import subprocess
from datetime import datetime

from luma.core.interface.serial import pcf8574
from luma.lcd.device import hd44780

interface = pcf8574(address=0x27, backlight_enabled=True)
device = hd44780(interface, width=16, height=2)
device.text = "Hello world"

try:
    while (True):
        CurDate = datetime.now().strftime('%m/%d/%y')
        CurTime = datetime.now().strftime('%H:%M:%S')


        device.text = '\n'.join([CurDate, CurTime])
        time.sleep(1)

except KeyboardInterrupt:
    pass

device.backlight(False)
device.show()
