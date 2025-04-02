@echo off
REM erstelle die virtuelle umgebung (EINMALIG NÖTIG)
if not exist venv (
    echo erstelle virtuelle Umgebung...
    python -m venv venv
)

REM aktivieren hiermit die virtuelle umgebung
call venv\Scripts\activate

REM reqs installieren
echo Installiere abhängigkeiten aus requirements.txt...
pip install -r requirements.txt

REM Starte VSCode in diesem Ordner
code .
