# LaTeX-Vorlage für wissenschaftliche Abschlussarbeiten

Professionelle LaTeX-Vorlage für Bachelor- und Masterarbeiten im deutschsprachigen Raum. Optimiert für Qualität, Lesbarkeit und Einhaltung akademischer Konventionen.

## 🚀 Für LaTeX-Anfänger:innen: Die ersten 5 Minuten

Noch nie LaTeX benutzt? Kein Problem! Diese Sektion erklärt alles in einfachen Worten.

### Was ist LaTeX überhaupt?

Stellen Sie sich vor: Sie schreiben ein Essay in Word, formatieren alles per Hand (Schriftgröße, Abstände, Seitennummern), und plötzlich ändert sich etwas — alles muss neu formatiert werden.

**LaTeX ist anders:** Sie schreiben normal, und die Software kümmert sich um die schöne Formatierung. Beispiel:

```tex
\chapter{Einführung}
Dies ist mein erstes Kapitel.
\section{Motivation}
Ein wichtiger Punkt ist...
```

↓ (LaTeX verarbeitet das) ↓

**PDF mit:**
- Automatisch nummerierten Kapiteln
- Schönen Abstände und Schriftgrößen
- Automatischem Inhaltsverzeichnis
- Professionellem Aussehen (ohne dass Sie was daran drehen!)

**Warum ist das nützlich?**
- ✅ Fokus auf **Inhalt**, nicht auf Formatierung
- ✅ Professionelles Aussehen **garantiert**
- ✅ Wissenschaftliche Formeln, Tabellen, Zitate **kinderleicht**
- ✅ Lange Arbeiten (80+ Seiten) **kein Problem**

### Was brauche ich zum Starten?

Drei Dinge:

1. **TeX Live** (die LaTeX-Software) — Kostenlos
2. **VS Code** (der Editor) — Kostenlos  
3. **LaTeX Workshop Extension** (VS Code Plugin) — Kostenlos

Das war's! Danach schreiben Sie in VS Code, speichern, und das PDF wird automatisch erstellt.

**Zeitaufwand für Setup:** 10 Minuten

### LaTeX in VS Code einrichten

**Schritt-für-Schritt-Anleitung (auch für absolute Anfänger:innen):**

#### 1️⃣ TeX Live installieren (5 Min)

**macOS (Terminal öffnen und kopieren):**

```bash
brew install --cask mactex-no-gui
```

**Linux (Ubuntu/Debian):**

```bash
sudo apt-get update && sudo apt-get install texlive-full
```

**Windows:**

- Gehen Sie zu: [TeX Live Windows](https://www.tug.org/texlive/windows.html)
- Laden Sie `install-tl-windows.exe` herunter
- Starten Sie die Datei und folgen Sie der Installation
- Bestätigen Sie alle Fragen mit "Ja"

> **Was passiert hier?** TeX Live ist die LaTeX-Software. Sie wird installiert, damit VS Code PDFs aus Ihrem LaTeX-Code erstellen kann.

#### 2️⃣ VS Code installieren und öffnen

- Download: [Visual Studio Code](https://code.visualstudio.com)
- Installieren und öffnen

#### 3️⃣ LaTeX Extension hinzufügen

1. Öffnen Sie VS Code
2. Klicken Sie links auf das **Extensions-Icon** (4 Quadrate)
3. Suchen Sie nach `LaTeX Workshop`
4. Klicken Sie auf **"Install"**

Das war's! Der Automat läuft jetzt.

#### ✅ Test: Funktioniert alles?

1. Öffnen Sie diese Vorlage in VS Code: `Datei` → `Ordner öffnen` → `thesis-template`
2. Öffnen Sie `Thesis.tex`
3. Drücken Sie `Cmd+S` (Mac) oder `Ctrl+S` (Windows/Linux)
4. Warten Sie 10 Sekunden...
5. Ein PDF sollte auf der rechten Seite erscheinen

Wenn ja: **Herzlichen Glückwunsch!** Sie können jetzt LaTeX nutzen. 🎉

Wenn nein: Siehe Abschnitt "Troubleshooting" unten.

## ⚙️ WICHTIG: `build.sh` — Bedeutung & Nutzung

Diese Vorlage enthält ein kleines, zuverlässiges Build-Skript namens `build.sh`, das alle notwendigen Schritte automatisch ausführt, um die PDF-Ausgabe vollständig und konsistent zu erzeugen.

- **Wozu dient `build.sh`?**
   - Es automatisiert die mehrstufige Kompilierung, die LaTeX für Kapitel-, Verzeichnis- und Literaturverweise benötigt.
   - Konkret führt es nacheinander aus: `pdflatex`, `biber`, `pdflatex`, `pdflatex` — damit alle Referenzen, das Literaturverzeichnis und Inhaltsverzeichnisse korrekt erstellt werden.

- **Vorteile**
   - Ein Kommando statt mehrere komplexe Schritte.
   - Vermeidet häufige Fehler (fehlende `.bcf`/`.bbl`, unvollständige Verzeichnisse).
   - Reproduzierbarer, einfacher Workflow für Anfänger:innen und Reviewer.

- **Voraussetzungen**
   - Installiertes TeX-System (z. B. TeX Live oder MiKTeX)
   - `biber` ist für die Literaturverarbeitung installiert (wird durch TeX Live üblicherweise mitgeliefert)
   - `build.sh` ist ausführbar (falls nicht: `chmod +x build.sh`)

- **Einfacher Gebrauch**
   - Im Terminal im Projekt-Ordner ausführen:

```bash
./build.sh
```

   - Am Ende sehen Sie `✅ Build erfolgreich! Thesis.pdf wurde erstellt.` und die Datei `Thesis.pdf` im Projekt-Root.

- **Wenn etwas schiefgeht (Troubleshooting)**
   - Fehler: `ERROR - Cannot find 'Thesis.bcf'!` oder `Cannot find Thesis.bcf` —
      - Ursache: Die `.bcf`-Datei, die `biber` benötigt, wurde nicht korrekt erzeugt. Lösung:
         1. Stellen Sie sicher, dass `pdflatex Thesis.tex` zuvor ohne Abbruch gelaufen ist (erstellt `.bcf`).
         2. Führen Sie manuell aus:

```bash
pdflatex Thesis.tex
biber Thesis
pdflatex Thesis.tex
pdflatex Thesis.tex
```

      - Wenn das funktioniert, prüfen Sie, ob `build.sh` ausführbar ist und starten Sie es erneut.
   - Andere Probleme: Prüfen Sie `Thesis.log` und die Ausgabe in Ihrem Terminal bzw. im VS Code "Problems"-Panel.

- **Sauber machen (optional)**
   - Zwischenstände und temporäre Dateien können Sie mit folgendem Befehl entfernen (vorsichtig verwenden):

```bash
rm -f *.aux *.bbl *.bcf *.blg *.toc *.lof *.lot *.idx *.ilg *.ind *.out
```

   - Danach `./build.sh` erneut ausführen.

Hinweis: `build.sh` ist bewusst einfach gehalten und funktioniert in den meisten lokalen Setups; für CI/CD-Pipelines oder spezielle TeX-Umgebungen können Sie die Schritte aus dem Skript bei Bedarf anpassen.

### Wie benutze ich diese Vorlage jetzt?

### Workflow in VS Code

1. **Projekt öffnen:** `Datei` → `Ordner öffnen` → `thesis-template` wählen
2. **Hauptdatei öffnen:** `Thesis.tex` (Doppelklick)
3. **Ihre Metadaten eintragen:** Zeilen 31-37 ausfüllen (Ihr Name, Titel etc.)
4. **Inhalt bearbeiten:** In den Dateien unter `content/` schreiben
5. **Speichern:** `Cmd+S` (Mac) oder `Ctrl+S` (Windows/Linux)
   - ✅ LaTeX Workshop kompiliert **automatisch im Hintergrund**
   - ✅ PDF wird **rechts angezeigt** (oder klicken Sie auf PDF-Icon oben rechts)
6. **Das wars!** Beim nächsten Speichern wird alles automatisch aktualisiert

**Tipp:** Wenn ein Fehler auftritt:

- Schauen Sie unten im "Problems"-Panel
- Klicken Sie auf die Fehlermeldung → springt zur fehlerhaften Zeile
- Lesen Sie die Fehlermeldung (meist selbsterklärend)

## Features & Highlights

Diese Vorlage ist **produktionsreif** für Bachelor- und Masterarbeiten:

✅ **Alles ist vorkonfiguriert**

- Keine komplizierte LaTeX-Konfiguration nötig
- Einfach ausfüllen und losschreiben
- Funktioniert sofort (Out-of-the-box)

✅ **Deutsche Konventionen**

- Neue Rechtschreibung (ngerman)
- Korrekte deutsche Abstände und Anführungszeichen
- Typografische Regeln eingebaut

✅ **Saubere Struktur**

- Kapitel in separaten Dateien (einfach zu organisieren)
- Bilder, Tabellen, Code-Listings professionell formatiert
- Literaturverzeichnis automatisch erstellt

✅ **Moderne Features**

- Farbige Tabellenköpfe (mattes Blau)
- Syntax-Highlighting für Code (Python, TypeScript etc.)
- TikZ-Diagramme vorbereitet
- Mathematische Formeln einfach einzufügen

## Anforderungen

Alles Wichtige ist bereits vorinstalliert, wenn Sie den Setup-Anleitung oben folgen:

- **TeX Live 2024+** (oder MikTeX) — Die LaTeX-Software
- **VS Code** — Der Editor
- **LaTeX Workshop Extension** — Das VS Code Plugin

Das war's. Keine weiteren Abhängigkeiten nötig!

## Schnelleinstieg für Anfänger

### Haben Sie TeX Live + VS Code bereits installiert?

**Ja?** → Zu Schritt 2 springen

**Nein?** → Folgen Sie der Setup-Anleitung oben (5 Minuten)

### 1. Diese Vorlage herunterladen

Option A: **Mit Git** (empfohlen):

```bash
git clone https://github.com/kqc-real/thesis-template.git
cd thesis-template
```

Option B: **Ohne Git** (manuell):

- Besuchen Sie: [GitHub Repo](https://github.com/kqc-real/thesis-template)
- Klicken Sie auf grünen **Code** Button
- Wählen Sie **"Download ZIP"**
- Entpacken Sie die ZIP-Datei auf Ihrem Computer

### 2. Projekt in VS Code öffnen

1. Öffnen Sie VS Code
2. `Datei` → `Ordner öffnen`
3. Wählen Sie den Ordner `thesis-template`
4. Öffnen Sie die Datei `Thesis.tex` (Doppelklick)

### 3. Metadaten eintragen

Öffnen Sie `Thesis.tex` und suchen Sie die Metadaten-Sektion:

```tex
%% Metadaten der Arbeit
\author{Maria Musterfrau}           % ← Ihr Name
\studentID{1234567}                 % ← Ihre Matrikelnummer
\studentAddress{Straße 1, 12345 Stadt} % ← Ihre Adresse
\thesis{Bachelor-Thesis}            % ← Art der Arbeit
\title{Ihr Thesis-Titel hier...}    % ← Ihr Titel
\academicTitle{Bachelor of Science} % ← Ihr Abschluss
\firstReferee{Prof. Dr. Name}       % ← 1. Betreuer
\secondReferee{Prof. Dr. Name}      % ← 2. Betreuer
```

Ersetzen Sie die Platzhalter mit Ihren Daten.

### 4. Anfangen zu schreiben

Die Kapitel sind in `content/` organisiert:

- `00_Abstract.tex` — Kurzfassung (150-250 Wörter)
- `01_Einfuehrung.tex` — Einführung + Motivation
- `02_Hintergrund.tex` — Theoretischer Hintergrund
- `03_Konzept.tex` — Ihr Konzept/Ansatz
- `04_Realisierung.tex` — Implementierung + Ergebnisse
- `05_Abschluss.tex` — Fazit + Ausblick

Öffnen Sie eine Datei, schreiben Sie Ihren Text, speichern Sie (`Cmd+S` / `Ctrl+S`), und das PDF wird **automatisch aktualisiert**.

### 5. Bilder und Literatur hinzufügen

**Bilder:**

- Legen Sie Bilder in den `images/` Ordner
- Referenzieren Sie sie im Text:

```tex
\begin{figure}[ht]
\centering
\includegraphics[width=0.8\textwidth]{images/mein-diagramm.png}
\caption{Beschreibung der Abbildung}
\label{fig:mein-diagramm}
\end{figure}
```

**Literatur:**

- Öffnen Sie `bib/BibtexDatabase.bib`
- Fügen Sie Quellen hinzu (siehe Beispiele in der Datei)
- Im Text zitieren: `\cite{musterautor2025}`

Das war's!

## Verzeichnisstruktur

```text
thesis-template/
├── Thesis.tex                   # Hauptdatei
├── preambel/
│   ├── settings.tex             # KOMA-Script Konfiguration
│   ├── preambel.tex             # Paket-Definitionen
│   ├── preambel-commands.tex    # LaTeX-Befehle
│   ├── Fonts.tex                # Schriftarten-Auswahl
│   ├── Hyphenation.tex          # Deutsche Silbentrennung
│   └── (Fonts.tex)              # Schriftarten-Alternativen
├── content/
│   ├── 00_Titel.tex             # Titelseite
│   ├── 00_Abstract.tex          # Abstract/Kurzfassung
│   ├── 01_Einfuehrung.tex       # Kapitel: Einführung
│   ├── 02_Hintergrund.tex       # Kapitel: Theoretischer Hintergrund
│   ├── 03_Konzept.tex           # Kapitel: Konzept/Methode
│   ├── 04_Realisierung.tex      # Kapitel: Implementierung/Ergebnisse
│   ├── 05_Abschluss.tex         # Kapitel: Fazit/Ausblick
│   └── Z-Anhang.tex             # Anhang (optional)
├── bib/
│   ├── BibtexDatabase.bib       # Literaturquellen
│   └── bst/
│       └── alphadin.bst         # BibTeX-Stil (optional)
├── images/                      # Abbildungen eingebunden
├── macros/
│   ├── newcommands.tex          # Neue Befehle
│   └── TableCommands.tex        # Tabellen-Befehle
├── tabellen/
│   └── LongtableBeispiel.tex    # Beispiel für mehrseitige Tabellen
├── .gitignore                   # Git-Ignorliste
├── LICENSE                      # MIT-Lizenz
└── README.md                    # Diese Datei
```

## Häufige Anpassungen (für Anfänger:innen)

### Ich will in Englisch die Arbeit schreiben

Öffnen Sie `Thesis.tex`, Spracheinstellung:

```tex
\def\lang{english}
```

Speichern → PDF wird automatisch auf Englisch neu erstellt (Abstände, Wörter etc.)

### Andere Schriftart verwenden

Öffnen Sie `preambel/Fonts.tex` und kommentieren Sie andere Optionen aus/ein.

Beispiele sind bereits vorhanden (Palatino, Times, etc.)

### Das Layout anpassen

Wenn Sie größere/kleinere Abstände brauchen, fragen Sie einen erfahrenen LaTeX-Nutzer oder suchen Sie "KOMA-Script Dokumentation" online.

## Best Practices

### Dateiorganisation

- Eine `.tex`-Datei pro Kapitel
- Bilder in `images/` mit sprechenden Namen
- Tabellen in `tabellen/` auslagern
- Eine `BibtexDatabase.bib` für alle Quellen

### Typografische Regeln

- Keine manuellen Zeilenumbrüche (`\\`)
- `~` für geschützte Leerzeichen (z.B. `Abb.~\ref{fig:example}`)
- `\textit{}` für Hervorhebung (nicht `\_`)
- `\cite{}` für Zitate (nicht inline)

### Quellenangaben

Nutzen Sie etablierte Formate:

- Bücher: `@book`
- Zeitschriften: `@article`
- Konferenzen: `@inproceedings`
- Websites: `@misc` mit `howpublished = {\url{...}}`

### Git-Workflow

```bash
# Regelmäßig committen
git add content/
git commit -m "Kapitel 1: Einführung überarbeitet"

# Generierte Dateien ignorieren
# (.gitignore ist bereits konfiguriert)
```

## Git-Workflow für Ihre Thesis

### 1. Repository forken

- Gehen Sie zu [thesis-template](https://github.com/kqc-real/thesis-template)
- Klicken Sie auf den Button **"Fork"** oben rechts, um das Repository in Ihr GitHub-Konto zu kopieren.

### 2. Eigenes Repository klonen

- Öffnen Sie Ihr Terminal und führen Sie den folgenden Befehl aus:

```bash
# Ersetzen Sie <Ihr-GitHub-Username> durch Ihren GitHub-Benutzernamen
# und <Ihr-Repo-Name> durch den Namen Ihres geforkten Repositories

git clone https://github.com/<Ihr-GitHub-Username>/thesis-template.git
cd thesis-template
```

### 3. In VS Code importieren

- Öffnen Sie VS Code.
- Wählen Sie `Datei` → `Ordner öffnen` und wählen Sie den Ordner `thesis-template` aus.

### 4. Schreiben Sie Ihre Thesis

- Bearbeiten Sie die Dateien in `content/` und fügen Sie Ihre Inhalte hinzu.
- Speichern Sie Ihre Änderungen (`Cmd+S` / `Ctrl+S`), und das PDF wird automatisch aktualisiert.

## Kompilierung: So füllen Sie alle Verzeichnisse korrekt

LaTeX benötigt **mehrere Durchläufe**, um alle Verzeichnisse (Inhaltsverzeichnis, Tabellen, Abbildungen, Literatur) korrekt zu füllen. 

### In VS Code (Automatisch - Empfohlen)

LaTeX Workshop kompiliert automatisch beim Speichern, aber nicht immer oft genug. Wenn Verzeichnisse leer sind:

1. Speichern Sie die Datei **3-4 Mal hintereinander** (`Cmd+S` / `Ctrl+S`)
2. Warten Sie jeweils ~10 Sekunden zwischen den Speichervorgängen
3. Alle Verzeichnisse sollten jetzt gefüllt sein

### Im Terminal (Manuell - Volle Kontrolle)

Für **garantiert vollständige** Verzeichnisse und Literatur:

```bash
cd /pfad/zu/thesis-template

# Schritt 1: Erste Kompilierung (erstellt .aux, .toc, .lot, .lof Dateien)
pdflatex Thesis.tex

# Schritt 2: Literatur verarbeiten (nur wenn Sie Zitate haben)
biber Thesis

# Schritt 3: Zweite Kompilierung (integriert Literaturverzeichnis)
pdflatex Thesis.tex

# Schritt 4: Dritte Kompilierung (aktualisiert alle Verzeichnisse und Referenzen)
pdflatex Thesis.tex
```

**Ergebnis:** Thesis.pdf mit vollständig gefüllten Verzeichnissen (Inhalt, Tabellen, Abbildungen, Literatur).

### Warum mehrere Durchläufe?

- **1. Durchlauf:** LaTeX sammelt alle Kapitel, Tabellen, Abbildungen und schreibt sie in Hilfsdateien (.toc, .lot, .lof)
- **2. Durchlauf:** LaTeX liest diese Hilfsdateien und baut die Verzeichnisse
- **3. Durchlauf:** LaTeX aktualisiert alle Seitenzahlen und Querverweise

**Faustregel:** Nach größeren Änderungen (neue Kapitel, Tabellen, Abbildungen) → 3× kompilieren

## Troubleshooting (für Anfänger:innen)

### Problem: "Ich sehe kein PDF nach Speichern"

**Mögliche Ursachen:**

1. **TeX Live ist nicht installiert** → Siehe Setup-Anleitung oben
2. **LaTeX Workshop ist nicht installiert** → Installieren Sie es (Abschnitt "LaTeX in VS Code einrichten")
3. **Sie haben eine Fehler-Syntax in der `.tex`-Datei** → Schauen Sie in die "Problems" Panel unten

**Lösung:**

- Schauen Sie unten im "Problems"-Panel (rot/gelb Warnungen)
- Klicken Sie auf eine Warnung → VS Code springt zur fehlerhaften Zeile
- Fixer Sie das Problem (Tippfehler, `\` vergessen etc.)
- Speichern Sie nochmal

### Problem: "Inhaltsverzeichnis / Tabellenverzeichnis ist leer"

**Ursache:** LaTeX braucht mehrere Durchläufe, um Verzeichnisse zu füllen.

**Lösung:**

1. Speichern Sie die Datei **3× hintereinander** (`Cmd+S`)
2. Warten Sie jeweils ~10 Sekunden
3. Verzeichnisse sollten jetzt gefüllt sein

**Alternative (Terminal):**

```bash
pdflatex Thesis.tex && pdflatex Thesis.tex && pdflatex Thesis.tex
```

### Problem: "Fehler: Undefined control sequence"

Das bedeutet: Sie haben einen Befehl geschrieben, den LaTeX nicht kennt.

**Häufige Fehler:**

- `\textbf{fett}` statt `\textbf fett` (Klammern vergessen)
- `\chapter{Titel}` aber nicht in Hauptdatei (muss in `Thesis.tex` sein)

Schauen Sie im Problems-Panel, welche Zeile der Fehler ist, und überprüfen Sie die Syntax.

### Problem: "Literatur wird nicht angezeigt"

Das ist normal! LaTeX braucht Zeit zu verarbeiten.

**Lösung:**

- Warten Sie 30 Sekunden
- Speichern Sie die Datei nochmal (`Cmd+S`)
- Wenn immer noch nicht: Schauen Sie, ob `bib/BibtexDatabase.bib` Einträge hat

### Problem: "TeX Live hat sich nicht installiert"

**Für macOS:**

Öffnen Sie Terminal und versuchen Sie:

```bash
brew --version
```

Wenn das nicht funktioniert: [Homebrew installieren](https://brew.sh)

Dann nochmal:

```bash
brew install --cask mactex-no-gui
```

**Für Windows:**

- Laden Sie TeX Live direkt herunter (nicht über Homebrew)
- Gehen Sie zu: [TeX Live Download](https://www.tug.org/texlive/windows.html)

## Nächste Schritte

### Sie haben Ihre Thesis fertig geschrieben?

1. **PDF exportieren:** Das PDF ist bereits erstellt (im Root-Verzeichnis sichtbar)
2. **Speichern:** `Cmd+S` ein letztes Mal
3. **PDF speichern:** Machen Sie einen Rechtsklick auf das PDF → "Speichern unter" → auf Ihren Computer

### Sie brauchen Help?

**Fragen zur Vorlage:**

- Schauen Sie in [GitHub Issues](https://github.com/thm-mni-ii/thesis-template/issues)
- Oder erstellen Sie eine neue Issue

**LaTeX-Fragen allgemein:**

- [TeXStackExchange](https://tex.stackexchange.com) (englisch)
- Google: "LaTeX [Ihr Problem]"

**Deutsche Hochschul-Richtlinien:**

- Fragen Sie Ihre Hochschule nach Thesis-Richtlinien (Formatierung, Seitenzahlen etc.)
- Diese Vorlage ist allgemein gehalten und sollte passen

## Lizenz

MIT License - siehe [LICENSE](LICENSE) Datei.

## Beiträge

Verbesserungen sind willkommen! Bitte:

1. Fork das Repo
2. Feature Branch erstellen (`git checkout -b feature/amazing`)
3. Änderungen committen (`git commit -m 'Add amazing feature'`)
4. Push zum Branch (`git push origin feature/amazing`)
5. Pull Request öffnen

## Dankbarkeiten

- **KOMA-Script Team** - Exzellente Dokumentenklasse
- **Markus Kohm** - KOMA-Script Dokumentation
