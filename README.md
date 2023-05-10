# GermanMiner API (Minecraft Server)

Dieses Projekt zeigt die Verwendung der GermanMiner API zur Durchführung verschiedener Bank- und Geschäftsoperationen. Es bietet eine Befehlszeilenschnittstelle, um mit den API-Endpunkten zu interagieren und Informationen zu Banktransaktionen, Kontodetails, Kontoauszügen und Geschäftsinventar abzurufen.

# Voraussetzungen
* `Dart SDK`
* `http Paket`


# Erste Schritte
 1. Klone das Repository auf deinen lokalen Rechner.
 2. Öffne das Projekt in deinem bevorzugten Dart-Editor.
 3. Installiere die benötigten Abhängigkeiten, indem du den folgenden Befehl im Projektverzeichnis ausführst:

```dart
dart pub get
```
 4. Organisiere dir einen API-Schlüssel von GermanMiner (In Minecraft).
 5. Ersetze 'api-key-here' in der main Funktion durch deinen tatsächlichen API-Schlüssel.

# Verwendung
 1. Starte die Dart-Anwendung, indem du den folgenden Befehl im Projektverzeichnis ausführst:
```dart
dart main.dart
```
 2. Die Anwendung zeigt ein Menü mit den verfügbaren Operationen an:

```markdown
⁕ GermanMiner API ⁕

Welche Aktion möchtest du ausführen?
1. Banktransaktion
2. Liste verfügbarer Konten abrufen
3. Kontoauszug abrufen
4. Kontoinformationen abrufen
5. Lagerbestand eines BIZ abrufen
```
 3. Gib die Nummer der gewünschten Aktion ein und drücke Enter.
 4. Gib die erforderlichen Informationen gemäß den Anweisungen ein.
 5. Die Anwendung sendet eine API-Anfrage basierend auf der ausgewählten Aktion und zeigt die Antwort an.

# Verfügbare Aktionen
 1. **Banktransaktion:** Führe eine Banktransaktion durch, indem du die Kontonummer, die Zielkontonummer, den Betrag und eine Nachricht eingibst.
 2. **Liste verfügbarer Konten abrufen:** Rufe eine Liste der verfügbaren Konten ab.
 3. **Kontoauszug abrufen:** Rufe den Kontoauszug eines Bankkontos ab, indem du die Kontonummer und die Seitennummer eingibst.
 4. **Kontoinformationen abrufen:** Rufe die Informationen eines Bankkontos ab, indem du die Kontonummer eingibst.
 5. **Lagerbestand eines BIZ abrufen:** Rufe das Inventar eines BIZ ab, indem du die Geschäfts-ID eingibst.

# API-Anfrage und -Antwort
Die Funktion _makeApiRequest sendet HTTP GET-Anfragen an die GermanMiner API-Endpunkte. Sie erhält die API-URL als Argument und verarbeitet die Antwort.

Wenn die Anfrage erfolgreich ist (Statuscode 200), wird die Antwort in einer formatierten JSON-Darstellung ausgegeben. Andernfalls wird eine entsprechende Fehlermeldung angezeigt.

# Mitwirken
Beiträge zu diesem Projekt sind willkommen. Wenn du Probleme findest oder neue Funktionen hinzufügen möchtest, kannst du gerne einen Pull Request öffnen.
