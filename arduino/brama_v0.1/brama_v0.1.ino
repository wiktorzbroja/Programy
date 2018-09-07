#include <ESP8266WiFi.h>
 
const char* ssid = "Zbroja";
const char* password = "Zbroja1122";
 
int ledPin = 2; // GPIO13 2-dioda wbudowana, 4 to przełącznik
WiFiServer server(80);


void impuls()
 {
   digitalWrite(ledPin, HIGH);
   delay(1000);
   digitalWrite(ledPin, LOW);
 }
void setup() {
  Serial.begin(115200);
  delay(10);
 
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW); 
 
  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
 
  // Start the server
  server.begin();
  Serial.println("Server started");
 
  // Print the IP address
  Serial.print("Use this URL to connect: ");
  Serial.print("http://");
  Serial.print(WiFi.localIP());
  Serial.println("/");
 
}
 
void loop() {
  // Check if a client has connected
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
 
  // Wait until the client sends some data
  Serial.println("new client");
  while(!client.available()){
    delay(1);
  }
 
  // Read the first line of the request
  String request = client.readStringUntil('\r');
  Serial.println(request);
  client.flush();
 
  // Match the request
 
  
  if (request.indexOf("/klikacz") != -1)  {
    impuls();
      }
  if (request.indexOf("/moto") != -1)  {
    impuls();
    delay(5000); //poczekaj 5 sek
    impuls();
      }
      
  client.println("HTTP/1.1 200 OK");
  client.println("Content-Type: text/html");
  client.println(""); //  do not forget this one
  client.println("<!DOCTYPE HTML>");
  client.println("<html>");
  client.println("<head>");
  client.println("<meta charset=\"UTF-8\">");
  client.print("<center><big>Sterownik bramy</big></center>");
 
  client.println("<br><br>");
  client.println("<center><a href=\"/klikacz\"\"><button>Otwórz bramę</button></a>    <a href=\"/moto\"\"><button>Uchyl motorowi</button></a></center>");
  client.println("</html>");
 
  delay(1);
  Serial.println("Client disonnected");
  Serial.println("");
 
}
 
