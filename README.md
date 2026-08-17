# Homebrew ProofX

> **Homebrew tap for [ProofX](https://github.com/EslaM-X/proofx)** — Evidence Infrastructure for Software

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Homebrew](https://img.shields.io/badge/Homebrew-Tap-blue.svg)](https://github.com/EslaM-X/homebrew-proofx)
[![ProofX](https://img.shields.io/badge/ProofX-v0.2.1-green.svg)](https://github.com/EslaM-X/proofx/releases/tag/v0.2.1)
[![Go](https://img.shields.io/badge/Go-1.23+-00ADD8.svg)](https://go.dev/)
[![Security](https://img.shields.io/badge/Security-Validation-orange.svg)](https://github.com/EslaM-X/proofx/tree/main/proof/testdata/security)

---

## Quick Install

```bash
brew tap EslaM-X/proofx
brew install proofx
```

## What is ProofX?

ProofX turns **"trust me"** into **"verify it yourself."**

```
Claim → Evidence → Proof → Verification
```

- **CLI** — Collect evidence, generate signed proofs, verify anywhere
- **GitHub Action** — Automated evidence collection in CI/CD
- **Public Verification** — Anyone can verify your proof in the browser

## What You Get

```
$ proofx --version
proofx 0.2.1
```

```bash
# Collect evidence from your project
proofx collect

# Generate a cryptographically signed proof
proofx prove

# Verify any proof
proofx verify proof.json
```

## How It Works

```
┌─────────────────────────────────────────────────┐
│                   ProofX                         │
│                                                  │
│  ┌──────────┐   ┌──────────┐   ┌──────────┐    │
│  │ Collect   │ → │  Prove   │ → │  Verify  │    │
│  │ Evidence  │   │  Sign    │   │  Check   │    │
│  └──────────┘   └──────────┘   └──────────┘    │
│       │              │              │            │
│       ↓              ↓              ↓            │
│   git, tests,    Merkle root    Ed25519 sig     │
│   deps, env      + SHA-256     + full binding    │
└─────────────────────────────────────────────────┘
```

### Evidence Collection

| Collector | What It Captures |
|-----------|-----------------|
| **Git** | Commit, branch, repository, status |
| **Tests** | Pass/fail counts, test output |
| **Dependencies** | Module graph, versions, checksums |
| **Artifacts** | Build outputs, SHA-256 digests |
| **Environment** | OS, Go version, CI metadata |

### Cryptographic Guarantees

- **Ed25519 signatures** — Each proof is signed with a unique key pair
- **Merkle tree binding** — Evidence items are bound via deterministic Merkle root
- **Full commitment** — Signature binds version + project + subject + claims + algorithm + root
- **Domain separation** — Strict label prefixes prevent cross-protocol attacks

## Installation Options

### Standard Install

```bash
brew tap EslaM-X/proofx
brew install proofx
```

### From Source

```bash
go install github.com/EslaM-X/proofx/cmd/proofx@v0.2.1
```

### Verify Installation

```bash
proofx --version
# proofx 0.2.1

proofx verify --help
# Usage: proofx verify <proof.json>
```

## GitHub Action

Add to your workflow:

```yaml
- name: ProofX Evidence
  uses: EslaM-X/proofx@v0.2.1
  with:
    command: collect
```

## Project Structure

```
homebrew-proofx/
├── Formula/
│   └── proofx.rb          ← Homebrew formula
├── LICENSE                 ← MIT License
└── README.md               ← This file
```

## Security

ProofX undergoes rigorous security validation:

| Layer | Coverage |
|-------|----------|
| **Property Tests** | 29 properties × 10,000 mutations each |
| **Fuzz Targets** | 5 targets (Parse, Verify, Root, Digest, Full pipeline) |
| **Security Corpus** | 15 regression attack vectors |
| **CI Fuzzing** | PR smoke (30s) + Nightly deep (10min) |

See [SECURITY.md](https://github.com/EslaM-X/proofx/blob/main/docs/CRYPTOGRAPHY.md) for details.

## Roadmap

| Version | Milestone | Status |
|---------|-----------|--------|
| v0.2.1 | Signature Binding Hardening | ✅ Released |
| v0.3.0 | WASM Verifier + Public Verification | 🔄 In Progress |
| v0.4.0 | External Adopter #1 | 📋 Planned |
| v1.0.0 | Stable Release | 📋 Planned |

## Links

- **ProofX Core** — [github.com/EslaM-X/proofx](https://github.com/EslaM-X/proofx)
- **Releases** — [github.com/EslaM-X/proofx/releases](https://github.com/EslaM-X/proofx/releases)
- **Documentation** — [github.com/EslaM-X/proofx/tree/main/docs](https://github.com/EslaM-X/proofx/tree/main/docs)
- **Issues** — [github.com/EslaM-X/proofx/issues](https://github.com/EslaM-X/proofx/issues)
- **Security** — [github.com/EslaM-X/proofx/security](https://github.com/EslaM-X/proofx/security)

## License

[MIT](LICENSE) © [EslaM-X](https://github.com/EslaM-X)
