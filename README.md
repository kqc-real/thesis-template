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
