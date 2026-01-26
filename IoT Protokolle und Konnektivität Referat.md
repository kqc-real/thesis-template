# **Kommunikationsprotokolle und Konnektivitätsarchitekturen im Internet der Dinge: Eine exhaustive Analyse von Standards, Leistungsparametern und Interoperabilität im Zeitalter der Hyper-Konnektivität**

## **1\. Einleitung: Die Architektur der vernetzten Welt**

Das Internet der Dinge (IoT) markiert eine fundamentale Zäsur in der Geschichte der digitalen Kommunikation. Während das klassische Internet primär für den Austausch von Informationen zwischen Menschen konzipiert wurde – geprägt durch den Transfer großer Dateien, Multimedia-Streaming und asynchrone Kommunikation –, stellt das IoT eine Verschiebung hin zu einer maschinenzentrierten Infrastruktur dar. Wir befinden uns im Jahr 2026 in einer Phase, die oft als „Hyper-Konnektivität“ bezeichnet wird, in der Milliarden von physischen Objekten, von mikroskopisch kleinen medizinischen Implantaten bis hin zu gigantischen Windkraftanlagen, kontinuierlich Daten generieren, austauschen und verarbeiten.

Die zentrale Herausforderung dieser Ära ist nicht mehr die bloße Vernetzung an sich, sondern die Bewältigung der extremen Heterogenität der kommunizierenden Entitäten. Die Anforderungen divergieren massiv: Ein batteriebetriebener Feuchtigkeitssensor in der Agrarwirtschaft muss mit einer einzigen Energieladung über zehn Jahre hinweg kleine Datenpakete über Kilometer senden, während ein autonomes Flurförderfahrzeug in einer Smart Factory geringste Latenzzeiten im Millisekundenbereich bei hoher Bandbreite benötigt, um Kollisionen zu vermeiden und Videodaten in Echtzeit zu streamen. Diese Diskrepanz führt dazu, dass es kein universelles „IoT-Protokoll“ gibt, das alle Anwendungsfälle abdeckt. Stattdessen hat sich ein komplexes Ökosystem aus spezialisierten Protokollen und Netzwerktechnologien entwickelt, das sich über alle Schichten des ISO/OSI-Modells erstreckt.

Dieser Forschungsbericht bietet eine tiefgehende, wissenschaftlich fundierte Analyse des Status quo der IoT-Kommunikation in den Jahren 2025 und 2026\. Er untersucht die technologischen Grundlagen der Nachrichtenübermittlung auf Anwendungsebene, analysiert die physikalischen und MAC-Schicht-Eigenschaften moderner Funkstandards und beleuchtet die kritischen Fragen der Interoperabilität, die durch Initiativen wie Matter und industrielle Standards wie OPC UA FX adressiert werden. Ein besonderer Fokus liegt auf der synthetischen Auswertung aktueller Forschungsliteratur, um Trends zu identifizieren, die über bloße technische Spezifikationen hinausgehen und die strategischen Weichenstellungen für Ingenieure, Architekten und Entscheidungsträger im IoT-Umfeld definieren.

## ---

**2\. Die Anwendungsebene: Nachrichtenprotokolle für das Ressourcen-beschränkte Netz**

Die Anwendungsschicht (Application Layer) ist die Schnittstelle, an der die Datenlogik des IoT definiert wird. Im Gegensatz zum traditionellen Web, das fast ausschließlich auf HTTP (Hypertext Transfer Protocol) setzt, erfordert das IoT Protokolle, die mit instabilen Verbindungen, begrenzter Bandbreite und minimalen Energieressourcen umgehen können. Die Diskussion konzentriert sich hierbei primär auf zwei Architekturparadigmen: das dokumentenzentrierte Request/Response-Modell und das ereignisgesteuerte Publish/Subscribe-Modell.

### **2.1 Message Queuing Telemetry Transport (MQTT): Der De-facto-Standard für Telemetrie**

MQTT hat sich in den letzten Jahren als das dominante Protokoll für die IoT-Datenübertragung etabliert. Ursprünglich in den späten 1990er Jahren von IBM für die Überwachung von Ölpipelines über satellitengestützte Verbindungen entwickelt, ist es heute der Standard für alles, von Smart-Home-Geräten bis hin zu industriellen Steuerungen.

#### **2.1.1 Architektur und Entkopplung**

Die Stärke von MQTT liegt in seiner radikalen Entkopplung von Informationsproduzenten (Publisher) und Informationskonsumenten (Subscriber). Anders als bei HTTP, wo der Client die Adresse des Servers kennen und eine direkte Verbindung aufbauen muss, kommunizieren MQTT-Clients niemals direkt miteinander. Stattdessen verbinden sie sich mit einer zentralen Komponente, dem **Broker**.

Der Broker fungiert als Postverteilstelle des IoT. Ein Temperatursensor (Publisher) sendet seine Daten an ein bestimmtes Thema (Topic), beispielsweise fabrik/halle1/maschine4/temperatur. Ein Überwachungssystem (Subscriber), das an diesen Daten interessiert ist, abonniert dieses Topic beim Broker. Sobald eine neue Nachricht eintrifft, verteilt der Broker diese an alle Abonnenten. Diese Architektur bietet drei Formen der Entkopplung:

1. **Räumliche Entkopplung:** Sender und Empfänger müssen die IP-Adresse oder den Port des jeweils anderen nicht kennen. Dies ist entscheidend in dynamischen Netzwerken, in denen sich IP-Adressen durch DHCP oder NAT ändern können.  
2. **Zeitliche Entkopplung:** Durch die Nutzung persistenter Sitzungen kann der Broker Nachrichten für einen Client speichern, der vorübergehend offline ist (z. B. wegen eines Funklochs oder eines Schlafzyklus), und diese zustellen, sobald der Client wieder online ist.  
3. **Synchronisations-Entkopplung:** Der Prozess des Sendens und Empfangens blockiert nicht die Ausführung anderer Aufgaben auf den Geräten.

#### **2.1.2 Binäre Effizienz und Overhead**

Ein wesentlicher Grund für den Erfolg von MQTT in ressourcenbeschränkten Umgebungen ist seine Leichtgewichtigkeit. Das Protokoll ist binär kodiert, im Gegensatz zum textbasierten HTTP, das oft gesprächig ist und viele Metadaten überträgt. Der kleinste mögliche MQTT-Paket-Header ist lediglich 2 Byte groß. Dies ist besonders relevant in Netzwerken wie NB-IoT oder Satellitenkommunikation, wo jedes Byte direkt Kosten verursacht oder die Batterie belastet.

Die Analyse der Bandbreitennutzung zeigt, dass MQTT zwar auf TCP aufsetzt – was einen gewissen Overhead für den Verbindungsaufbau (Drei-Wege-Handshake) mit sich bringt –, aber in Szenarien mit stabilen, langlebigen Verbindungen extrem effizient ist. Sobald die TCP-Verbindung steht, ist der Overhead pro Nachricht minimal. Forschungen aus dem Jahr 2024 bestätigen, dass MQTT in Umgebungen mit geringer Paketverlustrate eine geringere Latenz aufweist als konkurrierende UDP-basierte Protokolle, da der TCP-Stack auf Kernel-Ebene die Flusskontrolle effizienter handhabt als Application-Layer-Implementierungen.1

#### **2.1.3 Quality of Service (QoS) Stufen**

Ein Alleinstellungsmerkmal von MQTT ist die granulare Steuerung der Zustellgarantie durch QoS-Level, die es Entwicklern erlauben, je nach Datenwichtigkeit zwischen Bandbreite und Sicherheit abzuwägen:

* **QoS 0 (At most once):** Das „Fire-and-Forget“-Prinzip. Die Nachricht wird einmal gesendet, ohne auf eine Bestätigung zu warten. Es gibt keine Garantie für die Ankunft. Dies ist ideal für hochfrequente Sensordaten, bei denen der Verlust eines einzelnen Messwertes irrelevant ist.  
* **QoS 1 (At least once):** Der Sender speichert die Nachricht lokal, bis er ein PUBACK (Publish Acknowledgement) vom Broker erhält. Erhält er dieses nicht innerhalb einer bestimmten Zeit, sendet er erneut. Dies garantiert die Zustellung, kann aber zu Duplikaten führen, die die Anwendungslogik behandeln muss (Idempotenz).  
* **QoS 2 (Exactly once):** Durch einen vierstufigen Handshake wird sichergestellt, dass die Nachricht genau einmal ankommt. Dies erzeugt den höchsten Overhead und die höchste Latenz, ist aber unabdingbar für kritische Steuerbefehle (z. B. finanzielle Transaktionen oder Not-Aus-Signale).

#### **2.1.4 MQTT 5.0 und MQTT-SN**

Die Weiterentwicklung des Standards zu MQTT 5.0 hat Funktionen eingeführt, die für moderne Cloud-Native-Architekturen essenziell sind. Dazu gehören „Shared Subscriptions“ für das Load Balancing zwischen mehreren Consumer-Instanzen und „Request/Response“-Muster innerhalb des Protokolls, die es erlauben, synchrone Aufrufe über den asynchronen Kanal abzubilden.

Für extrem beschränkte Netzwerke, die keinen TCP-Support bieten (wie einfache Zigbee-Knoten oder UDP-Only-Netze), existiert die Variante **MQTT-SN (Sensor Networks)**. MQTT-SN bildet die Semantik von MQTT auf UDP ab, entfernt die Notwendigkeit permanenter Verbindungen und führt Mechanismen wie Topic-ID-Registrierung ein, um lange Topic-Strings durch kurze IDs zu ersetzen und so den Overhead weiter zu drücken.2

### **2.2 Constrained Application Protocol (CoAP): Das Web der Dinge**

Während MQTT eine eigene Abstraktionsschicht schafft, verfolgt das Constrained Application Protocol (CoAP) (RFC 7252\) den Ansatz, die Prinzipien des World Wide Web (REST) auf kleinste Geräte zu übertragen. CoAP wird oft als „HTTP für Mikrocontroller“ bezeichnet.

#### **2.2.1 RESTful über UDP**

CoAP nutzt das verbindungslose User Datagram Protocol (UDP) als Transportschicht. Dies eliminiert den teuren TCP-Handshake und ermöglicht eine schnellere Aufwach- und Sendezeit („Wake-up and Transmit“). CoAP übernimmt das Ressourcenmodell von HTTP: Jedes Datum (z. B. Temperatur) ist eine Ressource, die über eine URI (Uniform Resource Identifier) adressierbar ist und mittels der Standardmethoden GET, PUT, POST und DELETE manipuliert werden kann.3

Dies ermöglicht eine nahtlose Integration in Web-Architekturen. Ein HTTP-Client kann über einen Proxy mit einem CoAP-Sensor kommunizieren, ohne dass eine komplexe Protokollübersetzung notwendig ist – lediglich eine Umsetzung von TCP auf UDP und eine Header-Konvertierung finden statt.

#### **2.2.2 Zuverlässigkeit und Beobachtung**

Da UDP keine Zustellgarantien bietet, implementiert CoAP einen eigenen leichten Mechanismus zur Zuverlässigkeit. Nachrichten können als „Confirmable“ (CON) markiert werden, was den Empfänger zwingt, ein einfaches Acknowledge (ACK) zu senden. Im Gegensatz zu TCPs komplexem Retransmission-Timer nutzt CoAP einen einfachen exponentiellen Backoff.

Eine der wichtigsten Erweiterungen für IoT-Szenarien ist **CoAP Observe (RFC 7641\)**. Anstatt dass ein Client regelmäßig per Polling den Status einer Ressource abfragen muss (was Energie verschwendet), kann er sich als „Beobachter“ registrieren. Der Server sendet dann bei jeder Zustandsänderung eine Benachrichtigung. Dies nähert CoAP funktional an das Publish/Subscribe-Modell von MQTT an, bleibt aber semantisch im REST-Kontext.

#### **2.2.3 Block-wise Transfer und Sicherheit**

Um das Problem der IP-Fragmentierung zu vermeiden, die bei großen Payloads über 6LoWPAN auftreten kann, unterstützt CoAP den **Block-wise Transfer**. Große Datenmengen (z. B. Firmware-Images) werden auf Anwendungsebene in kleine Blöcke zerteilt und sequenziell übertragen.

Sicherheit wird in CoAP primär durch **DTLS (Datagram Transport Layer Security)** gewährleistet. DTLS ist das UDP-Äquivalent zu TLS. Es bietet Verschlüsselung und Authentifizierung, bringt aber Herausforderungen beim Handshake mit sich, da Paketverluste während des Schlüsselaustauschs komplexer zu handhaben sind als bei TCP.

### **2.3 Vergleichende Performance-Analyse: MQTT vs. CoAP**

Die Entscheidung zwischen MQTT und CoAP ist oft eine Abwägung zwischen Netzwerkstabilität, Energieprofil und architektonischer Präferenz. Aktuelle Studien 1 zeigen differenzierte Ergebnisse:

* **Latenz und Durchsatz:** In Netzwerken mit geringer Paketverlustrate bietet MQTT oft eine geringere Latenz als CoAP, da die TCP-Flusskontrolle optimiert ist, um den Durchsatz zu maximieren. CoAP hingegen leidet in High-Traffic-Szenarien unter dem Mangel an integrierter Überlastungskontrolle (Congestion Control).  
* **Energieverbrauch:** CoAP hat einen signifikanten Vorteil bei Geräten, die extrem selten senden und dazwischen tief schlafen. Da kein Verbindungsaufbau und \-abbau notwendig ist, kann ein Sensor aufwachen, ein UDP-Paket feuern und sofort wieder schlafen. Bei MQTT muss erst der TCP-Handshake und der MQTT-Connect durchlaufen werden, was wachzeit kostet.  
* **Netzwerkbedingungen:** In sehr verlustbehafteten Netzwerken (High Packet Loss Rate) kehrt sich das Bild teilweise um. Die aggressiven Retransmissions von TCP können zu einem Zusammenbruch der Verbindung führen („TCP Meltdown“), während CoAP durch fein abgestimmte Timeouts auf Anwendungsebene resilienter agieren kann – vorausgesetzt, die Anwendung ist korrekt implementiert.

## ---

**3\. Kurzstrecken-Netzwerke: Das lokale Geflecht**

Für die Kommunikation innerhalb eines begrenzten Radius (Personal Area Network, PAN), wie einem Smart Home, einem Bürogebäude oder einer Fabrikhalle, dominieren Technologien, die auf Mesh-Vernetzung und hohe Energieeffizienz ausgelegt sind.

### **3.1 IEEE 802.15.4 und der Mesh-Krieg: Zigbee vs. Thread**

Der Standard IEEE 802.15.4 bildet die physikalische Grundlage für viele Low-Power-Netzwerke. Er operiert meist im 2,4 GHz Band (weltweit) oder im Sub-GHz Bereich und definiert PHY und MAC Layer. Darauf bauen höhere Protokolle auf.

#### **3.1.1 Zigbee: Der etablierte Platzhirsch**

Zigbee ist seit fast zwei Jahrzehnten der dominante Standard für Hausautomation und industrielle Sensornetze. Es definiert einen kompletten Stack von der Netzwerkschicht bis zur Anwendungsschicht (Zigbee Cluster Library).

* **Mesh-Routing:** Zigbee nutzt ein Routing-Protokoll (AODV-basiert), bei dem netzgespeiste Geräte (Router) Nachrichten für batteriebetriebene Endgeräte weiterleiten. Dies erweitert die Reichweite signifikant über die Funkreichweite eines einzelnen Geräts hinaus.  
* **Nachteile:** Ein historisches Problem von Zigbee ist die Fragmentierung. Unterschiedliche Anwendungsprofile (z. B. Home Automation vs. Light Link) führten dazu, dass Geräte oft nicht interoperabel waren. Zudem ist Zigbee **nicht IP-basiert**. Ein Smartphone kann nicht direkt mit einer Zigbee-Lampe sprechen; es wird zwingend ein Gateway (Hub) benötigt, das auf Anwendungsebene Protokolle übersetzt. Dies schafft einen „Single Point of Failure“ und erhöht die Komplexität.6

#### **3.1.2 Thread: Das IP-Rückgrat der Zukunft**

Thread wurde als Antwort auf die Limitierungen von Zigbee entwickelt und hat sich bis 2026 als fundamentale Technologie für das Smart Home etabliert.

* **6LoWPAN und IPv6:** Thread nutzt ebenfalls 802.15.4 Funk, setzt darauf aber **6LoWPAN** (IPv6 over Low Power Wireless Personal Area Networks) auf. Dies bedeutet, dass jedes Thread-Gerät eine echte IPv6-Adresse besitzt. Es gibt keine Übersetzung auf Anwendungsebene im Gateway (das hier Border Router heißt), sondern nur ein Routing von IP-Paketen.  
* **Kein Single Point of Failure:** Thread-Netzwerke sind selbstheilend. Fällt ein Border Router aus, können andere Router im Mesh dessen Rolle übernehmen (sofern Hardware-seitig möglich). Die Rolle des „Leaders“, der das Netzwerk verwaltet, wird dynamisch vergeben.  
* **Thread 1.4 (2025):** Mit der Version 1.4 wurden entscheidende Probleme gelöst. Zuvor bildeten Border Router verschiedener Hersteller (z. B. Apple HomePod und Google Nest Hub) oft getrennte Thread-Netzwerke. Thread 1.4 ermöglicht es diesen Geräten, einem einzigen, einheitlichen Mesh-Netzwerk beizutreten und den Internetzugang zu teilen („Credential Sharing“). Zudem standardisiert es den Internetzugang für Thread-Geräte, was Cloud-Konnektivität vereinfacht.8

### **3.2 Bluetooth Low Energy (BLE) und Mesh**

BLE ist durch seine Allgegenwart in Smartphones einzigartig positioniert. Für das IoT ist vor allem **BLE Mesh** relevant.

* **Managed Flooding:** Im Gegensatz zum Routing-Ansatz von Thread nutzt BLE Mesh ein „Managed Flooding“. Nachrichten werden an alle Geräte in Reichweite gesendet, die sie wiederum weiterleiten (mit Mechanismen zur Vermeidung von Endlosschleifen wie TTL und Message Cache).  
* **Performance:** Studien zeigen, dass BLE Mesh für kleine Netzwerke und einfache Befehle (z. B. Licht an/aus) sehr effizient ist. In großen Netzwerken mit hoher Datendichte (viele Sensoren senden Telemetrie) skaliert der Flooding-Ansatz jedoch schlechter als das Routing von Thread oder Zigbee, da die Bandbreite durch redundante Pakete verstopft wird.11

### **3.3 Wi-Fi 6 und 7: Der schlafende Riese erwacht**

Lange galt Wi-Fi als zu energiehungrig für IoT-Sensoren. Dies hat sich mit **Wi-Fi 6 (802.11ax)** und **Wi-Fi 7** geändert.

* **Target Wake Time (TWT):** Dieses Feature erlaubt es Client und Access Point, feste Zeiten auszuhandeln, zu denen das Gerät aufwacht. Dazwischen kann das WLAN-Radio komplett abgeschaltet werden. Dies ermöglicht Batterielaufzeiten von Monaten oder Jahren, vergleichbar mit Zigbee, jedoch mit dem Vorteil der direkten Cloud-Anbindung ohne zusätzlichen Hub.13

## ---

**4\. Weitbereichsnetze (LPWAN): Kilometerweite Reichweite bei minimaler Energie**

Low Power Wide Area Networks (LPWAN) füllen die Lücke zwischen lokalen Netzen (kurze Reichweite) und klassischem Mobilfunk (hoher Energieverbrauch). Sie sind optimiert für geringe Datenraten, hohe Reichweiten (10–50 km) und lange Batterielaufzeiten (10+ Jahre).

### **4.1 LoRaWAN (Long Range Wide Area Network)**

LoRaWAN operiert im unlizenzierten Sub-GHz-Spektrum (ISM-Band, z. B. 868 MHz in Europa).

* **Physikalische Schicht (LoRa):** Die Basis ist die Chirp Spread Spectrum (CSS) Modulation. Sie kodiert Daten in Frequenz-Chirps, was das Signal extrem robust gegen Rauschen und Interferenzen macht. Durch Variation des Spreading Factors (SF7 bis SF12) kann die Reichweite auf Kosten der Datenrate dynamisch angepasst werden (Adaptive Data Rate, ADR).  
* **Netzwerkarchitektur:** LoRaWAN nutzt eine Sterntopologie. Endgeräte senden direkt an Gateways, die die Pakete an einen zentralen Netzwerkserver weiterleiten.  
* **Privat vs. Öffentlich:** Ein entscheidender Vorteil von LoRaWAN ist die Möglichkeit, private Netzwerke aufzubauen („Campus-Netze“), ohne von Telekommunikationsanbietern abhängig zu sein. Dies macht es attraktiv für Smart Cities und Industrieareale.14  
* **Satelliten-IoT:** Neue Entwicklungen wie LR-FHSS (Long Range \- Frequency Hopping Spread Spectrum) ermöglichen die direkte Kommunikation von Sensoren zu LEO-Satelliten, was eine globale Abdeckung in extrem abgelegenen Gebieten (Meere, Wüsten) ermöglicht.14

### **4.2 NB-IoT (Narrowband IoT)**

NB-IoT ist ein zellularer Standard der 3GPP (eingeführt in Release 13), der im lizenzierten Spektrum der Mobilfunkbetreiber läuft.

* **Technologie:** Es nutzt schmale Frequenzbänder (180 kHz, entspricht einem LTE Resource Block) und kann innerhalb eines LTE-Trägers (In-Band), im Schutzband (Guard-Band) oder standalone betrieben werden.  
* **Vorteile:** Durch die Nutzung des lizenzierten Spektrums gibt es keine Interferenzen mit anderen Geräten, und die Quality of Service (QoS) ist höher als bei LoRaWAN. Die Signalpenetration in Gebäude („Deep Indoor Coverage“) ist durch aggressive Wiederholungsmechanismen (Repetitions) extrem hoch.  
* **Energie:** Funktionen wie **PSM (Power Saving Mode)** und **eDRX (Extended Discontinuous Reception)** erlauben es Geräten, für lange Zeiträume (bis zu Tagen) nicht erreichbar zu sein, um Energie zu sparen.

### **4.3 Der Vergleich: LoRaWAN vs. NB-IoT**

Die Wahl zwischen LoRaWAN und NB-IoT ist 2026 eine der häufigsten strategischen Entscheidungen:

* **Kostenmodell:** LoRaWAN erfordert Investitionen in eigene Infrastruktur (Gateways) (CAPEX), hat aber geringe laufende Kosten. NB-IoT folgt einem OPEX-Modell mit monatlichen Gebühren pro SIM/Gerät an den Provider.  
* **Reichweite und Dichte:** NB-IoT bietet bessere Gebäudedurchdringung und Skalierbarkeit in sehr dichten urbanen Umgebungen. LoRaWAN ist unschlagbar in ländlichen Gebieten oder dort, wo keine Mobilfunkabdeckung existiert.  
* **Roaming:** NB-IoT bietet weltweites Roaming über Mobilfunkverträge. LoRaWAN-Roaming ist technisch möglich, aber organisatorisch oft komplexer zwischen verschiedenen Netzbetreibern.14

## ---

**5\. Die nächste Generation zellularer Konnektivität: 5G RedCap**

Mit der Einführung von 5G hat sich die Landschaft weiterentwickelt. Doch „volles“ 5G ist für viele IoT-Anwendungen zu teuer und energieintensiv. Hier kommt **5G RedCap (Reduced Capability)**, auch bekannt als NR-Light, ins Spiel (eingeführt mit 3GPP Release 17).

### **5.1 Die Lücke schließen**

RedCap positioniert sich genau zwischen den LPWAN-Technologien (NB-IoT/LTE-M) und den Hochleistungs-5G-Diensten (eMBB/URLLC). Es ersetzt mittelfristig die LTE-Kategorien Cat-1 und Cat-4.

* **Technische Spezifikationen:** RedCap-Geräte nutzen nur 20 MHz Bandbreite (statt 100 MHz bei 5G) und reduzieren die Anzahl der Empfangsantennen auf eine oder zwei. Dies senkt die Komplexität und Kosten des Modems drastisch.  
* **Leistung:** Es bietet Datenraten von ca. 85 bis 150 Mbps und Latenzen im Bereich von 10-20 ms. Dies ist ausreichend für Videoüberwachung, industrielle Telematik und fortschrittliche Wearables (wie AR-Brillen), die mehr Daten benötigen, als NB-IoT liefern kann.17  
* **Energieeffizienz:** Durch Features wie **Extended DRX** und reduziertes Monitoring von Kontrollkanälen ist RedCap deutlich effizienter als Standard-5G, erreicht aber nicht ganz die Batterielaufzeiten von NB-IoT.

### **5.2 Release 18: eRedCap**

Mit 3GPP Release 18 wurde **eRedCap** (enhanced RedCap) spezifiziert, das die Bandbreite weiter auf 5 MHz reduziert und Datenraten um 10 Mbps anvisiert. Dies zielt darauf ab, LTE Cat-1bis direkt zu ersetzen und eine noch kostengünstigere 5G-IoT-Klasse zu schaffen.19

## ---

**6\. Vergleichende Analyse: Szenarien und Metriken**

Um die Eignung der Protokolle zu bewerten, ist eine quantitative Gegenüberstellung der Schlüsselmetriken unerlässlich.

### **6.1 Übersichtstabelle der Kommunikationstechnologien (Stand 2026\)**

| Technologie | Frequenzspektrum | Topologie | Max. Datenrate | Latenz (Typisch) | Reichweite (Freifeld) | Batterielebensdauer\* | Primäres Einsatzgebiet |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| **LoRaWAN** | Unlizenziert (Sub-GHz) | Stern | 0,3 – 50 kbps | Sekunden bis Minuten | 10 – 15 km | \> 10 Jahre | Agrarwirtschaft, Smart City Metering |
| **NB-IoT** | Lizenziert (LTE Band) | Stern | \< 250 kbps | 1,5 – 10 s | \< 10 km (hohe Penetration) | 7 – 10 Jahre | Stationäre Sensoren, Smart Metering |
| **Sigfox** | Unlizenziert (Sub-GHz) | Stern | 100 bps (12 Byte) | Sekunden | Global (0G Netz) | \> 10 Jahre | Einfaches Asset Tracking, Backups |
| **LTE-M** | Lizenziert | Stern | \~ 1 Mbps | 50 – 100 ms | Mobilfunknetz | 5 – 7 Jahre | Mobile Asset Tracking, Health Monitor |
| **5G RedCap** | Lizenziert (5G NR) | Stern | \~ 150 Mbps | 10 – 20 ms | Mobilfunknetz | Tage bis Wochen | Ind. Kameras, Wearables, AGVs |
| **Thread** | Unlizenziert (2.4 GHz) | Mesh | 250 kbps | \< 100 ms | Mesh-abhängig | 2 – 5 Jahre | Smart Home Automation |
| **Wi-Fi 6 (TWT)** | Unlizenziert (2.4/5 GHz) | Stern | \> 100 Mbps | \< 10 ms | 50 – 100 m | Monate bis Jahre | High-Data Sensoren, Video Doorbells |

*\*Die Batterielebensdauer variiert stark je nach Sendeintervall, Payload und Empfangsbedingungen.* Quellen: 6

### **6.2 Szenario-Analyse**

#### **6.2.1 Das Smart Home**

Im Smart Home der Jahre 2025/2026 hat **Thread** in Kombination mit **Wi-Fi** den Sieg davongetragen. Die direkte IP-Adressierbarkeit ermöglicht eine nahtlose Integration. Zigbee bleibt aufgrund der riesigen installierten Basis relevant, wird aber bei Neuinstallationen zunehmend verdrängt. Bluetooth spielt eine Rolle für die Ad-hoc-Verbindung und Konfiguration (Commissioning), aber weniger als primäres Datennetzwerk.

#### **6.2.2 Die Smart City**

Hier existiert eine Zweiteilung. Für kritische Infrastruktur (Ampelsteuerung, Überwachung) wird auf Glasfaser und 5G gesetzt. Für die massive Sensorik (Mülltonnenfüllstand, Parksensoren, Bodenfeuchte in Parks) dominiert **LoRaWAN**. Viele Städte bauen eigene LoRaWAN-Netze auf, um Datensouveränität zu behalten und Betriebskosten zu senken. NB-IoT ergänzt dies dort, wo Mobilfunkbetreiber aggressive Preismodelle anbieten.

#### **6.2.3 Industrie 4.0 (IIoT)**

In der Industrie ist Determinismus (Vorhersehbarkeit der Latenz) König. **5G URLLC** und private 5G-Campusnetze ermöglichen erstmals kabellose Steuerung von Robotern in Echtzeit. Kabelgebunden setzt sich **Ethernet-APL** durch, das Ethernet bis zum Feldsensor bringt und damit alte Feldbusse (Profibus, Modbus RTU) ablöst. Auf Protokollebene kämpfen OPC UA und MQTT um die Vorherrschaft (siehe Abschnitt 7).

## ---

**7\. Standards und Interoperabilität: Der Weg aus dem Fragmentierungs-Dschungel**

Die Koexistenz so vieler Lösungen führte in der Vergangenheit zu massiver Fragmentierung. Geräte waren in „Walled Gardens“ gefangen. Zwei große Initiativen adressieren dies nun erfolgreich.

### **7.1 Matter: Die Vereinheitlichung des Smart Home**

Matter (entwickelt von der Connectivity Standards Alliance, CSA) ist ein IP-basierter Standard auf der Anwendungsschicht. Er definiert ein gemeinsames Datenmodell für Geräte, egal ob sie über Wi-Fi, Thread oder Ethernet verbunden sind.

* **Lokale Steuerung:** Ein Paradigmenwechsel von Matter ist der Fokus auf lokale Kommunikation. Steuerbefehle laufen nicht mehr zwingend über die Cloud des Herstellers, was Latenz reduziert und Privatsphäre erhöht. Cloud-Dienste sind optional für Fernzugriff.  
* **Multi-Admin:** Matter erlaubt es, ein Gerät gleichzeitig in mehrere Ökosysteme einzubinden (z. B. Apple Home und Amazon Alexa parallel).  
* **Version 1.4:** Die neuesten Updates haben die Unterstützung für Energiemanagement (Wärmepumpen, Solar, Batterien) massiv ausgebaut, was Matter zu einem Schlüsselelement der Energiewende im Haushalt macht.20

### **7.2 Industrial IoT: OPC UA FX vs. MQTT Sparkplug**

In der Industrie gibt es einen Richtungsstreit bei der IT/OT-Konvergenz (Verschmelzung von Information Technology und Operational Technology).

* **OPC UA FX (Field eXchange):** Dies ist der Ansatz der klassischen Automatisierer. OPC UA wird um TSN (Time Sensitive Networking) erweitert, um deterministische Echtzeitkommunikation bis in die Feldebene zu ermöglichen. Es nutzt ein komplexes, semantisch reiches Datenmodell (Client/Server und Pub/Sub).  
* **MQTT Sparkplug B:** Dieser Ansatz kommt aus der IT-Ecke. Da MQTT selbst keine Datenstruktur vorgibt, definiert Sparkplug B eine Standard-Payload und Topic-Struktur. Dies ermöglicht eine **Unified Namespace (UNS)** Architektur, bei der alle Daten aller Maschinen in einen zentralen Broker fließen, auf den ERP-, MES- und SCADA-Systeme zugreifen. Sparkplug gilt als einfacher und skalierbarer, während OPC UA FX mächtiger in der Modellierung komplexer Maschinenzustände ist.22

## ---

**8\. Sicherheit im IoT: Von Lightweight Cryptography bis Zero Trust**

Sicherheit ist im IoT kritisch, da Angriffe physische Konsequenzen haben können. Die Ressourcenbeschränkung vieler Geräte machte Standard-Kryptographie (wie RSA) lange unmöglich.

### **8.1 NIST Lightweight Cryptography (LWC)**

Im Jahr 2025 hat das NIST (National Institute of Standards and Technology) den Standardisierungsprozess für Lightweight Cryptography abgeschlossen und die Algorithmen-Familie **Ascon** als Standard ausgewählt. Ascon ist für kleinste Mikrocontroller optimiert und bietet authentifizierte Verschlüsselung mit minimalem Speicherbedarf und Energieverbrauch. Dies schließt eine kritische Sicherheitslücke für Sensoren, die bisher unverschlüsselt funkten.25

### **8.2 Sicherheitsarchitekturen**

Moderne IoT-Sicherheit setzt auf **Zero Trust**. Jedes Gerät muss sich authentifizieren, idealerweise mittels Zertifikaten (X.509), die in manipulationssicheren Hardware-Modulen (Secure Elements) gespeichert sind. Matter schreibt beispielsweise vor, dass jedes Gerät ein Device Attestation Certificate (DAC) besitzt, das seine Echtheit und Zertifizierung kryptographisch beweist.

## ---

**9\. Auswertung relevanter Forschungsliteratur**

Für das Referat sollten folgende aktuelle wissenschaftliche Arbeiten (Papers) analysiert werden, die den „State of the Art“ repräsentieren:

1. **"A Comprehensive Systematic Survey of IoT Protocols: Implications for Data Quality and Performance"** (Saleem et al., IEEE Access, Oktober 2024).  
   * *Relevanz:* Dieses Paper bietet den aktuellsten und umfassendsten systematischen Überblick. Es kategorisiert Protokolle nicht nur technisch, sondern analysiert deren Einfluss auf Datenqualität (Genauigkeit, Vollständigkeit, Aktualität). Es ist die perfekte Basisquelle für den theoretischen Teil des Referats.27  
2. **"Performance evaluation of CoAP and MQTT with security support for IoT environments"** (Seoane et al., Computer Networks, aktualisiert/zitiert im 2025-Kontext).  
   * *Relevanz:* Diese Arbeit liefert harte empirische Daten. Sie vergleicht Latenz, Durchsatz und Energieverbrauch von MQTT und CoAP unter realen Bedingungen, inklusive der Auswirkungen von Paketverlusten und der Overhead-Kosten durch DTLS/TLS-Verschlüsselung. Dies ist essenziell für den Performance-Vergleich im Referat.29  
3. **"Comparative Analysis of IoT Communication Standards: LoRaWAN, NB-IoT/LTE-M, NTN NB-IoT, and 5G RedCap"** (Trinc et al., 2025).  
   * *Relevanz:* Dieses Paper schließt die Lücke zu den neuesten Weitbereichstechnologien. Es ist besonders wertvoll, da es auch die neuen Satelliten-IoT (Non-Terrestrial Networks, NTN) und 5G RedCap Optionen technisch bewertet, die in älteren Papers fehlen.31  
4. **"Performance Analysis of 5G RedCap and eRedCap"** (Joerke et al., Globecom 2025).  
   * *Relevanz:* Bietet ein vertieftes technisches Verständnis der Simulation und Energieanalyse von RedCap-Geräten. Wichtig, um die Positionierung von 5G im Vergleich zu LPWAN zu argumentieren.19  
5. **"Thread 1.4 Specification White Paper"** (Thread Group, Ende 2024).  
   * *Relevanz:* Als Primärquelle unabdingbar, um die neuesten Entwicklungen im Smart Home Networking (Credential Sharing, Border Router Standardisierung) korrekt darzustellen.10

## **10\. Fazit und Ausblick**

Die Analyse zeigt, dass sich die IoT-Kommunikationslandschaft im Jahr 2026 von einer Phase der wilden Experimente hin zu einer Konsolidierung bewegt. Der „Krieg der Protokolle“ weicht einer pragmatischen Koexistenz, die durch IP-Konnektivität (IPv6) und Anwendungsschicht-Standards (Matter, OPC UA) ermöglicht wird.

Wichtige Erkenntnisse für das Referat:

* **Kein „One Size Fits All“:** Die Physik lässt sich nicht überlisten. Hohe Reichweite, hohe Bandbreite und niedriger Energieverbrauch schließen sich gegenseitig aus (das IoT-Trilemma). Die Wahl des Protokolls muss strikt an den Anwendungsfall gekoppelt sein.  
* **IP is King:** Proprietäre Silos sterben aus. Technologien, die natives IP unterstützen (Thread, Wi-Fi 6, 5G), gewinnen langfristig, da sie sich nahtloser in die Internet-Architektur integrieren lassen.  
* **Sicherheit ist Standard:** Mit Standards wie Matter und Ascon-Kryptographie gibt es keine Entschuldigung mehr für unsichere IoT-Geräte.

Für zukünftige Entwicklungen sollte ein Auge auf die Integration von **Künstlicher Intelligenz am Edge (TinyML)** geworfen werden, die die Notwendigkeit zur Datenübertragung reduzieren könnte, indem Daten direkt auf dem Sensor verarbeitet werden, sowie auf die fortschreitende Verschmelzung von terrestrischen und satellitengestützten Netzen zu einer wahren globalen Konnektivität.

#### **Referenzen**

1. Performance evaluation of CoAP and MQTT with ... \- IoTMadLab, Zugriff am Januar 26, 2026, [https://iotmadlab.es/wp-content/uploads/2023/10/Performance\_CN\_2021.pdf](https://iotmadlab.es/wp-content/uploads/2023/10/Performance_CN_2021.pdf)  
2. CoAP vs. MQTT-SN: Comparison and Performance Evaluation in Publish-Subscribe Environments, Zugriff am Januar 26, 2026, [https://re.public.polimi.it/retrieve/e0c31c12-218b-4599-e053-1705fe0aef77/palmese\_wfiot.pdf](https://re.public.polimi.it/retrieve/e0c31c12-218b-4599-e053-1705fe0aef77/palmese_wfiot.pdf)  
3. A Survey of Communication Protocols for Internet-of-Things and Related Challenges of Fog and Cloud Computing Integration \- IC/Unicamp, Zugriff am Januar 26, 2026, [https://www.ic.unicamp.br/\~celio/mc853/iotprotocols/ACMIOTCsurveys.pdf](https://www.ic.unicamp.br/~celio/mc853/iotprotocols/ACMIOTCsurveys.pdf)  
4. A comparative analysis and implementation of CoAP and MQTT protocol for IoT communication | Request PDF \- ResearchGate, Zugriff am Januar 26, 2026, [https://www.researchgate.net/publication/392635317\_A\_comparative\_analysis\_and\_implementation\_of\_CoAP\_and\_MQTT\_protocol\_for\_IoT\_communication](https://www.researchgate.net/publication/392635317_A_comparative_analysis_and_implementation_of_CoAP_and_MQTT_protocol_for_IoT_communication)  
5. MQTT vs CoAP: Comparing Protocols for IoT Connectivity | EMQ \- EMQX, Zugriff am Januar 26, 2026, [https://www.emqx.com/en/blog/mqtt-vs-coap](https://www.emqx.com/en/blog/mqtt-vs-coap)  
6. IoT Communication Protocols: LoRaWAN Dominates 2025 \- Uniconverge Technologies, Zugriff am Januar 26, 2026, [https://www.uniconvergetech.in/blog/iot-communication-protocols-lorawan/](https://www.uniconvergetech.in/blog/iot-communication-protocols-lorawan/)  
7. IoT Protocols: Bluetooth, WiFi, ZigBee Compared \- ALLPCB, Zugriff am Januar 26, 2026, [https://www.allpcb.com/allelectrohub/iot-protocols-bluetooth-wifi-zigbee-compared](https://www.allpcb.com/allelectrohub/iot-protocols-bluetooth-wifi-zigbee-compared)  
8. Thread releases 1.4 specification \- IOT Insider, Zugriff am Januar 26, 2026, [https://www.iotinsider.com/smart-home/thread-releases-1-4-specification/](https://www.iotinsider.com/smart-home/thread-releases-1-4-specification/)  
9. Thread 1.4 Released: Finally the One Home Network to Rule Them All? | Matter Alpha, Zugriff am Januar 26, 2026, [https://www.matteralpha.com/thread/thread-1-4-released-finally-the-one-home-network-to-rule-them-all](https://www.matteralpha.com/thread/thread-1-4-released-finally-the-one-home-network-to-rule-them-all)  
10. Thread 1.4 Features white paper, Zugriff am Januar 26, 2026, [https://www.threadgroup.org/Portals/0/Documents/Thread\_1.4\_Features\_White\_Paper\_September\_2024.pdf](https://www.threadgroup.org/Portals/0/Documents/Thread_1.4_Features_White_Paper_September_2024.pdf)  
11. Benchmarking Bluetooth Mesh, Thread, and Zigbee Network Performance \- Silicon Labs, Zugriff am Januar 26, 2026, [https://www.silabs.com/wireless/multiprotocol/mesh-performance](https://www.silabs.com/wireless/multiprotocol/mesh-performance)  
12. 10 Reasons why BLE Mesh Has Struggled to Gain Traction \- Argenox, Zugriff am Januar 26, 2026, [https://argenox.com/blog/10-reasons-why-ble-mesh-has-struggled-to-gain-traction](https://argenox.com/blog/10-reasons-why-ble-mesh-has-struggled-to-gain-traction)  
13. State of IoT 2025: Number of connected IoT devices growing 14% to 21.1 billion globally, Zugriff am Januar 26, 2026, [https://iot-analytics.com/number-connected-iot-devices/](https://iot-analytics.com/number-connected-iot-devices/)  
14. NB-IoT Vs LoRaWAN: An Essential Comparison Of The Two IoT Technologies \- Lansitec, Zugriff am Januar 26, 2026, [https://www.lansitec.com/blogs/nb-iot-vs-lorawan-a-comparison-of-the-two-iot-technologies/](https://www.lansitec.com/blogs/nb-iot-vs-lorawan-a-comparison-of-the-two-iot-technologies/)  
15. LoRaWAN vs NB-IoT Case Study for Battery-Powered Industrial Sensors, Zugriff am Januar 26, 2026, [https://www.uniconvergetech.in/blog/lorawan-vs-nb-iot-battery-powered-case/](https://www.uniconvergetech.in/blog/lorawan-vs-nb-iot-battery-powered-case/)  
16. Building Massive IoT with LoRaWAN®: Insights from IoTSWC 2025 \- Semtech Blog, Zugriff am Januar 26, 2026, [https://blog.semtech.com/building-massive-iot-with-lorawan-insights-from-iotswc-2025](https://blog.semtech.com/building-massive-iot-with-lorawan-insights-from-iotswc-2025)  
17. 5G RedCap: Benefits, Use Cases & Deployment Considerations \[2025\] \- floLIVE, Zugriff am Januar 26, 2026, [https://flolive.net/blog/glossary/5g-redcap-benefits-use-cases-and-deployment-considerations-2025/](https://flolive.net/blog/glossary/5g-redcap-benefits-use-cases-and-deployment-considerations-2025/)  
18. 5G RedCap and the Future of IoT Connectivity \- Zipit Wireless, Zugriff am Januar 26, 2026, [https://www.zipitwireless.com/blog/5g-redcap-and-the-future-of-iot-connectivity](https://www.zipitwireless.com/blog/5g-redcap-and-the-future-of-iot-connectivity)  
19. Filling a Gap? Performance Comparison of RedCap and eRedCap for Mid-Tier Applications \- CNI \- TU Dortmund, Zugriff am Januar 26, 2026, [https://cni.etit.tu-dortmund.de/storages/cni-etit/r/Research/Publications/2025/Joerke\_2025\_GLOBECOM/Joerke\_GLOBECOM2025\_AuthorsVersion.pdf](https://cni.etit.tu-dortmund.de/storages/cni-etit/r/Research/Publications/2025/Joerke_2025_GLOBECOM/Joerke_GLOBECOM2025_AuthorsVersion.pdf)  
20. Matter 1.4 Is Here, But What Does It Add to Your Smart Home?, Zugriff am Januar 26, 2026, [https://www.matteralpha.com/news/matter-1-4-is-here](https://www.matteralpha.com/news/matter-1-4-is-here)  
21. Matter 1.4 Enables More Capable Smart Homes \- CSA-IOT, Zugriff am Januar 26, 2026, [https://csa-iot.org/newsroom/matter-1-4-enables-more-capable-smart-homes/](https://csa-iot.org/newsroom/matter-1-4-enables-more-capable-smart-homes/)  
22. Choosing Between MQTT and OPC UA for Smart Automation and Manufacturing | Balluff, Zugriff am Januar 26, 2026, [https://www.balluff.com/en-us/blog/choosing-between-mqtt-and-opc-ua-for-smart-automation-and-manufacturing](https://www.balluff.com/en-us/blog/choosing-between-mqtt-and-opc-ua-for-smart-automation-and-manufacturing)  
23. MQTT vs OPC UA: Why This Question Never Has a Straight Answer \- FlowFuse, Zugriff am Januar 26, 2026, [https://flowfuse.com/blog/2026/01/opcua-vs-mqtt/](https://flowfuse.com/blog/2026/01/opcua-vs-mqtt/)  
24. OPC UA Pub/Sub vs. Eclipse Sparkplug B: Choosing the Right MQTT Strategy | GRiSP, Zugriff am Januar 26, 2026, [https://www.grisp.org/blog/posts/2025-07-18-sparkplug-vs-opcuapubsub](https://www.grisp.org/blog/posts/2025-07-18-sparkplug-vs-opcuapubsub)  
25. NIST Finalizes 'Lightweight Cryptography' Standard to Protect Small Devices, Zugriff am Januar 26, 2026, [https://www.nist.gov/news-events/news/2025/08/nist-finalizes-lightweight-cryptography-standard-protect-small-devices](https://www.nist.gov/news-events/news/2025/08/nist-finalizes-lightweight-cryptography-standard-protect-small-devices)  
26. NIST Publishes SP 800-232 | CSRC, Zugriff am Januar 26, 2026, [https://csrc.nist.gov/News/2025/nist-publishes-sp-800-232](https://csrc.nist.gov/News/2025/nist-publishes-sp-800-232)  
27. A Comprehensive Systematic Survey of IoT Protocols: Implications for Data Quality and Performance \- IEEE Xplore, Zugriff am Januar 26, 2026, [https://ieeexplore.ieee.org/iel8/6287639/6514899/10736640.pdf](https://ieeexplore.ieee.org/iel8/6287639/6514899/10736640.pdf)  
28. IoT network and data based protocols. | Download Scientific Diagram \- ResearchGate, Zugriff am Januar 26, 2026, [https://www.researchgate.net/figure/oT-network-and-data-based-protocols\_fig5\_385339015](https://www.researchgate.net/figure/oT-network-and-data-based-protocols_fig5_385339015)  
29. Performance evaluation of CoAP and MQTT with security support for IoT environments, Zugriff am Januar 26, 2026, [https://www.researchgate.net/publication/353520420\_Performance\_evaluation\_of\_CoAP\_and\_MQTT\_with\_security\_support\_for\_IoT\_environments](https://www.researchgate.net/publication/353520420_Performance_evaluation_of_CoAP_and_MQTT_with_security_support_for_IoT_environments)  
30. Internet of Things: A Survey on Enabling Technologies, Protocols and Applications, Zugriff am Januar 26, 2026, [https://www.researchgate.net/publication/279177017\_Internet\_of\_Things\_A\_Survey\_on\_Enabling\_Technologies\_Protocols\_and\_Applications](https://www.researchgate.net/publication/279177017_Internet_of_Things_A_Survey_on_Enabling_Technologies_Protocols_and_Applications)  
31. Comparative Analysis of Iot Communication Standards: Lorawan, NB-Iot/LTE-M, NTN NB-Iot, and 5G Redcap \- ResearchGate, Zugriff am Januar 26, 2026, [https://www.researchgate.net/publication/394626470\_Comparative\_Analysis\_of\_Iot\_Communication\_Standards\_Lorawan\_NB-IotLTE-M\_NTN\_NB-Iot\_and\_5G\_Redcap](https://www.researchgate.net/publication/394626470_Comparative_Analysis_of_Iot_Communication_Standards_Lorawan_NB-IotLTE-M_NTN_NB-Iot_and_5G_Redcap)