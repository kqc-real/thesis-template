# LaTeX-Vorlage für wissenschaftliche Abschlussarbeiten

Diese Vorlage bietet ein professionelles LaTeX-Setup für Bachelor- und Masterarbeiten im deutschsprachigen Raum. Sie ist nach akademischen und typografischen Konventionen optimiert und besonders für MINT-Themen geeignet.

## Inhaltsverzeichnis

1. Features
2. Voraussetzungen
3. Schnelleinstieg
4. Kompilierung
5. Verwendung
6. Projektstruktur
7. Häufige Anpassungen
8. Troubleshooting
9. Lizenz

## Features

- **Vorkonfiguriertes Layout:** Optimiert für Abschlussarbeiten (Bachelor/Master) mit KOMA-Script (`scrreprt`).
- **Typografie:** Sauberer Satzspiegel, deutsche Typografie (ngerman) oder Englisch.
- **Struktur:** Modulare Kapitel in `content/`, saubere Trennung von Inhalt und Logik.
- **MINT-Support:** Optimiert für Bilder, Tabellen, Code-Listings und TikZ.
- **Automatisierung:** `build.sh` Skript für einfache Kompilierung.
- **KI-Deklaration:** Vorbereitete Vorlagen für die Deklaration von KI-Hilfsmitteln (gemäß DFG-Empfehlungen).

## Voraussetzungen

- **LaTeX-Distribution:**
  - macOS: MacTeX (`brew install --cask mactex-no-gui`)
  - Windows: MiKTeX oder TeX Live
  - Linux: TeX Live (`sudo apt install texlive-full`)
- **Editor (Empfohlen):** VS Code mit der Extension **LaTeX Workshop**.
- **Tools:** `biber` (für Literaturverzeichnisse, meist in TeX Live enthalten).

## Schnelleinstieg

### 1. Projekt herunterladen

Mit Git:
```bash
git clone https://github.com/kqc-real/thesis-template.git
cd thesis-template
```

Alternativ: Als ZIP herunterladen und entpacken.

### 2. In VS Code öffnen

1. VS Code starten.
2. `Datei` → `Ordner öffnen...` → `thesis-template` auswählen.
3. Die Datei `Thesis.tex` öffnen.

## Kompilierung

### Automatisch (Empfohlen)

Das Skript `build.sh` automatisiert die notwendigen Schritte (pdflatex → biber → pdflatex), um Querverweise und das Literaturverzeichnis korrekt zu erstellen.

#### Optionen
- `./build.sh`: Standard-Kompilierung.
- `./build.sh clean`: Entfernt temporäre Dateien (build/, *.aux, *.log usw.).

*Falls das Skript nicht ausführbar ist:*
```bash
chmod +x build.sh
./build.sh
```

### Manuell

Falls das Skript nicht genutzt werden kann, führen Sie folgende Befehle nacheinander aus:

```bash
pdflatex Thesis.tex
biber Thesis
pdflatex Thesis.tex
pdflatex Thesis.tex
```

## Verwendung

### Metadaten anpassen

Öffnen Sie `Thesis.tex` und passen Sie die Variablen am Anfang der Datei an:

```tex
% Metadaten der Arbeit
\author{Max Mustermann}
\studentID{1234567}
\studentAddress{Musterstraße 1, 12345 Musterstadt}
\thesis{Bachelor-Thesis}
\title{Titel der Arbeit}
\academicTitle{Bachelor of Science}
\firstReferee{Prof. Dr. A. Müller}
\secondReferee{Prof. Dr. B. Schmidt}
```

### Inhalt schreiben

Der Inhalt liegt im Ordner `content/`. Jedes Kapitel hat eine eigene `.tex`-Datei (z. B. `01_Einfuehrung.tex`).
Diese werden in `Thesis.tex` mittels `\input{content/...}` eingebunden.

### Bilder einfügen

Bilder im Ordner `images/` ablegen:

```tex
\begin{figure}[ht]
  \centering
  \includegraphics[width=0.8\textwidth]{images/diagramm.png}
  \caption{Beschriftung des Diagramms}
  \label{fig:diagramm}
\end{figure}
```

### Literatur zitieren

1. Literaturquellen in `bib/BibtexDatabase.bib` im BibTeX-Format eintragen.
2. Im Text zitieren: `\cite{key}` oder `\textcite{key}`.

## Projektstruktur

```text
thesis-template/
├── Thesis.tex          # Hauptdatei (Einstiegspunkt)
├── Thesis.pdf          # Beispiel-Ausgabe
├── build.sh            # Kompilierungs- und Clean-Skript
├── content/            # Inhalt (Kapitel)
├── preambel/           # LaTeX-Einstellungen & Pakete
├── bib/                # Literaturdatenbank (.bib)
├── images/             # Abbildungen
├── macros/             # Eigene Makros/Befehle
└── docs_KI_GENERIERT/  # Optional: generierte Zusatzdokumentation
```

## Häufige Anpassungen

- **Sprache ändern:** In `Thesis.tex` die Zeile `\def\lang{ngerman}` zu `\def\lang{english}` ändern.
- **Schriftart:** In `preambel/Fonts.tex` können alternative Schriftarten (z. B. Palatino, Times) aktiviert werden.

## Troubleshooting

- **Kein PDF erstellt?** Prüfen Sie die Log-Datei (`Thesis.log`) auf Fehlermeldungen.
- **Fragezeichen statt Referenzen (??)?** Führen Sie die Kompilierung mehrfach aus oder nutzen Sie `./build.sh`.
- **Literatur fehlt?** Stellen Sie sicher, dass `biber` ausgeführt wurde.
- **Fehler `Undefined control sequence`:** Meist ein Tippfehler in einem Befehl oder ein fehlendes Paket.

## Lizenz

MIT License — siehe LICENSE.
