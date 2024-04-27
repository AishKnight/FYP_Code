#include <TMP102.h>

double TMP102::SensorRead(uint8_t i2caddress){
  uint8_t temp[2];
  int16_t tempc;
  Wire.beginTransmission(i2caddress);
  Wire.write(0x00);
  Wire.endTransmission();
  Wire.requestFrom(i2caddress, 2);
  if (2 <= Wire.available()){
    temp[0] = Wire.read();
    temp[1] = Wire.read();
    temp[1] = temp[1] >> 4;
    tempc = ((temp[0] << 4) | temp[1]);
  }
    return (tempc*0.0625);
  }