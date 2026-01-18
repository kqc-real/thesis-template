#!/bin/bash
set -e

# Name der Hauptdatei (ohne .tex Endung)
MAIN="Thesis"

# Clean-Option prüfen
if [ "$1" == "clean" ]; then
  echo "🧹 Bereinige temporäre Dateien..."
  find . -type f -not -path "./.git/*" \( -name "*.aux" -o -name "*.bbl" -o -name "*.bcf" -o -name "*.blg" -o -name "*.toc" -o -name "*.lof" -o -name "*.lot" -o -name "*.idx" -o -name "*.ilg" -o -name "*.ind" -o -name "*.out" -o -name "*.log" -o -name "*.run.xml" -o -name "*.lol" -o -name "*.synctex.gz" -o -name "*.fls" -o -name "*.fdb_latexmk" -o -name "*.nlo" -o -name "*.nls" \) -delete
  rm -f build.txt build_output.txt
  rm -rf build
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
