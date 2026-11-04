# ESCAPE ROOM — THE HALLOWEB INCIDENT

Projecte de Forensic Software per recuperar i integrar els fragments de mitigació. Els valors d'IP del CSV són rangs reservats TEST-NET per a documentació, no sistemes reals.

## Missió i contracte final

Recuperar els indicadors, preparar una resposta de xarxa controlada i consolidar dades, script i monitoratge a `main` mitjançant Pull Requests. El contracte final de `data/ghost_hosts.csv` és:

`Hostname,IP,Threat,Severity,Port_Infectat`

`Port_Infectat` és un port TCP enter entre 1 i 65535. L'script només considera els ports crítics 22, 445 i 3389 i les severitats Critical/High; els ports absents, invàlids o fora de la llista crítica s'ometen.

## Bitàcola de l'incident

### Fase 1 — invocació i contracte de dades

- **Agent 1 — `projecte/spectral-data`:** recuperat el diccionari inicial a `data/ghost_hosts.csv`; el primer esquema era `Hostname,IP,Threat,Severity`.
- **Agent 2 — `projecte/defense-script`:** creat `scripts/exorcism.ps1` amb validació i mode simulació per defecte. `-Apply` és obligatori per crear regles.
- **Agent 3 — `feature/status-dashboard`:** creada la matriu `reports/dashboard.md` per prioritzar Critical/High i monitorar Medium.
- Les tres branques van partir del mateix commit base i cadascuna va registrar les troballes al README, causant divergències intencionades.

### Fase 2 — branca sospitosa i actualització d'emergència

- **Branca `feature/nightmare-code`:** la mostra proposava un bloqueig general sense validar host ni port. Es va aïllar com a evidència inert a `reports/quarantine-nightmare.md`; no s'ha desat ni executat payload.
- **Issue #4:** el professor exigeix `Port_Infectat` i descartar ports no crítics.
- **Hotfix `hotfix/protocol-update`:** dades i script s'han actualitzat conjuntament. Ports crítics acordats: TCP 22, 445 i 3389. El CSV inclou també un port no crític (8080) per deixar constància que s'ha descartat.

### Fase 3 — Merge Hell i integració

- Les bitàcoles divergents s'han consolidat en aquesta branca `integration/merge-hell-resolution`, preservant les troballes de dades, scripting, auditoria i forense.
- La resolució final conserva una sola bitàcola coherent i els fitxers s'integren mitjançant PR; no s'han publicat canvis directament a `main`.
- Les PRs de les branques de treball i la PR d'integració requereixen revisió creuada d'un company abans de fusionar.

## Ús de l'script

En PowerShell a Windows:

```powershell
# Simulació: només imprimeix les accions previstes
.scriptsexorcism.ps1

# Aplicació explícita de les regles (requereix privilegis de tallafoc)
.scriptsexorcism.ps1 -Apply
```

L'script crea regles d'entrada TCP per port local en el sistema on s'executa. Cal revisar el pla i executar-lo només en el sistema de laboratori autoritzat.

## Topologia de branques

- `projecte/spectral-data` — recuperació del CSV.
- `projecte/defense-script` — lògica inicial d'aïllament.
- `feature/status-dashboard` — auditoria i matriu.
- `feature/nightmare-code` — indici sospitós quarantinat.
- `hotfix/protocol-update` — actualització coordinada del contracte i l'script.
- `integration/merge-hell-resolution` — consolidació de bitàlogues i resolució de divergències abans de la PR final.

## Fites de versió

- `v0.1-alpha` — contracte inicial i primeres PRs de Fase 1.
- `v0.2-beta` — resposta a Issue #4 i hotfix del protocol.
- `v1.0-gold` — integració final després de la revisió creuada.
