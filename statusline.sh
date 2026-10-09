#!/usr/bin/env bash
# Claude Code status line: model · context used/size (%) · git branch.
set -u

input=$(cat)

# used tokens are input-only, the same formula Claude Code uses for used_percentage
line=$(jq -r '
  def human: if . >= 1000000 then "\(. / 1000000 | floor)M"
             elif . >= 1000 then "\(. / 1000 | floor)k"
             else tostring end;
  (.context_window // {}) as $cw
  | ($cw.current_usage // {}) as $u
  | (($u.input_tokens // 0) + ($u.cache_creation_input_tokens // 0)
     + ($u.cache_read_input_tokens // 0)) as $used
  | def limit($label; $window): $window.used_percentage // empty | " · \($label) \(floor)%";
  "\(.model.display_name // "?")"
    + ([.effort.level // empty | " · \(.)"] | join(""))
    + " · ctx \($used | human)/\(($cw.context_window_size // 0) | human)"
    + " (\(($cw.used_percentage // 0) | floor)%)"
    + ([limit("5h"; .rate_limits.five_hour), limit("7d"; .rate_limits.seven_day)] | join(""))
' <<<"$input")

dir=$(jq -r '.workspace.current_dir // .cwd // empty' <<<"$input")
branch=$(git -C "${dir:-.}" branch --show-current 2>/dev/null)

printf '%s%s\n' "$line" "${branch:+ · $branch}"
