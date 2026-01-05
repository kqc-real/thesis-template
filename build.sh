#!/bin/bash
set -e

# Name der Hauptdatei (ohne .tex Endung)
MAIN="Thesis"

# Clean-Option prüfen
if [ "$1" == "clean" ]; then
  echo "🧹 Bereinige temporäre Dateien..."
  rm -f *.aux *.bbl *.bcf *.blg *.toc *.lof *.lot *.idx *.ilg *.ind *.out *.log *.run.xml *.lol *.synctex.gz *.fls *.fdb_latexmk *.nlo *.nls
  echo "✅ Bereinigung abgeschlossen."
  exit 0
fi

echo "🚀 Starte Build-Prozess für $MAIN..."

# 1. Initialer LaTeX-Lauf (erstellt .aux, .toc, etc.)
pdflatex "$MAIN.tex"

# 2. Literaturverzeichnis verarbeiten
biber "$MAIN"

# 3. Verzeichnisse und Referenzen aktualisieren
pdflatex "$MAIN.tex"

# 4. Finaler Lauf für korrekte Seitenzahlen und Verweise
pdflatex "$MAIN.tex"

echo "✅ Build erfolgreich! $MAIN.pdf wurde erstellt."