# Working agreement

Preferences that apply in every repository. A repository's own AGENTS.md or CLAUDE.md may add stricter rules; those win.

## Git

- Never commit unless I explicitly ask for it in that turn. Make the edits, run the checks, report, and leave the working tree modified; I review and stage myself.
- Never push unless I ask. If a push fails, explain why and leave the retry to me.
- Never amend, squash, reset-and-recommit or rebase existing commits unless I ask. A follow-up fix is a new commit.
- Never bypass hooks or checks (`--no-verify`, `SKIP=`, editing a hook). If one blocks a commit, report which hook failed and why, and let me decide.
- Never commit on `main`/`master`. Check the branch in the same command as the commit (`git branch --show-current && git commit ...`); if it is the main branch, create a `<type>/<short-slug>` branch first.
- Commit message: one line, Conventional Commits (`feat fix docs style refactor perf test build ci chore revert`), at most 100 characters, no body, no trailers. In particular no `Co-Authored-By` line, even when no hook enforces it.
- One commit per independent change. Commit the safe part; for a risky part (live services, credentials, shared code), show the diff, say what could break and how to verify it, and wait for my go-ahead.
- Update a branch with `git pull --rebase`, never a merge.

## Scope

- Do only what was asked. A version bump or build fix does not license source changes: if the build needs a code edit, list the options with their trade-offs and wait. Prefer a dependency declaration over a source edit when either works.
- Ask before changing shared code that other features use.
- Push back when my idea deviates from industry-standard practice or language idiom: name the standard alternative and give a recommendation. Follow my decision if I reaffirm it.
- Keep line endings as they are. Some repos mix CRLF and LF per file; edit byte-safely and check that `git diff --stat` shows no whole-file rewrite.

## Reports

- Mark everything that needs my attention:
  - 🔺 something that would break or go wrong unless I look at it, think it through or decide
  - 🔸 anything else I should know: choices you made, open questions, untested parts
- Things that went well (passing tests, finished work) get no marker. Keep 🔺 for real breakage risk.
- Say plainly what was verified and what was not (e.g. "not tried on hardware").
- In design discussions or grilling, ask one question per turn, with your recommendation.

## Code

- Comments explain only the non-obvious *why*, for a reader who already knows the subject: a constraint, a trap, a rejected alternative. No narration of what the code does. Often no comment at all, especially on a one-line change.
- Rules and version tables go in a data file (e.g. JSON), not in code constants.
- Visual or tunable code: every magic number is a named constant at the top of the module with a one-line comment.
- In every language, assign non-trivial call results (service calls, constructors, conversions, long chains) to a named local before passing them as arguments; immutable where the language allows (Java `final var`, Kotlin `val`, TypeScript `const`). Plain getters, translation lookups, lambdas, collection pipelines, receiver chains and return values stay inline.

## Docs

- Concise: state a why once, point to it elsewhere.
- Describe the current state only; no history of what failed or was not done.
- Reusable components (roles, libraries) are documented in their own terms, without naming the specific apps that use them.
- Never name customers, or cite class names and other specifics from their code, in anything that stays in a repository.
