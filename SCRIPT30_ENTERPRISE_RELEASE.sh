#!/bin/zsh

echo "🚀 SCRIPT 30 — Enterprise Release v1.0.0 STARTING"
echo "================================================"

############################################################
# 1. Regenerate release notes
############################################################
echo "📝 Regenerating RELEASE_NOTES.md..."

cat > RELEASE_NOTES.md << 'EON'
# NeuroToken ZK Health System™  
## Enterprise Release v1.0.0 — 11 December 2025

This is the **first full enterprise release** of the NeuroToken ZK Health System™.  
The release contains the complete Open Core structure used across Lionking Biotech's  
neuro-health ecosystem.

### ✔ Included in v1.0.0
- Full project structure (src/, docs/, compliance/, tests/, circuits/, whitepapers/)
- Developer portal documentation
- Whitepapers v2.0 (public-safe, investor-friendly)
- API docs (pre-generated)
- Security model, compliance model, governance model
- ZK Light Engine (public-safe edition)
- Hashing, serialization & loader modules
- Examples for JS + Python
- Roadmap v2.0
- All enterprise scripts (Script 1–29)

### ✔ Notes
- Contains **NO sensitive IP**
- Contains **NO private circuits**
- Contains **NO production cryptography**
- Fully safe for GitHub & investors

EON

############################################################
# 2. Generate enterprise ZIP bundle
############################################################
echo "📦 Creating enterprise release ZIP..."

zip -r neurotoken-zk-health-system_v1.0.0.zip \
    src docs tests circuits examples whitepapers compliance scripts \
    README.md ROADMAP.md RELEASE_NOTES.md LICENSE NOTICE 2>/dev/null

echo "✔ ZIP created: neurotoken-zk-health-system_v1.0.0.zip"
echo ""

############################################################
# 3. Git commit and tag release
############################################################
echo "🔖 Tagging release…"

git add RELEASE_NOTES.md neurotoken-zk-health-system_v1.0.0.zip
git commit -m "Release v1.0.0 — Enterprise Edition"
git tag -a v1.0.0 -m "NeuroToken ZK Health System — Enterprise Release v1.0.0"
git push
git push --tags

echo "✔ GitHub tag v1.0.0 pushed"
echo ""

############################################################
# 4. Create GitHub Release via CLI
############################################################
echo "🌐 Publishing GitHub Release…"

gh release create v1.0.0 \
  neurotoken-zk-health-system_v1.0.0.zip \
  --title "NeuroToken ZK Health System™ — v1.0.0 (Enterprise Release)" \
  --notes-file RELEASE_NOTES.md

echo ""
echo "🎯 SCRIPT 30 COMPLETED — Enterprise Release v1.0.0 Published!"
