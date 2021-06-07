#include <SoftwareSerial.h>

// #include <pitches.h> // pitches.h 헤더파일을 이용한다
int speakerOut = 9;    // 스피커 출력 핀을 정한다

#include <TinyGPS.h>

/* This sample code demonstrates the normal use of a TinyGPS object.
   It requires the use of SoftwareSerial, and assumes that you have a
   4800-baud serial GPS device hooked up on pins 3(rx) and 4(tx).
*/

TinyGPS gps;
SoftwareSerial ss(11, 12);

#include <SPI.h>
#include <WiFiNINA.h>

//#include "arduino_secrets.h" 
///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = "gimingi";        // your network SSID (name)
char pass[] = "12345678";    // your network password (use for WPA, or use as key for WEP)

int keyIndex = 0;            // your network key Index number (needed only for WEP)

int status = WL_IDLE_STATUS;
// if you don't want to use DNS (and reduce your sketch size)
// use the numeric IP instead of the name for the server:
//IPAddress server(74,125,232,128);  // numeric IP for Google (no DNS)
char server[] = "220.80.88.59";    // name address for Google (using DNS)
char ip[] = "8081";

// Initialize the Ethernet client library
// with the IP address and port of the server
// that you want to connect to (port 80 is default for HTTP):
WiFiClient client;

void wificonnect()
{
    status=0;
    while (status != WL_CONNECTED) {
        Serial.print("Attempting to connect to SSID: ");
        Serial.println(ssid);
        // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
        status = WiFi.begin(ssid, pass);

        // wait 10 seconds for connection:
        delay(5000);
    }
    Serial.println("Connected to wifi");
    printWifiStatus();

}

void serverconnect()
{
    Serial.println("\nStarting connection to server...");
    if (client.connect(server, 8081)) {
      Serial.println("connected to server");
    }
}

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(9600);

  // check for the WiFi module:
  // attempt to connect to Wifi network:
  pinMode(speakerOut, OUTPUT);  // 스피커를 출력으로 지정
  
  wificonnect();
  serverconnect();

  Serial.begin(9600);
  ss.begin(9600);
    
}

void loop() {
  // if there are incoming bytes available
  // from the server, read them and print them:
    while (client.available()) {
        char c = client.read();
        Serial.write(c);
    }
  // 연결된 상태라면
    if (client.connected()) {
        sendData();
    }else
    {
        wificonnect();
        serverconnect();
    }
    delay(1000);
}


void printWifiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print your board's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);

  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.print(rssi);
  Serial.println(" dBm");
}

void sendData() {
  bool newData = false;
  unsigned long chars;
  unsigned short sentences, failed;

  // For one second we parse GPS data and report some key values
  for (unsigned long start = millis(); millis() - start < 1000;)
  {
    while (ss.available())
    {
      char c = ss.read();
      // Serial.write(c); // uncomment this line if you want to see the GPS data flowing
      if (gps.encode(c)) // Did a new valid sentence come in?
        newData = true;
    }
  }
  
  float flat, flon;
  
  if (newData)
  {
    unsigned long age;
    gps.f_get_position(&flat, &flon, &age);
    Serial.print("LAT=");
    Serial.print(flat == TinyGPS::GPS_INVALID_F_ANGLE ? 0.0 : flat, 6);
    Serial.print(" LON=");
    Serial.print(flon == TinyGPS::GPS_INVALID_F_ANGLE ? 0.0 : flon, 6);
    Serial.print(" SAT=");
    Serial.print(gps.satellites() == TinyGPS::GPS_INVALID_SATELLITES ? 0 : gps.satellites());
    Serial.print(" PREC=");
    Serial.print(gps.hdop() == TinyGPS::GPS_INVALID_HDOP ? 0 : gps.hdop());
    
    Serial.println("");
    Serial.print("flat : ");
    Serial.print(flat);    
    Serial.print("   flat_min : 126.91995");
    Serial.println("   flat_max : 126.92030");
      
    Serial.print("flon : ");
    Serial.print(flon);
    Serial.print("   flon_min : 35.14964");
    Serial.println("   flon_max : 35.14997");

    // 새 데이터가 있는 경우에만 소리
    if(flon >= 126.91995 && flon <= 126.92030  ||  flat >= 35.14964 && flat <= 35.14997 ){
      Serial.print("소리X");
    }else {
      Serial.print("소리0");
      tone(speakerOut,961, 10000);
      //delay(10000);  
    }
  }
  
  gps.stats(&chars, &sentences, &failed);
  Serial.print(" CHARS=");
  Serial.print(chars);
  Serial.print(" SENTENCES=");
  Serial.print(sentences);
  Serial.print(" CSUM ERR=");
  Serial.println(failed);

  //delay(2000);  
  
  client.print("GET /Test/test.jsp?flon=");
  client.print(flon);
  client.print("&flat=");
  client.print(flat);
  client.print("&chars=");
  client.print(chars);
  client.println(" HTTP/1.1");
        
  // 해당 서버의 IP 설정
  client.println("Host: 220.80.88.59");
  client.println("Connection: close");
  client.println();
}


       
