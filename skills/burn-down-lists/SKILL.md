---
name: burn-down-lists
description: Rules for plan and review-finding files such as docs/fixme.md or docs/improvements.md. Use when creating, reading, editing or closing items in them, or when I refer to an item by number ("fix #19").
---

# Burn-down lists

Plans and review findings live in untracked files such as `docs/fixme.md` or `docs/improvements.md`. They never go into a commit.

- Each item is a `### N. Title` heading with its body below, never a Markdown ordered list (IDE renderers renumber those).
- When an item is done, delete its block in the same turn and print the remaining headings as proof. Deciding an item is done is not the same as deleting it.
- Never renumber. Gaps are expected; the numbers are stable handles I refer to ("fix #19").
- Fix cross-references to a deleted item. Delete the file once it is empty.
- Improvement plans use four sections per item, in this order: **Pain point**, **Improvement**, **Benefit**, **Todo** (a `- [ ]` checklist). Tick items as they are done.
