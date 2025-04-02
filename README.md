# Prüfungsanalyse-Tool (Statistik + Prognosebasis)

Dieses Projekt bietet eine statistische Auswertung von Prüfungsarchiven, basierend auf strukturierten JSON-Daten mit Aufgaben verschiedener Prüfungsvarianten. Es dient dazu, Muster in Themen und Aufgabentypen zu erkennen und bildet die Grundlage für ein Prognosesystem zur Vorhersage wahrscheinlicher Aufgabenbereiche in zukünftigen Prüfungen. 

## Ziel des Projekts

- Analyse und visualisierung der Aufgabenverteilung (Themen und Typen)
- Export CSV-Daten für weitere Verarbeitung in strukturierter Form
- Aufbau einer statistischen Basis, auf der Vorhersagen künftiger Prüfungsaufgaben möglich werden
- Dient als Grundlage für ein LLM-Modul, das basierend auf der statistischen Analyse automatisiert Aufgaben und Themenprognosen generieren kann


## Beispielausgaben

### Themenverteilung in 10 Prüfungen
![Themenverteilung](statistics/StatistikThemenvereteilung.png)

### Aufgabentypen in 10 Prüfungen
![Aufgabentypen](statistics/StatistikAufgabentypen.png)

## Datenbasis

Die Daten stammen aus 10 simulierten Prüfungen eines bestimmten Fachbereichs(hierbei Prüfung WB). Die JSON-Dateien enthalten jeweils eine Liste von Aufgaben mit den Feldern:

- `thema` – Das Thema der Aufgabe
- `aufgabentyp` – z. B. „offene Frage“ oder „multiple choice“
- `frage` – Die Aufgabenstellung
- `antwort` – Die Musterlösung

![FORMAT](datenformatJSON.PNG)

Die Inhalte basieren auf realen Prüfungen, wurden aber leicht abgewandelt (z. B. Synonyme, Umstellungen), um unterschiedliche Formulierungen bei gleichbleibender Intention zu simulieren. Zusätzlich wurde eine zufällige Varianz von ca. 20 % eingebaut, um realistische Abweichungen zu berücksichtigen.

Für die eigentliche Analyse wurden bewusst 10 Prüfungen berücksichtigt, da dies einem typischen Prüfungszeitraum mehrerer Jahrgänge entspricht und somit eine realistische Grundlage für Prognosen bildet.

Im Ordner `data/` befinden sich zusätzlich 50 simulierte Prüfungsdateien, die ein umfangreicheres Archiv abbilden. Sie wurden generiert, um das Analyseverhalten bei größeren Datenmengen zu testen. Damit diese verwendet werden können, muss die Logik im Analyse-Notebook (`notebooks/analyse_aufgaben.ipynb`) entsprechend angepasst werden – z. B. durch ein automatisiertes Einlesen ALLER JSON-Dateien im Verzeichnis.


## Nutzung

1. Virtuelle Umgebung aktivieren (empfohlen):
    ```bash
    python -m venv .venv
    .\.venv\Scripts\activate
    ```

2. Abhängigkeiten installieren:
    ```bash
    pip install -r requirements.txt
    ```

3. Notebook ausführen:
    ```bash
    jupyter notebook notebooks/analyse_aufgaben.ipynb
    ```

Beim Durchlauf des Notebooks wird automatisch:
- eine Themenanalyse durchgeführt
- eine Aufgabentypanalyse visualisiert
- ein vollständiger CSV-Export erstellt (`output/alle_fragen_gesamt.csv`)

## Projektstruktur

| Pfad                | Beschreibung                                                                 |
|---------------------|------------------------------------------------------------------------------|
| `data/`             | Enthält die JSON-Dateien der 50 varianten (skalierbar nach Fach/Menge) |
| `notebooks/`        | Analyse-notebook (ipynb)                                                      |
| `output/`           | Exportierte CSV-Dateien                             |
| `statistics/`       | grafische Ausgaben der statistischen Analyse                                 |
| `requirements.txt`  | Paketliste für Umgebung                                               |


## Skalierbarkeit und Erweiterung

Das Analyse-Tool wurde zunächst für ein einzelnes Fach und 10 Prüfungen umgesetzt. Es lässt sich jedoch leicht erweitern:

- Weitere Fächer und Jahrgänge können ergänzt werden (mehr Daten = genauere Muster)
- Bestehende JSON-Struktur unterstützt automatisierte Verarbeitung
- Die statistische Grundlage kann von einem nachgeschalteten Modul genutzt werden, das auf Basis der gewonnenen Muster künftige Prüfungsaufgaben thematisch und formal vorhersagt

---

