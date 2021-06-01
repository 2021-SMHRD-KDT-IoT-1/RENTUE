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

void setup()
{  
  pinMode(speakerOut, OUTPUT);  // 스피커를 출력으로 지정
  
  Serial.begin(9600);
  ss.begin(9600);
  
  Serial.print("Simple TinyGPS library v. "); Serial.println(TinyGPS::library_version());
  Serial.println("by Mikal Hart");
  Serial.println();
}

void loop()
{
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

  delay(2000);  
}
