# Vault snapshots

Please ensure you are using Vault enterprise, opensource will throw this error:

```
│ Error: error writing "sys/storage/raft/snapshot-auto/config/local": Error making API request.
│
│ URL: PUT http://127.0.0.1:8200/v1/sys/storage/raft/snapshot-auto/config/local
│ Code: 404. Errors:
│
│ * 1 error occurred:
│       * unsupported path
│

│
│
│   with module.snapshot_agent_config.vault_raft_snapshot_agent_config.default[0],
│   on ../../main.tf line 1, in resource "vault_raft_snapshot_agent_config" "default":
│    1: resource "vault_raft_snapshot_agent_config" "default" {
```
