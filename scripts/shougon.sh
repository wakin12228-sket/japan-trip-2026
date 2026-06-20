#!/usr/bin/env bash
# 收工腳本 — 快速 git add + commit（push 需手動確認）
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "❌ 尚未初始化 Git。請先執行："
  echo "   git init"
  echo "   git remote add origin <你的 GitHub repo URL>"
  exit 1
fi

MSG="${1:-收工：更新進度與筆記}"

echo "📂 工作目錄：$ROOT"
echo "📝 Commit 訊息：$MSG"
echo ""

git add cloud.md obsidian/ src/ firebase/ .cursor/ .gitignore
git status

echo ""
read -r -p "確認 commit？(y/N) " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  git commit -m "$MSG"
  echo "✅ 已 commit。"
  echo ""
  read -r -p "推送到 GitHub？(y/N) " push_confirm
  if [[ "$push_confirm" =~ ^[Yy]$ ]]; then
    git push
    echo "✅ 已 push 到 GitHub。"
  else
    echo "⏭️  略過 push。之後可執行：git push"
  fi
else
  echo "❌ 已取消。"
fi
