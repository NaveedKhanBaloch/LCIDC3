#!/bin/bash
echo "📈 CI/CD Performance Monitor"
echo "============================"
echo
echo "📁 Project Analysis:"
echo "Source files: $(find src -name '*.js' 2>/dev/null | wc -l)"
echo "Test files:   $(find tests -name '*.js' 2>/dev/null | wc -l)"
echo "Workflows:    $(find .github/workflows -name '*.yml' 2>/dev/null | wc -l)"
if [ -f package.json ]; then
  echo "Dependencies: $(node -e "console.log(Object.keys(require('./package.json').dependencies||{}).length)")"
  echo "DevDeps:      $(node -e "console.log(Object.keys(require('./package.json').devDependencies||{}).length)")"
fi
if [ -d node_modules ]; then
  echo "node_modules: $(du -sh node_modules 2>/dev/null | cut -f1)"
fi
echo
echo "🏗️ Build Analysis:"
if [ -d dist ]; then
  echo "dist size:    $(du -sh dist 2>/dev/null | cut -f1)"
  echo "dist files:   $(find dist -type f | wc -l)"
else
  echo "No build output (npm run build)"
fi
echo
echo "🎯 Tips: Use npm ci, cache deps, run jobs in parallel, and skip deploy on docs-only changes."
echo "🔗 Actions: https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]//' | sed 's/.git$//')/actions"
