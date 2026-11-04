# Matriu de monitoratge — Halloweb

Dades d'exemple amb adreces TEST-NET. Estat inicial abans de l'actualització del protocol.

| Host | IP | Indicador | Severitat | Port infectat | Estat |
|---|---|---|---|---:|---|
| ghost-web-01 | 192.0.2.10 | WebShell | Critical | pendent del protocol | Aïllament prioritari |
| spectral-db-02 | 198.51.100.24 | CredentialTheft | High | pendent del protocol | Investigació prioritària |
| phantom-gw-03 | 203.0.113.8 | PortScan | Medium | pendent del protocol | Monitoratge |

## Criteris d'escalat

- **Critical / High:** revisar l'actiu i preparar aïllament amb l'script en mode simulació.
- **Medium:** conservar evidències i monitorar. No executar accions automàtiques.
- A Fase 2, només els ports de la llista crítica (22, 445, 3389) podran generar una regla; la resta es descarten.

## Estat

- [x] Matriu inicial creada.
- [ ] Actualitzar Port_Infectat després de la Issue d'emergència.
- [ ] Confirmar la resposta amb revisió creuada.
