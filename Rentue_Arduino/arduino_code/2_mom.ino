#include <SPI.h>
#include <WiFiNINA.h>

int speakerOut = 2;

//#include "arduino_secrets.h" 
///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = "gimingi";        // your network SSID (name)
char pass[] = "12345678";    // your network password (use for WPA, or use as key for WEP)

int keyIndex = 0;            // your network key Index number (needed only for WEP)

int status = WL_IDLE_STATUS;
char server[] = "220.80.88.59";    // name address for Google (using DNS)
char ip[] = "8081";

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
    
}

void loop() {
  // if there are incoming bytes available
  // from the server, read them and print them:
    while (client.available()) {
        String req = client.readStringUntil('\r');
        Serial.println(req); // beep
        Serial.println(req.indexOf("beep"));
        if (req.indexOf("beep") > 0)   ////////////////////////
        {
            // 벨을 울려라 
            Serial.println("beepppppppppppp");
            tone(speakerOut,1000);
            delay(1000);
            noTone(speakerOut);
        }
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
  
  client.print("GET /Test/read.jsp"); //////////////////
  client.println(" HTTP/1.1");
  client.println("Host: 220.80.88.59");
  client.println("Connection: close");
  client.println();
}
