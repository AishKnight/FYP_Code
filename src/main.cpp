#include <header.h>

#define SDA_2 36
#define SCL_2 35
#define CS 38


// Init the LDC - false in this case: no alternative address
LDC131X ldc1314(true);
uint16_t data;
uint16_t channel;
bool rp_overdrive;
uint16_t readcurrent;


void setup() {

}

void loop() {

}