#!/bin/python
import sounddevice as sd

device_info = sd.query_devices(10, 'input')
samplerate = int(device_info['default_samplerate'])

sd.default.samplerate = samplerate
sd.default.channels = 2
devices = sd.query_devices()
print(devices)