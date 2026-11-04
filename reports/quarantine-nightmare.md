# Quarantined specimen — nightmare-code

Status: inert documentation only; never execute this file.

Observed indicators in the recovered fragment:

- Attempts to create a broad inbound firewall block without a port allowlist.
- Does not validate the source IP or the CSV schema.
- Uses a catch-all rule name that can overwrite unrelated incident response rules.

Forensic action: preserve this description, reject the broad rule, and use the reviewed `exorcism.ps1` implementation on the coordinated hotfix branch. No executable payload is stored in this repository.
