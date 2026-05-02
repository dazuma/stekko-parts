# frozen_string_literal: true

expand :clean do |t|
  t.paths = :gitignore
  t.preserve = [".claude/plans", ".claude/settings.local.json"]
end
