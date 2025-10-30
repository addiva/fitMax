# FitMax

FitMax è un'app Flutter per pianificare, tracciare e analizzare gli allenamenti, con supporto completo offline/online, temi chiaro/scuro, lingua automatica o manuale e colori di accento personalizzabili. L'app consente di importare schede JSON (da file, URL o clipboard), organizzare le sessioni giornaliere e visualizzare grafici, calendario e statistiche sui progressi.


## Caratteristiche principali
- **Programmazioni smart**: CRUD completo delle schede con import/export JSON, suggerimenti per la prossima sessione e preview per settimana.
- **Sessioni guidate**: timer di recupero con vibrazione/alert, progressione con set precedenti precompilati, supporto ai video e note.
- **Statistiche avanzate**: grafico del volume, alzate migliori, calendario allenamenti e cronologia con import/export dei log.
- **Multilingua**: inglese, italiano, tedesco, francese, spagnolo, russo, albanese, ebraico e arabo (auto/system override da impostazioni).
- **Tema dinamico**: tema chiaro/scuro legato al sistema o manuale, accento colore personalizzabile.
- **Offline-first**: dati salvati localmente con Hive/SharedPreferences, funzionamento senza rete.

## Requisiti
- Flutter 3.35.6+
- Dart 3.9+

```bash
flutter pub get
flutter run
```

Per rigenerare i file Freezed/JsonSerializable:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Struttura del progetto
```
lib/
  app/                # entry, tema, router, impostazioni
  core/               # modelli, repository, servizi di parsing e storage
  features/
    programs/         # CRUD schede e import/export
    session/          # sessioni attive e suggerimenti
    statistics/       # grafici, calendario e log
    settings/         # bottom sheet impostazioni
  widgets/            # componenti riutilizzabili
assets/schede/        # esempi JSON inclusi all'avvio
l10n/                 # file .arb per la localizzazione
```

## Formato JSON scheda
Ogni scheda è un oggetto con i campi principali:

```json
{
  "id": "A",
  "name": "Allenamento A",
  "note": "Spinte / Schiena leggero",
  "weeks": { "total": 8, "deload": 4 },
  "exercises": [
    {
      "name": "Spinte manubri panca piana",
      "category": "petto",
      "video_url": "https://…",
      "progression": [
        { "sets": 3, "reps": "10", "rest_sec": 180, "tut": "3-1-0-0", "buf": 3 },
        { "inherit": 1, "set_delta": -1 }
      ]
    }
  ]
}
```

- `weeks.total`: numero di settimane programmate.
- `weeks.deload` opzionale per indicare la settimana di scarico.
- `progression`: array ordinato per settimana (posizione = settimana). Ogni step può specificare `sets`, `reps`, `rest_sec`, `tut`, `buf`, `intensity`, `note`, `video_url` oppure usare `inherit`/`*_delta` per ereditare valori da un'altra settimana.

## Import / Export
- **Import locali**: da `Programmazioni → icona file` (FilePicker) o `icona link` per URL (via HTTP) oppure `icona clipboard` per JSON negli appunti.
- **Export**: menu contestuale della programmazione → "Export JSON" copia negli appunti. Le sessioni eseguite si esportano da **Statistiche → icona download** (file `.json` o clipboard su web).

## Impostazioni
Apri l'icona ⚙️ nella tab Programmazioni per:
- scegliere il tema (Sistema/Chiaro/Scuro),
- selezionare la lingua manualmente,
- impostare il colore di accento (palette rapida, custom picker, reset).

## Generatore di schede web
Nel folder [`docs/`](docs/index.html) trovi una pagina HTML responsive per creare schede JSON senza scrivere manualmente.

1. Apri `docs/index.html` (o pubblica su GitHub Pages puntando alla cartella `docs`).
2. Compila i dati del programma (nome, settimane, deload).
3. Aggiungi esercizi, compila le progressioni settimanali.
4. Premi **Generate JSON** e copia / scarica il risultato.

## Localizzazione
I file `.arb` sono in `lib/l10n`. Puoi aggiornare i testi e rigenerare i file di localizzazione con:

```bash
flutter gen-l10n
```

## Licenza
MIT. Vedi [LICENSE](LICENSE) se presente.
