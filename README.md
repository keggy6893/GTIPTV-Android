# GT IPTV Player Pro – Android-Test 0.1.1

Dies ist eine eigenständige, geänderte Android-Portierung auf Grundlage der
hochgeladenen Enigma2-Sicherung von GT IPTV Player Pro 1.3.0. Noch keine
vollständige 1:1-Portierung und kein offizielles Android-Release des Originalautors.

Originalprojekt: https://github.com/VicTuS59/GT-IPTV-Player-Pro
Design und übernommene Originalgrafiken: Copyright (C) 2026 VicTuS59.
Lizenz dieser Portierung: GPL-2.0-or-later; vollständiger Text unter licenses/LICENSE.txt.
Herkunftsangaben aus der Vorlage liegen unverändert unter licenses/.
Die Android-Quellen wurden am 14.10.2026 neu erstellt. Es wird kein Enigma2-Python
auf Android ausgeführt. Keine Zugangsdaten aus der VU wurden übernommen.

## Aktueller Umfang

- Einstieg und Dashboard mit Originalgrafiken und den 1920×1080-Koordinaten
  aus main.py, proportional auf die TV-Auflösung skaliert.
- Eigenes Android-App-Paket de.gtiptv.android, Eintrag im Android-TV-Launcher.
- Fernbedienung: Pfeiltasten, OK, Zurück und Menü; zusätzlich Touchbedienung.
- Mehrere Xtream- und HTTP(S)-M3U-Quellen anlegen, bearbeiten und löschen.
- Verbindungstest mit Live-Senderanzahl. Zugangsdaten nur lokal in Android
  Keystore-verschlüsseltem App-Speicher; keine Cloud-Synchronisierung.
- Xtream-Kategorien für Live-TV, Filme und Serien; Episoden nach Staffel sortiert.
- M3U-Gruppen, Listenfilter, Favoriten, Wiedergabestand und Weiterschauen.
- Kurzer Xtream-EPG über die Eintragsaktionen. OK halten oder Menü in Listen.
- Wiedergabe mit Android VideoView/MediaPlayer und nativer Steuerung.
- YouTube-Schaltfläche öffnet die installierte YouTube-App bzw. einen Browser.

## Noch offen

Stalker/MAG, TV-Archiv/Catch-up, TMDB-Entdecken, Filmdetail- und Posteransichten,
Untertitelverwaltung, Downloads, Wetter, Themenwechsel, Listenreihenfolge,
Jugendschutz und vollständige Player-Funktionsgleichheit sind nicht portiert.
Die Live-TV-Kategorien sind nach dem Receiver-Skin aufgeteilt (acht Zeilen,
Nummern, Scrollanzeige, Farbtasten und Wetterbereich). Aktualisieren sowie
Ein-/Ausblenden von Kategorien sind verfügbar; der Wetterbereich enthält
noch keine Daten. Die übrigen Listen-/Formularansichten sind noch nicht
optisch 1:1 umgesetzt. Native Android-Medienunterstützung ist vom Gerät und
Stream abhängig; kein Media3/ExoPlayer, kein eingebautes YouTube-Streaming.
M3U-Dateiauswahl, M3U-spezifische Headeroptionen und XMLTV sind noch nicht enthalten.
Quellenauswahl/Theme der VU liegen außerhalb des Plugin-Ordners und wurden nicht
mitgeliefert. Der Einstieg nutzt deshalb die Originalgrafiken des Standarddesigns.
Nach Prozessneustart erscheint der Einstieg; kein automatisches Fortsetzen eines
zuvor laufenden Streams. Netzwerk-/Stream-Tests auf dem TCL stehen aus.

## Auf dem Windows-PC

Projektordner: C:\Users\bumse\Downloads\GTIPTV\GTIPTV-Android
Die separate VU-Sicherung bleibt daneben erhalten.

Zum Bauen in PowerShell:

    Set-Location 'C:\Users\bumse\Downloads\GTIPTV\GTIPTV-Android'
    powershell -NoProfile -ExecutionPolicy Bypass -File .\Build.ps1

Das Skript nutzt installierte Android SDK Build Tools und Java aus Android Studio.
Es benötigt keine zusätzlichen Gradle- oder Maven-Downloads. Der höchste lokale
SDK-Plattformordner mit android.jar wird verwendet (auf deinem PC android-37.0).
minSdk 26, targetSdk 34; vorgesehen für den lokalen Android-TV-Test, kein Store-Build.
Jeder Build bekommt ein neues Unterverzeichnis in build/.

APK: output\GTIPTV-Android-0.1.1-tvtest.apk

Zur Installation die **aktuell bestätigte ADB-Adresse inklusive Port** verwenden:

    powershell -NoProfile -ExecutionPolicy Bypass -File .\Install-TV.ps1 -Device 'TV-IP:ADB-PORT'

Ist genau ein Android-TV bereits per ADB verbunden, genügt:

    powershell -NoProfile -ExecutionPolicy Bypass -File .\Install-TV.ps1

Die automatische Auswahl prüft das Android-TV-Merkmal leanback. Bei mehreren
oder keinem verbundenen TV wird ohne Installation abgebrochen.

USB-/WLAN-Debugging am TV muss freigegeben sein. Das Skript führt kein Pairing,
keine Deinstallation und keinen Reset durch. Die VU-Adresse ist keine TV-Adresse.
Für Updates dieselbe .local/debug.keystore behalten. Es ist ein mitgelieferter
Entwicklungsschlüssel mit Testkennwort android; nicht für produktive Veröffentlichungen.

## Prüfung auf dem TV

1. App ist unter „Meine Apps“ sichtbar und lässt sich mit OK starten.
2. Einstieg/Dashboard: Originalgrafiken, gut lesbare Beschriftungen, sichtbarer Fokus.
3. Xtream-Quelle hinzufügen; Verbindung testen; Quelle speichern und verbinden.
4. Live-TV, Film und Serienepisode starten; Pause, Suche und Zurück testen.
5. Film nach mindestens 15 Sekunden verlassen und über Weiterschauen fortsetzen.
6. Favorit hinzufügen, App beenden/neu öffnen, Favorit erneut aufrufen.
7. M3U-Quelle testen; Gruppen und Suche prüfen.
8. Nicht portierte Menüpunkte zeigen einen klaren Hinweis.

Build-/Signaturprüfung und tatsächliche TV-Laufzeitprüfung sind getrennte Schritte.
