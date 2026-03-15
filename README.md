# Charactersheet Flutter Starter (D&D 5e)

Bozza di progetto Flutter pronta da aprire in Android Studio per una schermata tipo dashboard con 4 sezioni:

1. **Dati generali** (nome, razza, classe, livello)
2. **Caratteristiche + feature/talenti**
3. **Equipaggiamento**
4. **Spell / incantesimi**

## Funzionalità incluse

- Localizzazione base:
  - Inglese (`en`) principale
  - Italiano (`it`) secondaria
- Gestione tema con 3 opzioni:
  - Light
  - Dark
  - Obsidian
- Database SQLite inizializzato da script SQL (`db/schema.sql` + `db/seed.sql`).
  - Puoi gestire/popolarlo anche con **DBeaver** (aprendo il file SQLite o lavorando sugli script SQL).

## Struttura

- `lib/main.dart`: UI di esempio, cambio lingua, cambio tema.
- `lib/l10n/app_localizations.dart`: dizionario localizzazioni EN/IT.
- `lib/theme/app_themes.dart`: temi applicativi.
- `lib/data/database_service.dart`: init SQLite da script SQL.
- `db/schema.sql`: schema tabelle (`races`, `classes`, `equipment`, `spells`).
- `db/seed.sql`: dati iniziali di esempio.

## Avvio progetto

> In questo ambiente non è installato Flutter, ma il repository contiene già i file base.

1. Installa Flutter SDK (stabile).
2. Apri la repo in Android Studio.
3. Esegui:

```bash
flutter pub get
flutter run
```

## Uso con DBeaver

### Opzione A (consigliata): modifica script SQL

- Aggiorna `db/schema.sql` e/o `db/seed.sql`.
- Reinstalla l'app (o cancella i dati app) per rigenerare il DB.

### Opzione B: apri DB SQLite generato

Dopo il primo avvio, il file DB viene creato nel path interno dell'app (sandbox Android).
Per uso pratico con DBeaver, puoi:

- fare pull del file DB dal device/emulatore,
- modificarlo in DBeaver,
- rimetterlo nel percorso applicativo.

Per sviluppo veloce, la strategia più semplice resta gestire gli script SQL in repo.
