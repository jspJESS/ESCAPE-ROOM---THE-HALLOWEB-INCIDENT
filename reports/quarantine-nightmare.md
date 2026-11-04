# Informe de quarantena — feature/nightmare-code

**Estat:** evidència descriptiva inerta; no conté codi executable.

## Troballa

La branca sospitosa proposava crear una regla general d'entrada sense validar l'adreça, el port o l'esquema del CSV. El nom genèric de la regla podia interferir amb altres controls.

## Decisió forense

- S'ha aïllat la troballa en aquesta nota.
- S'ha rebutjat el bloqueig general.
- La mitigació acceptada valida l'esquema i l'IPv4, filtra severitat i només permet TCP/22, TCP/445 i TCP/3389.
- La mostra no s'ha executat; l'únic artefacte preservat és aquesta descripció.
