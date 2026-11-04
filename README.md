# ESCAPE ROOM — THE HALLOWEB INCIDENT

Projecte de Forensic Software per recuperar i integrar els fragments de mitigació de l'incident. Tots els exemples d'IP són de documentació (TEST-NET) i l'script és de simulació per defecte.

## Objectiu i contracte de dades

Recuperar el diccionari d'amenaces, preparar una resposta de xarxa segura i consolidar el monitoratge a `main` mitjançant branques, commits i Pull Requests. El CSV és la font de dades compartida; `Port_Infectat` esdevé obligatori a la Fase 2.

### Fase 1 — descoberta inicial

- **Agent 1 — `projecte/spectral-data`:** recuperat el primer esquema del diccionari a `data/ghost_hosts.csv`: `Hostname,IP,Threat,Severity`.
- **Contracte inicial:** cada fila descriu un actiu, una IP, un indicador d'amenaça i la severitat. S'utilitzen adreces reservades TEST-NET; no identifiquen sistemes reals.
- **Agent 2 — `projecte/defense-script`:** prepararà l'aïllament en mode simulació i validarà els valors abans d'aplicar cap regla.
- **Agent 3 — `feature/status-dashboard`:** consolidarà l'estat dels indicadors a `reports/dashboard.md`.

## Fases pendents

- **Fase 2:** documentar la branca sospitosa, incorporar `Port_Infectat` al contracte i actualitzar l'script perquè descarti ports no crítics.
- **Fase 3:** integrar les branques amb una resolució manual del conflicte de bitàcola, revisar el contingut i publicar `v1.0-gold`.

## Topologia i procés

Branques de treball independents (`projecte/spectral-data`, `projecte/defense-script`, `feature/status-dashboard`), una branca d'incident (`feature/nightmare-code`), una branca de correcció (`hotfix/protocol-update`) i una branca d'integració per resoldre el conflicte. Cap canvi es publica directament a `main`; la integració es fa amb PR.
