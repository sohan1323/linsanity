# 🔍 Linsanity - Linux User Account Security & Identity Auditor

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: Linux](https://img.shields.io/badge/Platform-Linux-orange.svg)](#prerequisites)
[![Bash](https://img.shields.io/badge/Language-Bash-green.svg)](#)

**Linsanity** is a lightweight, zero-dependency command-line security auditing tool for Linux systems. It parses local identity databases (`/etc/passwd` and `/etc/shadow`) to detect privilege escalation vectors, dormant accounts, and dangerous authentication misconfigurations.

---

## 🎯 Threat Vectors Audited

| Category | Security Check | Threat Vector / Impact |
| :--- | :--- | :--- |
| **Privilege Discovery** | Non-standard `UID 0` accounts | Rogue superuser backdoors hiding under non-root usernames in `/etc/passwd`. |
| **Identity Management** | Empty / Passwordless accounts | Accounts without password hashes in `/etc/shadow`, permitting unauthorized logins. |
| **Account Lifecycle** | Expired accounts | Stale or contractor accounts past their decommissioning date (ghost accounts). |
| **Attack Surface** | Interactive login shells | Service or daemon accounts configured with interactive shells (`/bin/bash`, `/bin/sh`). |

---

## 📋 Prerequisites

- Linux operating system (Ubuntu, Debian, Kali, Arch, CentOS/RHEL, or WSL2)
- Root / Sudo privileges (required to read `/etc/shadow`)
- Standard core utilities: `bash`, `awk`, `grep`, `cut`, `date`

---

## 🚀 Quick Start & Installation

### Option 1: Install System-Wide (Recommended)

Clone the repository and install using `make`:

```bash
git clone https://github.com/<your-username>/linsanity.git
cd linsanity
sudo make install
```

Now you can run **`linsanity`** from anywhere:

```bash
sudo linsanity
```

To uninstall:
```bash
sudo make uninstall
```

---

### Option 2: Run Directly without Installing

```bash
git clone https://github.com/<your-username>/linsanity.git
cd linsanity
chmod +x bin/linsanity
sudo ./bin/linsanity
```

---

## 💻 Usage & Options

```text
Usage: sudo linsanity [OPTIONS]

Options:
  -h, --help       Show help documentation and exit
  -v, --version    Display version information and exit
```

### Exit Codes (For CI/CD and DevSecOps pipelines)
- `0`: All checks passed clean (no vulnerabilities detected).
- `1`: Privilege error (not run as root).
- `2`: Security warnings/critical findings detected.

---

## 🧪 Testing in a Lab Environment

To verify that Linsanity catches security flaws, test it against simulated misconfigurations:

```bash
# 1. Create a passwordless test account:
sudo useradd test_nopass
sudo passwd -d test_nopass

# 2. Create an expired test account:
sudo useradd test_expired
sudo chage -E 2020-01-01 test_expired

# 3. Run Linsanity:
sudo linsanity

# 4. Clean up test accounts:
sudo userdel test_nopass
sudo userdel test_expired
```

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
