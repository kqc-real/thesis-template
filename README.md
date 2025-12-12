# LaTeX Vorlage für wissenschaftliche Abschlussarbeiten

Professionelle LaTeX-Vorlage für Bachelor- und Masterarbeiten im deutschsprachigen Raum. Optimiert für Qualität, Lesbarkeit und Einhaltung akademischer Konventionen.

## Für LaTeX-Anfänger:innen

### Was ist LaTeX?

LaTeX ist ein **Textsatzsystem** für hochwertige Dokumente, besonders geeignet für wissenschaftliche Arbeiten. Anders als bei Word schreiben Sie Text mit **Markup-Befehlen** (wie `\section{Titel}`), und LaTeX kümmert sich automatisch um:

- **Professionelles Layout** (Abstände, Schriftgrößen, Seitenumbrüche)
- **Nummerierung** (Kapitel, Abbildungen, Formeln, Referenzen)
- **Literaturverzeichnis** (automatisch sortiert und formatiert)
- **Mathematische Formeln** (z.B. $E = mc^2$)
- **Konsistente Formatierung** im gesamten Dokument

**Vorteil:** Sie konzentrieren sich auf den Inhalt, LaTeX kümmert sich um die Form.

### Wozu eine TeX-Distribution?

Eine **TeX-Distribution** (wie TeX Live oder MikTeX) ist die Software, die LaTeX-Code in PDFs umwandelt. Sie enthält:

- **LaTeX-Compiler** (pdflatex, xelatex, lualatex)
- **Tausende Pakete** (für Tabellen, Bilder, Formeln, Bibliographien, etc.)
- **Werkzeuge** wie `biber` (für Literaturverzeichnisse) und `latexmk` (für automatisches Kompilieren)

**Empfehlung:** TeX Live 2024+ (aktuell: TeX Live 2025) — vollständig, aktuell, kostenlos.

### LaTeX in VS Code einrichten

VS Code ist ein moderner, kostenloser Code-Editor mit exzellenter LaTeX-Unterstützung.

#### Schritt 1: TeX-Distribution installieren

**macOS:**

```bash
brew install --cask mactex
# oder MikTeX: brew install --cask miktex
```

**Linux (Ubuntu/Debian):**

```bash
sudo apt-get update
sudo apt-get install texlive-full
```

**Windows:**

- Download [TeX Live](https://www.tug.org/texlive/) oder [MikTeX](https://miktex.org/)

#### Schritt 2: VS Code Erweiterungen installieren

Installieren Sie diese Extensions in VS Code:

1. **LaTeX Workshop** (james-yu.latex-workshop) — *Essentiell*
   - Automatische Kompilierung beim Speichern
   - PDF-Vorschau im Editor
   - Syntax-Highlighting und IntelliSense
   - Fehleranzeige und -navigation

2. **LaTeX Utilities** (tecosaur.latex-utilities) — *Empfohlen*
   - Erweiterte Snippets
   - Zeilennummerierung für Tabellen
   - Live Paste von Bildern

3. **LaTeX language support** (mathematic.vscode-latex) — *Optional*
   - Zusätzliche Syntax-Hervorhebung

#### Schritt 3: LaTeX Workshop konfigurieren

LaTeX Workshop funktioniert sofort. Für diese Vorlage sind die Standardeinstellungen optimal:

- **Automatisches Kompilieren:** Beim Speichern (`.tex`-Datei)
- **PDF-Vorschau:** Automatisch rechts neben dem Editor
- **Build-Tool:** `latexmk` (empfohlen) oder `pdflatex` + `biber`

**VS Code Settings (Optional):**

```json
{
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.latex.recipe.default": "latexmk (pdflatex)"
}
```

### latexmk vs. pdflatex

#### pdflatex (manuell)

Wenn Sie manuell kompilieren möchten (z.B. im Terminal):

```bash
pdflatex Bachelor-Thesis.tex    # 1. Durchlauf: Dokument erstellen
biber Bachelor-Thesis           # Bibliographie verarbeiten
pdflatex Bachelor-Thesis.tex    # 2. Durchlauf: Referenzen aktualisieren
pdflatex Bachelor-Thesis.tex    # 3. Durchlauf: Alles finalisieren
```

**Problem:** Sie müssen mehrfach kompilieren, bis alle Referenzen korrekt sind.

#### latexmk (automatisch) — **Empfohlen**

`latexmk` kompiliert automatisch **so oft wie nötig**:

```bash
latexmk -pdf Bachelor-Thesis.tex
```

Das erkennt automatisch:

- Wenn Bibliographie neu gebaut werden muss (→ ruft `biber` auf)
- Wenn Referenzen aktualisiert werden müssen (→ zusätzliche Durchläufe)
- Wenn nichts geändert wurde (→ keine Kompilierung)

**LaTeX Workshop nutzt standardmäßig latexmk** — Sie müssen nichts tun!

### Workflow in VS Code

1. **Projekt öffnen:** `Datei` → `Ordner öffnen` → `thesis-template`
2. **Hauptdatei öffnen:** `Bachelor-Thesis.tex`
3. **Bearbeiten:** Ändern Sie Metadaten und Content-Dateien
4. **Speichern:** `Cmd+S` (Mac) / `Ctrl+S` (Windows/Linux)
5. **LaTeX Workshop kompiliert automatisch** im Hintergrund
6. **PDF ansehen:** Klicken Sie auf das PDF-Symbol rechts oben, oder nutzen Sie `Cmd+Alt+V`

**Tipp:** Bei Fehlern zeigt LaTeX Workshop diese im "Problems"-Panel (unten) an. Klicken Sie darauf, um zur fehlerhaften Zeile zu springen.

## Features

✓ **Professionelle Typografie**

- KOMA-Script (scrreprt) Dokumentenklasse
- Latin Modern Schriftart
- Microtype-Optimierung für deutsche Texte
- Korrekte Hurenkinder/Schusterjungen-Vermeidung

✓ **Deutsche Konventionen**

- Neue Rechtschreibung (ngerman)
- Keine Absatzeinrückung, Abstand zwischen Absätzen
- Deutsche Anführungszeichen und Hyphenation
- Bindekorrektur für gebundene Arbeiten

✓ **Akademische Struktur**

- Titelseite mit Referenten
- Abstract/Kurzfassung
- Inhaltsverzeichnis mit PDF-Lesezeichen
- Literaturverzeichnis (BibLaTeX)
- Abbildungs-, Tabellen- und Code-Verzeichnis
- Anhang mit optionaler Gender/KI-Deklaration

✓ **Sauberer Code**

- Gut organisierte Preambel-Module
- Professionelle Kommentierung
- Keine überflüssigen Befehle
- Wartbar und erweiterbar

## Anforderungen

**Hinweis:** Wenn Sie LaTeX noch nicht installiert haben, lesen Sie zuerst den Abschnitt "Für LaTeX-Anfänger:innen" oben.

### TeX-Distribution (erforderlich)

- **TeX Live 2024+** (empfohlen) — Vollständig, aktuell, gut getestet
- **MikTeX 23.1+** — Alternative für Windows
- Enthält: pdfLaTeX, XeLaTeX, LuaLaTeX, Biber, latexmk

### Editor (empfohlen)

- **VS Code** mit Extension "LaTeX Workshop"
- Alternativen: TeXstudio, Overleaf (online), TeXmaker

### Build-Tools (in Distribution enthalten)

- **latexmk** — Automatisches Kompilieren (empfohlen)
- **Biber 2.19+** — Bibliographie-Verarbeitung
- **pdflatex** — PDF-Generierung

### Installation (nur macOS/Linux Terminal)

Wenn Sie TeX Live noch nicht haben (siehe Abschnitt "Für LaTeX-Anfänger:innen"):

```bash
# macOS: TeX Live installieren
brew install --cask mactex

# Linux: TeX Live installieren  
sudo apt-get install texlive-full

# VS Code Extension installieren
code --install-extension james-yu.latex-workshop
```

## Schnelleinstieg

### 1. Repository klonen

```bash
git clone https://github.com/kqc-real/thesis-template.git
cd thesis-template
```

### 2. Metadaten anpassen

Bearbeiten Sie `Bachelor-Thesis.tex` (Zeilen 31-37):

```tex
\author{Ihr Name}
\studentID{1234567}
\studentAddress{Straße 1, 12345 Stadt}
\thesis{Bachelor-Thesis}
\title{Ihr Thesis-Titel}
\academicTitle{Bachelor of Science}
\firstReferee{Prof. Dr. Name}
\secondReferee{Prof. Dr. Name}
```

### 3. Inhalte schreiben

- `content/00_Abstract.tex` - Kurzfassung (150-250 Wörter)
- `content/01_Einfuehrung.tex` - Einleitung mit Motivation
- `content/02_Hintergrund.tex` - Theoretischer Hintergrund
- `content/03_Konzept.tex` - Ihr Konzept/Methode
- `content/04_Realisierung.tex` - Implementierung/Ergebnisse
- `content/05_Abschluss.tex` - Fazit und Ausblick
- `content/Z-Anhang.tex` - Optional: Zusatzmaterialien

### 4. Literatur hinzufügen

Bearbeiten Sie `bib/BibtexDatabase.bib`:

```bibtex
@article{musterauthor2023,
  author  = {Max Mustermann},
  title   = {Ein wichtiger Beitrag},
  journal = {Journal of Examples},
  year    = {2023},
  volume  = {1},
  pages   = {1--10},
  doi     = {10.1234/example}
}
```

### 5. Kompilieren

**In VS Code (empfohlen):**

- Öffnen Sie `Bachelor-Thesis.tex`
- Speichern Sie die Datei (`Cmd+S` / `Ctrl+S`)
- LaTeX Workshop kompiliert automatisch
- PDF-Vorschau: Klick auf PDF-Symbol (rechts oben) oder `Cmd+Alt+V`

**Im Terminal (manuell):**

```bash
# Mit latexmk (automatisch, empfohlen):
latexmk -pdf Bachelor-Thesis.tex

# Oder manuell mit pdflatex:
pdflatex Bachelor-Thesis.tex
biber Bachelor-Thesis
pdflatex Bachelor-Thesis.tex
pdflatex Bachelor-Thesis.tex
```

## Verzeichnisstruktur

```text
thesis-template/
├── Bachelor-Thesis.tex          # Hauptdatei
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

## Häufige Anpassungen

### Sprache auf Englisch umstellen

In `Bachelor-Thesis.tex` Zeile 16:

```tex
\def\lang{english}  % Statt: ngerman
```

### Andere Dokumentklasse

In `Bachelor-Thesis.tex` Zeile 3:

```tex
\documentclass[...]{scrartcl}  % Artikel statt Report
% oder
\documentclass[...]{scrbook}   % Buch mit mehreren Parts
```

### Alternative Schriftart

In `preambel/Fonts.tex` - Kommentare entfernen und aktivieren:

```tex
% Palantino:
\usepackage{mathpazo}
\usepackage[scaled=.95]{helvet}

% Times:
\usepackage{mathptmx}
```

### Farbige Überschriften

In `preambel/preambel.tex` hinzufügen:

```tex
\addtokomafont{section}{\color{darkblue}}
\addtokomafont{subsection}{\color{darkblue}}
```

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

## Troubleshooting

### Problem: `!Undefined control sequence \theThesis`

**Lösung:** Stellen Sie sicher, dass Sie `Bachelor-Thesis.tex` als Hauptdatei kompilieren.

### Problem: Literatur wird nicht angezeigt

**Lösung:** Führen Sie aus:

```bash
pdflatex Bachelor-Thesis
biber Bachelor-Thesis
pdflatex Bachelor-Thesis
pdflatex Bachelor-Thesis
```

### Problem: Deutsche Umlaute fehlen

**Lösung:** Überprüfen Sie die Datei-Encoding (UTF-8) und `\usepackage[utf8]{inputenc}`.

### Problem: Zu viele/zu wenige Seiten

**Lösung:** Passen Sie Abstände an:

- `\vspace{1cm}` für manuellen Abstand
- `parskip=full` in `preambel/settings.tex`
- Zeilenabstand in `preambel/preambel.tex` (`\onehalfspacing`)

## Unterstützung

- **Fragen zur Vorlage**: GitHub Issues
- **LaTeX-Tipps**: CTAN, TeXStackExchange
- **Deutsche Typografie**: DUDEN, Krimpen "Typographisches Gestalten"

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
- **THM MNI II** - Für Support und Feedback
