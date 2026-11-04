# ESCAPE ROOM — THE HALLOWEB INCIDENT

Projecte de Forensic Software per recuperar i integrar els fragments de mitigació de l'incident. Tots els exemples d'IP són de documentació (TEST-NET) i l'script és de simulació per defecte.

## Objectiu i contracte de dades

Recuperar el diccionari d'amenaces, preparar una resposta de xarxa segura i consolidar el monitoratge a `main` mitjançant branques, commits i Pull Requests. El CSV és la font de dades compartida; `Port_Infectat` esdevé obligatori a la Fase 2.

### Fase 1 — Agent 2: primera resposta

- **Branca `projecte/defense-script`:** creat `scripts/exorcism.ps1` amb validació d'esquema i IP, mode de simulació per defecte i un commutador explícit `-Apply`.
- El primer contracte conté `Hostname,IP,Threat,Severity`; en aquesta versió s'aïllen els actius Critical/High amb una regla de bloqueig per IP.
- No s'executa cap canvi de tallafoc durant la investigació. La Fase 2 restringirà l'acció als ports crítics del nou contracte.

## Fases pendents

- **Fase 2:** incorporar `Port_Infectat`, descartar ports no crítics i documentar la quarantena de `feature/nightmare-code`.
- **Fase 3:** integrar les bitàcoles divergents amb una resolució manual i publicar la versió final després de la revisió.

## Topologia

Branques independents de dades, script i auditoria; una branca de mostra infectada; una branca `hotfix/protocol-update`; i una branca d'integració per resoldre el conflicte de README. Els canvis arriben a `main` per PR.
