---
name: ansible
description: My Ansible conventions. Use when writing or reviewing Ansible roles, playbooks, templates or filter plugins.
---

# Ansible

- Computation goes in `filter_plugins/` as Python with pytest, not in Jinja chains in YAML.
- A task's `loop` is templated before its `when`; guard a loop that can raise with `include_tasks`, not `when`.
