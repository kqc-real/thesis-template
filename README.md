# LaTeX Vorlage für wissenschaftliche Abschlussarbeiten

Professionelle LaTeX-Vorlage für Bachelor- und Masterarbeiten im deutschsprachigen Raum. Optimiert für Qualität, Lesbarkeit und Einhaltung akademischer Konventionen.

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

### LaTeX-Distribution

- **TeX Live 2024+** oder **MikTeX 23.1+** (mit updatemap-cfg)
- **pdfLaTeX** oder **XeLaTeX**

### Build-Tools

- **Biber 2.19+** - Für Bibliographie-Verarbeitung
- **latexmk** oder **Make** - Für automatisiertes Kompilieren

### Bash-Installation (macOS/Linux)

```bash
# TeX Live installieren
brew install --cask mactex
# oder via apt:
sudo apt-get install texlive-full

# Alternativ: MikTeX
brew install --cask miktex
```

## Schnelleinstieg

### 1. Repository klonen

```bash
git clone https://github.com/thm-mni-ii/thesis-template.git
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

```bash
# Einmalig:
pdflatex Bachelor-Thesis.tex
biber Bachelor-Thesis
pdflatex Bachelor-Thesis.tex
pdflatex Bachelor-Thesis.tex

# Oder mit latexmk (empfohlen):
latexmk -pdf -bibtex Bachelor-Thesis.tex
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
