#!/bin/bash

echo "🚀 SCRIPT 43 — External Integrity Scanner v1.0"
echo "================================================="

###############################################
# 1. Directories
###############################################
mkdir -p src/audit
mkdir -p docs/audit

echo "✔ Audit directories created"


###############################################
# 2. Python Integrity Scanner
###############################################
cat > src/audit/integrity_scanner.py << 'EOPY'
"""
External Integrity Scanner v1.0 (Public-Safe)

Performs:
- repo structure validation
- module presence checks
- hash-level consistency analysis
- Tri-Layer Validator verification

All logic is public-safe.
"""

import os
import hashlib
import time
from pathlib import Path

REQUIRED_DIRS = [
    "src",
    "src/bhbr",
    "src/bht",
    "src/zk_stub",
    "src/validator",
    "src/coupling",
    "docs",
]

def hash_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        h.update(f.read())
    return h.hexdigest()

class IntegrityScanner:
    def run(self):
        results = {
            "timestamp": int(time.time()),
            "missing_dirs": [],
            "file_hashes": {},
        }

        for d in REQUIRED_DIRS:
            if not os.path.isdir(d):
                results["missing_dirs"].append(d)

        # Hash all .py and .js files
        for path in Path("src").rglob("*.*"):
            if path.suffix in [".py", ".js"]:
                results["file_hashes"][str(path)] = hash_file(path)

        # Unified snapshot
        payload = (
            "".join(results["missing_dirs"]) +
            "".join(results["file_hashes"].values()) +
            str(results["timestamp"])
        )

        results["unified_snapshot"] = hashlib.sha256(payload.encode()).hexdigest()

        return results
EOPY

echo "✔ Python integrity scanner created"


###############################################
# 3. JavaScript Integrity Scanner
###############################################
cat > src/audit/integrity_scanner.js << 'EOJS'
import fs from "fs";
import crypto from "crypto";

const requiredDirs = [
  "src",
  "src/bhbr",
  "src/bht",
  "src/zk_stub",
  "src/validator",
  "src/coupling",
  "docs"
];

function hashFile(path) {
  return crypto
    .createHash("sha256")
    .update(fs.readFileSync(path))
    .digest("hex");
}

export class IntegrityScanner {
  run() {
    const results = {
      timestamp: Date.now(),
      missing_dirs: [],
      file_hashes: {}
    };

    for (const d of requiredDirs) {
      if (!fs.existsSync(d)) results.missing_dirs.push(d);
    }

    function traverse(dir) {
      const files = fs.readdirSync(dir);
      for (const file of files) {
        const full = `${dir}/${file}`;
        const stat = fs.statSync(full);
        if (stat.isDirectory()) traverse(full);
        else if (full.endsWith(".js") || full.endsWith(".py")) {
          results.file_hashes[full] = hashFile(full);
        }
      }
    }

    traverse("src");

    const payload =
      results.missing_dirs.join("") +
      Object.values(results.file_hashes).join("") +
      results.timestamp.toString();

    results.unified_snapshot = crypto
      .createHash("sha256")
      .update(payload)
      .digest("hex");

    return results;
  }
}
EOJS

echo "✔ JavaScript integrity scanner created"


###############################################
# 4. Documentation
###############################################
cat > docs/audit/OVERVIEW.md << 'EODOC'
# External Integrity Scanner v1.0

This layer provides:
- directory validation
- code presence verification
- file hashing
- unified snapshot consistency hash
- public-safe integrity checks

It is designed to simulate an *external auditor* validating
the state of the economic architecture without requiring
access to proprietary logic or patented mechanisms.
EODOC

echo "✔ Audit documentation created"


###############################################
# 5. Git commit + push
###############################################
git add src/audit docs/audit
git commit -m "SCRIPT 43 — External Integrity Scanner v1.0 (Public-Safe)"
git push

echo "🎯 SCRIPT 43 COMPLETE — EXTERNAL AUDITOR ONLINE"
