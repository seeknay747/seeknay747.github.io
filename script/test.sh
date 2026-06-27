#!/usr/bin/env bash
# Local test runner — mirrors the checks in .github/workflows/ci.yml.
# Run inside the bundler-managed gem environment (the Ruby equivalent of a venv):
#
#   bundle config set --local path vendor/bundle   # optional: isolate gems to ./vendor
#   bundle install
#   bundle exec ./script/test.sh
#
# HTML-Proofer needs libcurl; on Windows use WSL/Linux/CI (the build + front-matter
# checks run anywhere). Set SKIP_PROOFER=1 to skip the link check locally.
set -euo pipefail
cd "$(dirname "$0")/.."

echo "==> [1/3] Front matter check"
ruby script/check_front_matter.rb

echo "==> [2/3] Jekyll build (production parity)"
JEKYLL_ENV=production bundle exec jekyll build

if [[ "${SKIP_PROOFER:-0}" == "1" ]]; then
  echo "==> [3/3] HTML-Proofer SKIPPED (SKIP_PROOFER=1)"
  exit 0
fi

echo "==> [3/3] Build for link check + HTML-Proofer"
JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_config_proofer.yml
bundle exec htmlproofer ./_site \
  --disable-external \
  --allow-hash-href \
  --ignore-missing-alt

echo "All checks passed."
