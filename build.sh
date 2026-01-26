#!/bin/bash
set -e

# Name der Hauptdatei (ohne .tex Endung)
MAIN="Artikel"

# Clean-Option prüfen
if [ "$1" == "clean" ]; then
  echo "🧹 Bereinige temporäre Dateien..."
  # Standard LaTeX temporäre Dateien + Glossaries/Biber/MakeIndex Dateien
  # Exclude version-control and large common directories to avoid accidental deletions
  find . \( -path "./.git" -o -path "./.github" -o -path "./node_modules" -o -path "./build" \) -prune -o -type f \( -name "*.aux" -o -name "*.bbl" -o -name "*.bcf" -o -name "*.blg" -o -name "*.toc" -o -name "*.lof" -o -name "*.lot" -o -name "*.idx" -o -name "*.ilg" -o -name "*.ind" -o -name "*.out" -o -name "*.log" -o -name "*.run.xml" -o -name "*.lol" -o -name "*.synctex.gz" -o -name "*.fls" -o -name "*.fdb_latexmk" -o -name "*.nlo" -o -name "*.nls" -o -name "*.glo" -o -name "*.gls" -o -name "*.glg" -o -name "*.glsdefs" -o -name "*.ist" -o -name "*.acn" -o -name "*.acr" -o -name "*.alg" -o -name "*.toc2" \) -delete
  # remove common helper files/folders created by scripts
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

# 2b. Glossary index erstellen (falls Glossar verwendet wird)
# Run makeglossaries only if the .glo file exists to avoid errors
if [ -f "${MAIN}.glo" ]; then
  echo "🗂️ Generiere Glossar mit makeglossaries..."
  makeglossaries "$MAIN"
fi

# 3. Verzeichnisse und Referenzen aktualisieren
pdflatex "$MAIN.tex"

# 4. Finaler Lauf für korrekte Seitenzahlen und Verweise
pdflatex "$MAIN.tex"

echo "✅ Build erfolgreich! $MAIN.pdf wurde erstellt."
