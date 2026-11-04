# ESCAPE ROOM — THE HALLOWEB INCIDENT

## Fase 2 — coordinació de protocol i resposta

- **Issue d'emergència #4:** el contracte exigeix la columna `Port_Infectat`; Agent 1 i Agent 2 han coordinat l'actualització a la branca `hotfix/protocol-update`.
- **Contracte nou:** `Hostname,IP,Threat,Severity,Port_Infectat`. El port és un enter TCP entre 1 i 65535.
- **Llista crítica acordada:** 22, 445 i 3389. Els ports no inclosos es descarten i no generen regles.
- **Branca `feature/nightmare-code`:** aïllada com a descripció inert; s'ha rebutjat la regla general sense allowlist.
- L'script no aplica canvis sense el commutador `-Apply`; l'execució real requereix Windows i privilegis de tallafoc.
