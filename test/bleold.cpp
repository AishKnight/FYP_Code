#include <header.h>


// //I2C pin definitions
// #define SDA_2 36
// #define SCL_2 35

// //SPI Pin Definitions (const int since protocentral library uses this)
// const int ADS1292_DRDY_PIN = 10;
// const int ADS1292_CS_PIN = 14;
// const int ADS1292_START_PIN = 8;
// const int ADS1292_PWDN_PIN = 9;
// const int ADS1292_MOSI_PIN = 13;
// const int ADS1292_MISO_PIN = 11;
// const int ADS1292_SCK_PIN = 12;


// //Custom sensor definitions
// #define CS 38 // Chip select for LDC1312 respiration sensor
// #define MAX_BRIGHTNESS 255 // Max Brightness for PPG sensor

// //BLE characteristics definitions
// // BLEService myService("30cae40d-2b16-4606-8949-c82ff7af2b96");
// // BLEDoubleCharacteristic temperatureChar("b6f56b47-272b-45d6-8e3d-fb0e5687cdff", BLERead | BLEBroadcast| BLENotify);
// // BLEUnsignedIntCharacteristic IRChar("02f3a6f2-6095-4d7a-a7d0-f2c471fecb0e", BLERead | BLEBroadcast| BLENotify);
// // BLEUnsignedIntCharacteristic RedChar("cd06f064-2738-4288-8f71-803cdc477dc5", BLERead | BLEBroadcast| BLENotify);
// // BLEUnsignedShortCharacteristic RespChar("e6530d8f-8bb8-4f2e-b511-347d67af1f75", BLERead | BLEBroadcast| BLENotify);
// // BLEIntCharacteristic ECGChar("fbb31c84-4a34-40c9-bbb8-64366848f400", BLERead | BLEBroadcast| BLENotify);

// bool deviceConnected = false;
// double txValue = 0;
// char sensorvals[20];

// //Temperature global variables
// double temperature = 0;
// TMP102 Tempsensor;

// //PPG global variables
// bool PPGfirstsamples = true;
// uint32_t irBuffer[100]; //infrared LED sensor data
// uint32_t redBuffer[100];  //red LED sensor data
// byte index_ir; //Index for IR or red value
// int32_t bufferLength = 100; //data length
// int32_t spo2; //SPO2 value
// int8_t validSPO2; //indicator to show if the SPO2 calculation is valid
// int32_t heartRate; //heart rate value
// int8_t validHeartRate; //indicator to show if the heart rate calculation is valid
// MAX30102 PPGsensor;

// //Respiration global variables
// uint16_t initialcurrent;
// uint16_t channel;
// bool rp_overdrive;
// uint16_t readcurrent;
// uint16_t data0;
// uint16_t fsensor0;
// LDC131X Respsensor(true); // true means using 0x2B

// //ECG global variables
// volatile uint8_t globalHeartRate = 0;
// volatile uint8_t globalRespirationRate=0;
// int16_t ecgWaveBuff, ecgFilterout;
// int16_t resWaveBuff,respFilterout;
// ads1292r ECGsensor;
// ecg_respiration_algorithm ECG_ALGORITHM;

void setup() {
//   // //BLE setup
//   // if (!BLE.begin()) {
//   //   Serial.println("starting BLE failed!");

//   //   while (1);
//   // }

//   // // BLE.setLocalName("ESP32");
//   // // BLE.setAdvertisedService(myService); // add the service UUID
//   // // myService.addCharacteristic(temperatureChar); // add the temp level characteristic
//   // // myService.addCharacteristic(IRChar); // add the IR level characteristic
//   // // myService.addCharacteristic(RedChar); // add the Red level characteristic
//   // // myService.addCharacteristic(RespChar); // add the Resp level characteristic
//   // // myService.addCharacteristic(ECGChar); // add the ECG level characteristic
//   // // BLE.addService(myService); // Add the temp service
//   // // temperatureChar.writeValue(temperature); // set initial value for this characteristic

//   // BLE.advertise();
//   // Serial.println("Bluetooth® device active, waiting for connections...");

//   // //I2C setup
//   // Serial.begin(115200);
//   // delay(100);//Wait before accessing sensors
//   // Wire.begin(SDA_2,SCL_2,115200);
  
//   // //Respiration sensor setup function
//   // pinMode(CS, OUTPUT);
//   // digitalWrite(CS, LOW); 
//   // Respsensor.LDC_setSettingsknitted(0);
//   // initialcurrent = Respsensor.LDC_getInitialDriveCurrent(0);
//   // Serial.print("My initial current is: ");
//   // Serial.println(initialcurrent);

//   // //PPG sensor initialisation
//   // if (!PPGsensor.begin(Wire, I2C_SPEED_FAST)) //Use default I2C port, 400kHz speed
//   // {
//   //   Serial.println(F("MAX30102 was not found. Please check wiring/power."));
//   //   while (1);
//   // }
//   // byte ledBrightness = 60; //Options: 0=Off to 255=50mA
//   // byte sampleAverage = 4; //Options: 1, 2, 4, 8, 16, 32
//   // byte ledMode = 2; //Options: 1 = Red only, 2 = Red + IR, 3 = Red + IR + Green
//   // byte sampleRate = 100; //Options: 50, 100, 200, 400, 800, 1000, 1600, 3200
//   // int pulseWidth = 411; //Options: 69, 118, 215, 411
//   // int adcRange = 4096; //Options: 2048, 4096, 8192, 16384

//   // PPGsensor.setup(ledBrightness, sampleAverage, ledMode, sampleRate, pulseWidth, adcRange); //Configure sensor with these settings
//   // Serial.println("PPG setup successfully");

//   // //SPI setup
//   // SPI.begin(ADS1292_SCK_PIN,ADS1292_MISO_PIN,ADS1292_MOSI_PIN,ADS1292_CS_PIN);
//   // SPI.setBitOrder(MSBFIRST);
//   // //CPOL = 0, CPHA = 1
//   // SPI.setDataMode(SPI_MODE1);
//   // // Selecting 1Mhz clock for SPI
//   // SPI.setClockDivider(SPI_CLOCK_DIV16);

//   // pinMode(ADS1292_DRDY_PIN, INPUT);
//   // pinMode(ADS1292_CS_PIN, OUTPUT);
//   // pinMode(ADS1292_START_PIN, OUTPUT);
//   // pinMode(ADS1292_PWDN_PIN, OUTPUT);

//   // ECGsensor.ads1292Init(ADS1292_CS_PIN,ADS1292_PWDN_PIN,ADS1292_START_PIN);
//   // Serial.println("Initiliziation is done");
}

void loop() {
//   // //BLE detection:
//   // BLEDevice central = BLE.central();

//   // //Temperature readout
//   // temperature = Tempsensor.SensorRead(0x48); // 0x48 is I2C address of TMP102
//   // //Serial.println ("Temperature: ");
//   // //Serial.println(temperature);
 
//   // //PPG readout
//   // PPGsensor.readfirstsamples(PPGfirstsamples,bufferLength,irBuffer,redBuffer, &spo2, &validSPO2, &heartRate, &validHeartRate);
//   // PPGfirstsamples = false;
//   // PPGsensor.readsensordata(bufferLength,irBuffer,redBuffer,&index_ir);
//   // maxim_heart_rate_and_oxygen_saturation(irBuffer, bufferLength, redBuffer, &spo2, &validSPO2, &heartRate, &validHeartRate);

//   // //Respiration readout
//   // data0 = Respsensor.LDC_readData(0);
//   // data0 = data0 & 0x0FFF;
//   // //fsensor0 = (data * 43500000)/(4096);
//   // fsensor0 = (data0 * 43500000)/(65536); 
//   // //Serial.print("Read frequency: ");
//   // //Serial.println(fsensor0);

//   // //ECG readout
//   // ads1292OutputValues ecgRespirationValues;
//   // boolean ret = ECGsensor.getAds1292EcgAndRespirationSamples(ADS1292_DRDY_PIN,ADS1292_CS_PIN,&ecgRespirationValues);
//   // if (ret == true)
//   // {
//   //   ecgWaveBuff = (int16_t)(ecgRespirationValues.sDaqVals[1] >> 8) ;  // ignore the lower 8 bits out of 24bits
//   //   resWaveBuff = (int16_t)(ecgRespirationValues.sresultTempResp>>8) ;

//   //   if(ecgRespirationValues.leadoffDetected == false)
//   //   {
//   //     ECG_ALGORITHM.ECG_ProcessCurrSample(&ecgWaveBuff, &ecgFilterout);   // filter out the line noise @40Hz cutoff 161 order
//   //     //ECG_RESPIRATION_ALGORITHM.QRS_Algorithm_Interface(ecgFilterout,&globalHeartRate); // calculate
//   //     //respFilterout = ECG_RESPIRATION_ALGORITHM.Resp_ProcessCurrSample(resWaveBuff);
//   //     //ECG_RESPIRATION_ALGORITHM.RESP_Algorithm_Interface(respFilterout,&globalRespirationRate);

//   //   }else{
//   //     ecgFilterout = 0;
//   //     respFilterout = 0;
//   //   }
//   // }
//   // //Serial.print("ECG_data: ");
//   // //Serial.println(ecgFilterout);
  
//   // //Serial.print(F("index_ir="));
//   // //Serial.print(index_ir, DEC);
//   // //Serial.print(F("red="));
//   // //Serial.print(redBuffer[index_ir], DEC);
//   // //Serial.print(F(", ir="));
//   // Serial.println(irBuffer[index_ir], DEC);
//   // //Serial.print(F(", HR="));
//   // //Serial.print(heartRate, DEC);
//   // //Serial.print(F(", HRvalid="));
//   // //Serial.print(validHeartRate, DEC);
//   // //Serial.print(F(", SPO2="));
//   // //Serial.print(spo2, DEC);
//   // //Serial.print(F(", SPO2Valid="));
//   // //Serial.println(validSPO2, DEC);
//   // // if (central) {
//   // // temperatureChar.writeValue(temperature); 
//   // // IRChar.writeValue(irBuffer[index_ir]); 
//   // // RedChar.writeValue(redBuffer[index_ir]); 
//   // // RespChar.writeValue(fsensor0);
//   // // ECGChar.writeValue(ecgFilterout);

//   // // delay(100);
//   // // }
//   // // else{
//   // // Serial.print("Disconnected from central: ");
//   // }
}