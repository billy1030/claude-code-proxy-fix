# Claude Code for VS Code Extension Proxy Fix

This directory contains a quick-fix configuration and automation script to resolve the authentication mismatch in **Claude Code for VS Code** when using a local API proxy or gateway (such as MiniMax) configured via **`ccswitch`**.

## The Issue
Older configurations and some proxy tools set `ANTHROPIC_AUTH_TOKEN` in the environment. While the Claude CLI occasionally tolerates legacy tokens, the **VS Code Extension** strictly checks for **`ANTHROPIC_API_KEY`**. If it doesn't find it, it returns a `loggedIn: false` state and falls back to a subscription validation check ("Claude Pro or Max required").

## How ccswitch and MiniMax M3 work here
By using **`ccswitch`** with your local proxy settings, the local API proxy (running on `http://127.0.0.1:15721`) translates the Claude CLI and VS Code Extension's Anthropic protocol requests to the **MiniMax M3** backend. 

To ensure the VS Code Extension routes traffic correctly through `ccswitch`, we define:
* **`ANTHROPIC_BASE_URL`**: `http://127.0.0.1:15721` (your local proxy port managed by `ccswitch`)
* **`ANTHROPIC_API_KEY`**: `PROXY_MANAGED` (to satisfy the extension's API key check)

## Contents
* `config.env.json`: A reference JSON configuration displaying the correct modern key names.
* `apply-fix.ps1`: A PowerShell automation script designed for Windows systems.

## How to Apply the Fix

### Option A: Automatically using the PowerShell Script
1. Open a PowerShell terminal.
2. Navigate to this directory:
   ```powershell
   cd c:\ai\claude-code-proxy-fix
   ```
3. Run the script to apply the user-level environment variables:
   ```powershell
   .\apply-fix.ps1
   ```
4. **Restart VS Code** fully so the changes take effect.

---

### Option B: Manually setting the Environment Variables
If you prefer not to run the script, you can set them manually in Windows:
1. Search for **"Edit the system environment variables"** in the Windows Start menu.
2. Click **Environment Variables...**.
3. Under **User variables**, add or modify the following:
   * **Variable:** `ANTHROPIC_API_KEY`
     * **Value:** `PROXY_MANAGED`
   * **Variable:** `ANTHROPIC_BASE_URL`
     * **Value:** `http://127.0.0.1:15721`
4. Click **OK** and restart VS Code.
