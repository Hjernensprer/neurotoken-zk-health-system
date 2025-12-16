#!/bin/zsh

echo "🚀 SCRIPT 31 — Developer SDK Autogeneration (JS + Python)"
echo "==========================================================="

############################################################
# 1. Ensure directory structure exists
############################################################
mkdir -p docs/sdk
mkdir -p docs/api/auto/python
mkdir -p docs/api/auto/js

echo "✔ SDK directories verified"

############################################################
# 2. Regenerate SDK overview page
############################################################
cat > docs/sdk/SDK_OVERVIEW.md << 'EON'
# NeuroToken ZK Health System™ — SDK Overview

The SDK provides high-level tools for integrating with:
- ZK Light Engine
- Hashing + serialization utilities
- Orchestrator
- Domain validation
- Web3/BHBR/BHT interactions (public-safe)
- Sync + Telemetry

## Available SDKs
- **Python SDK** — `/src/sdk/python/client.py`
- **JavaScript SDK** — `/src/sdk/js/client.js`

## Example Usage (Python)
```python
from sdk.python.client import NeuroTokenClient

client = NeuroTokenClient()
result = client.hash("hello")
print(result)
Example Usage (JavaScript)import { NeuroTokenClient } from "./sdk/js/client.js";

const client = new NeuroTokenClient();
console.log(client.hash("hello"));
Auto-generated API docs
	•	Python API: docs/api/auto/python/
	•	JS API: docs/api/auto/js/
EON

echo “✔ SDK overview regenerated”

############################################################

3. Auto-generate Python API docs

############################################################

echo “📘 Generating Python API docs…”

pydoc -w src/sdk/python/client.py 2>/dev/null
mv client.html docs/api/auto/python/index.html 2>/dev/null

echo “✔ Python API docs generated”

############################################################

4. Auto-generate JS API docs using jsdoc

############################################################

echo “📙 Generating JS API docs…”

jsdoc -c scripts/jsdoc.json -r src/sdk/js -d docs/api/auto/js 2>/dev/null

echo “✔ JS API docs generated”

############################################################

5. Git commit + push

############################################################

git add docs/sdk docs/api/auto
git commit -m “SCRIPT 31 — Auto-generated SDK + API docs (JS + Python)”
git push

echo “”
echo “🎯 SCRIPT 31 COMPLETE — Developer SDK Autogeneration Published!”
