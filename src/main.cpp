#include <Arduino.h>
#define LED_STAT_PIN 33

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  delay(500);//Delay to let system boot
  Serial.print("Heyyyyyy.....");
  delay(1000);//Wait before accessing Sensor
  pinMode(33,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(33, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  Serial.print("Hello world......\n");
  digitalWrite(33, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);
}


/*
// put function declarations here:
//int myFunction(int, int);

void setup() {
  // put your setup code here, to run once:
  //int result = myFunction(2, 3);
}

void loop() {
  // put your main code here, to run repeatedly:
}

// put function definitions here:
//int myFunction(int x, int y) {
  //return x + y;
//}*/