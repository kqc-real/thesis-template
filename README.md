# LaTeX-Vorlage für populärwissenschaftliche Artikel

Diese Vorlage bietet ein professionelles LaTeX-Setup für Seminararbeiten und populärwissenschaftliche Artikel im zweispaltigen Zeitschriftenlayout.

> **📄 Thesis-Template verfügbar!**  
> Für umfangreiche Abschlussarbeiten (Bachelor/Master) gibt es den Branch [`main`](../../tree/main) mit dem klassischen Thesis-Layout.
>
> ```bash
> # Zur Thesis-Vorlage wechseln:
> git checkout main
>
> # Zurück zum Artikel-Template:
> git checkout referat-template
> ```
>
> ⚠️ **Nicht mergen!** Die Branches sind eigenständige Templates und sollten nicht zusammengeführt werden.

## Features

- **Zweispaltiges Layout:** Professionelles Zeitschriften-Design mit `scrartcl`
- **Kompakte Typografie:** Optimiert für ca. 10 Seiten Umfang
- **Infoboxen:** Farbige Kästen für Definitionen und Zusammenfassungen
- **Literaturverzeichnis:** BibLaTeX mit numerischem Zitierstil
- **MINT-Support:** Bilder, Tabellen und einfache Formeln

## Voraussetzungen

- **LaTeX-Distribution:**
  - macOS: MacTeX (`brew install --cask mactex-no-gui`)
  - Windows: MiKTeX oder TeX Live
  - Linux: TeX Live (`sudo apt install texlive-full`)
- **Editor (Empfohlen):** VS Code mit der Extension **LaTeX Workshop**

## Schritt-für-Schritt für Windows-Einsteiger (ohne Konsole)

Diese Anleitung richtet sich an Personen ohne jede Erfahrung mit Installation, Konsole oder technischen Begriffen. Sie brauchen nur Maus und Tastatur.

### Was Sie vorher brauchen
- Windows 10 oder 11, Internetzugang und mindestens 5 GB freier Speicher.
- Etwa 30–60 Minuten Zeit, weil beim ersten Mal viele Dateien geladen werden.
- Administrator-Rechte: Wenn Windows nach „Möchten Sie zulassen …?“ fragt, klicken Sie „Ja“.

### Schritt 1: MiKTeX (LaTeX) installieren
1. **Browser öffnen:** Drücken Sie die Windows-Taste (Taste mit Windows-Logo links unten auf der Tastatur) einmal, tippen Sie „Edge“ und drücken Sie die Eingabetaste.
2. **Download-Seite öffnen:** Oben in die Adressleiste klicken, `https://miktex.org/download` eingeben, Enter drücken.
3. **Installer laden:** Scrollen Sie zu „Windows“ und klicken Sie auf „Download“. Wenn der Browser fragt, wählen Sie „Speichern“.
   - Direkter Link: [https://miktex.org/download](https://miktex.org/download) → großer blauer Button „Download MiKTeX“.
4. **Datei starten:** Drücken Sie `Strg`+`J`, klicken Sie in der Download-Liste auf die Datei, die mit `miktex` beginnt (z. B. `miktexsetup-x64.exe`). Alternativ im Datei-Explorer zu „Downloads“ gehen (Windows-Taste, „Datei-Explorer“ tippen, Enter), die Datei doppelklicken.
5. **Sicherheitsabfrage:** Wenn Windows fragt „Änderungen zulassen?“, klicken Sie auf „Ja“.
6. **Installation durchklicken:** 
   - „Install for: **Only for: <Ihr Benutzername>**“ wählen, „Next“.
   - Zielordner belassen, „Next“.
   - „Preferred paper: A4“ wählen, „Next“.
   - Bei „Install missing packages on-the-fly“ **Yes** auswählen (damit fehlende Pakete später automatisch kommen), „Next“, dann „Start“.
7. **Abschließen:** Warten Sie, bis der Balken fertig ist, dann „Close“.
8. **Pakete aktualisieren:** 
   - Drücken Sie die Windows-Taste, tippen Sie „MiKTeX Console“ und öffnen Sie die App.
   - Unten links „Check for updates“ klicken, dann „Update now“. Alles durchlaufen lassen, dann schließen.

### Schritt 2: Visual Studio Code (Editor) installieren
1. Browser bleibt offen: Adressleiste anklicken, `https://code.visualstudio.com` eingeben, Enter.
2. Auf der Seite „Download for Windows“ anklicken, Datei speichern.
   - Direkter Link für Windows 64-Bit: [https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user](https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user) (Button „Download for Windows“).
3. Nach dem Download `Strg`+`J`, auf `VSCodeSetup...exe` klicken (oder im Downloads-Ordner doppelklicken).
4. Im Installer nacheinander:
   - Lizenz akzeptieren („I accept…“), „Next“.
   - Speicherort belassen, „Next“.
   - Alle Häkchen setzen bei „Add to PATH“ und „Register Code as an editor“, „Next“.
   - „Install“ klicken, warten, „Finish“. VS Code darf gleich starten.

### Schritt 3: Vorlage ohne Konsole herunterladen
1. In Edge oben `https://github.com/kqc-real/thesis-template/tree/referat-template` eingeben, Enter.
2. Grüne Schaltfläche „Code“ anklicken, dann „Download ZIP“.
   - Direkter ZIP-Link (fertig gepackt): [https://github.com/kqc-real/thesis-template/archive/refs/heads/referat-template.zip](https://github.com/kqc-real/thesis-template/archive/refs/heads/referat-template.zip). Wenn angeklickt, startet der Download automatisch.
3. Wenn der Download fertig ist: `Strg`+`J`, neben der ZIP-Datei auf den kleinen Ordner klicken, damit der Explorer den Speicherort zeigt.
4. ZIP entpacken:
   - Datei mit rechter Maustaste anklicken → „Alle extrahieren…“ → „Extrahieren“.
   - Der entpackte Ordner heißt meist `thesis-template-ref...`. Doppelklicken, darin sehen Sie u. a. `Artikel.tex`.

### Schritt 4: Projekt in VS Code öffnen und bauen
1. VS Code öffnen: Windows-Taste, „Visual Studio Code“ tippen, Enter.
2. Ordner öffnen:
   - In VS Code oben „File“ → „Open Folder…“.
   - Links den Ordner aus Schritt 3 auswählen (der entpackte `thesis-template…`), „Select Folder“.
3. LaTeX-Erweiterung installieren:
   - Drücken Sie `Strg`+`Shift`+`X`, dadurch öffnet sich links der Erweiterungsbereich.
   - Oben ins Suchfeld „LaTeX Workshop“ tippen, Eintrag von „James Yu“ auswählen, „Install“ klicken.
4. Hauptdatei öffnen: Links im Explorer auf `Artikel.tex` klicken; der Text erscheint in der Mitte.
5. PDF bauen (ohne Konsole):
   - Drücken Sie `Strg`+`Shift`+`P`, tippen Sie „latex workshop: build“, drücken Sie Enter.
   - Der erste Durchlauf dauert etwas; MiKTeX fragt ggf. nach fehlenden Paketen → „Install“ wählen.
6. PDF ansehen:
   - Nach dem Build erscheint rechts oben eine Leiste; auf „View LaTeX PDF“ klicken (Symbol mit Lupe).
   - Alternativ liegt das PDF im Projektordner als `Artikel.pdf`; doppelklickbar über den Datei-Explorer.

### Schritt 5: Eigenen Text schreiben
1. In `content/Artikel_Inhalt.tex` (im Explorer links) doppelklicken, Text ersetzen.
2. Änderungen speichern mit `Strg`+`S`.
3. Erneut bauen wie in Schritt 4.5, danach wird das PDF aktualisiert.

### Häufige Fragen (kurz)
- **„Windows blockiert die Datei“**: Bei der Download-Leiste ggf. auf „Behalten“ klicken, dann öffnen. UAC-Nachfragen mit „Ja“ bestätigen.
- **Kein „latex workshop: build“ gefunden**: Prüfen, ob die Extension wirklich installiert ist (Schritt 4.3), VS Code ggf. neu starten.
- **Fehler wegen fehlender Pakete**: In MiKTeX Console „Check for updates“ + „Update now“, danach Build erneut starten und Install-Anfragen zustimmen.

## Schnelleinstieg

### 1. Projekt herunterladen

```bash
git clone -b referat-template https://github.com/thm-mni-ii/thesis-template.git artikel-vorlage
cd artikel-vorlage
```

### 2. Kompilieren

```bash
./build.sh
```

Oder manuell:
```bash
pdflatex Artikel.tex
biber Artikel
pdflatex Artikel.tex
```

## Verwendung

### Metadaten anpassen

In `Artikel.tex` die Titelangaben ändern:

```tex
\author{Ihr Name}
\title{Titel des Artikels}
\subtitle{Untertitel}
\date{\today}
```

### Inhalt schreiben

Der Artikelinhalt liegt in `content/Artikel_Inhalt.tex`. Hier schreiben Sie Ihren Text mit:

- `\section{}` für Hauptabschnitte
- `\subsection{}` für Unterabschnitte
- `\begin{itemize}` / `\begin{enumerate}` für Listen

### Infoboxen verwenden

Für hervorgehobene Inhalte:

```tex
\begin{infobox}[Titel der Box]
Inhalt der Infobox...
\end{infobox}
```

### Bilder einfügen

```tex
\begin{figure}[ht]
  \centering
  \includegraphics[width=\columnwidth]{images/bild.png}
  \caption{Beschreibung}
  \label{fig:bild}
\end{figure}
```

**Hinweis:** Bei zweispaltigem Layout `\columnwidth` statt `\textwidth` verwenden!

### Literatur zitieren

1. Quellen in `bib/BibtexDatabase.bib` eintragen
2. Im Text zitieren: `\cite{key}` (erzeugt [1], [2], etc.)

## Projektstruktur

```text
artikel-vorlage/
├── Artikel.tex              # Hauptdatei
├── Artikel.pdf              # Ausgabe
├── build.sh                 # Build-Skript
├── content/
│   └── Artikel_Inhalt.tex   # Artikeltext
├── preambel/
│   └── preambel-artikel.tex # Artikel-spezifische Einstellungen
├── bib/                     # Literatur
├── images/                  # Abbildungen
└── docs_KI_GENERIERT/       # Beispielmaterialien
```

## Unterschiede zur Thesis-Vorlage

| Thesis | Artikel |
|--------|---------|
| `scrreprt` (Report) | `scrartcl` (Article) |
| Einspaltig | Zweispaltig |
| `\chapter{}` | `\section{}` als höchste Ebene |
| 50+ Seiten | ca. 10 Seiten |
| Alphabetisches Zitieren | Numerisches Zitieren [1] |
| Separate Titelseite | Kompakter Titel |

## Bereinigung

Temporäre Dateien entfernen:
```bash
./build.sh clean
```

## KI-Erklärung

Die Vorlage enthält am Artikelende eine Fußnote für die Deklaration von KI-Hilfsmitteln. Text nach Bedarf anpassen.

## KI-generierte Zusatzmaterialien

Im Ordner `docs_KI_GENERIERT/` finden Sie Beispielmaterialien zur Inspiration für Präsentationen. Details siehe [README des Ordners](docs_KI_GENERIERT/README.md).

## Lizenz

MIT License — siehe LICENSE.
