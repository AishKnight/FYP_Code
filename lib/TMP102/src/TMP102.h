#ifndef TMP102_h
#define TMP102_h

#include <Arduino.h>
#include <Wire.h>

class TMP102
{
    public:
    double SensorRead (uint8_t i2caddress);
};

#endif


