# Matriu de monitoratge — Halloweb

Dades d'exemple amb adreces TEST-NET reservades.

| Host | IP | Indicador | Severitat | Port infectat | Estat |
|---|---|---|---|---:|---|
| ghost-web-01 | 192.0.2.10 | WebShell | Critical | 445 | Pla de bloqueig TCP/445; revisar després de contenció |
| spectral-db-02 | 198.51.100.24 | CredentialTheft | High | 22 | Pla de bloqueig TCP/22; preservar evidències |
| phantom-gw-03 | 203.0.113.8 | PortScan | Medium | 8080 | Ometre: port no crític i severitat Medium |

## Criteris de monitoratge

- Només TCP/22, TCP/445 i TCP/3389 són ports crítics per a aquesta simulació.
- Només severitats Critical/High passen al pla d'aïllament.
- Ports invàlids, buits o no crítics no creen regles.
- `exorcism.ps1` opera en simulació per defecte; una persona ha d'inspeccionar el pla abans de `-Apply`.
