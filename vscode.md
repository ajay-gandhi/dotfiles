# VS Code

Extensions to install:
* Prettier
* Vim

## User settings (JSON)

```json
{
  "terminal.integrated.tabs.enabled": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "files.trimTrailingWhitespace": true,
  "typescript.tsserver.maxTsServerMemory": 8192,
  "typescript.updateImportsOnFileMove.enabled": "always",
  "files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/build/**": true,
    "**/node_modules/*/**": true
  },
  "editor.cursorSurroundingLines": 999,
  "vim.insertModeKeyBindings": [
    {
      "before": ["j", "k"],
      "after": ["<esc>"]
    }
  ],
  "vim.normalModeKeyBindings": [
    {
      "before": ["<leader>", "q"],
      "after": [":", "q", "<CR>"]
    },
    {
      "before": ["<leader>", "w"],
      "after": [":", "w", "<CR>"]
    }
  ],
  "vim.easymotion": true,
  "vim.leader": "<space>",
  "vim.hlsearch": true,
  "files.exclude": {
    "gopath/pkg/dep": true,
    "node_modules": true
  },
  "editor.tabSize": 2,
  "editor.cursorStyle": "line",
  "editor.lineNumbers": "on",
  "editor.wordSeparators": "/\\()\"':,.;<>~!@#$%^&*|+=[]{}`?-",
  "editor.wordWrap": "off",
  "workbench.startupEditor": "none",
  "editor.fontFamily": "'Fira Code', Menlo, Monaco, 'Courier New', monospace",
  "editor.fontSize": 14,
  "editor.fontLigatures": true,
  "javascript.autoClosingTags": false,
  "typescript.autoClosingTags": false,
  "extensions.ignoreRecommendations": true,
  "terminal.explorerKind": "external",
  "githubPullRequests.terminalLinksHandler": "github",
  "githubPullRequests.fileListLayout": "flat",
  "githubPullRequests.remotes": [],
  "remote.autoForwardPortsSource": "hybrid",
  "eslint.experimental.useFlatConfig": true,
  "redhat.telemetry.enabled": false
}
```

## Keybindings (JSON)

```json
{
  "terminal.integrated.tabs.enabled": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "files.trimTrailingWhitespace": true,
  "typescript.tsserver.maxTsServerMemory": 8192,
  "typescript.updateImportsOnFileMove.enabled": "always",
  "files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/build/**": true,
    "**/node_modules/*/**": true
  },
  "editor.cursorSurroundingLines": 999,
  "vim.insertModeKeyBindings": [
    {
      "before": ["j", "k"],
      "after": ["<esc>"]
    }
  ],
  "vim.normalModeKeyBindings": [
    {
      "before": ["<leader>", "q"],
      "after": [":", "q", "<CR>"]
    },
    {
      "before": ["<leader>", "w"],
      "after": [":", "w", "<CR>"]
    }
  ],
  "vim.easymotion": true,
  "vim.leader": "<space>",
  "vim.hlsearch": true,
  "files.exclude": {
    "gopath/pkg/dep": true,
    "node_modules": true
  },
  "editor.tabSize": 2,
  "editor.cursorStyle": "line",
  "editor.lineNumbers": "on",
  "editor.wordSeparators": "/\\()\"':,.;<>~!@#$%^&*|+=[]{}`?-",
  "editor.wordWrap": "off",
  "workbench.startupEditor": "none",
  "editor.fontFamily": "'Fira Code', Menlo, Monaco, 'Courier New', monospace",
  "editor.fontSize": 14,
  "editor.fontLigatures": true,
  "javascript.autoClosingTags": false,
  "typescript.autoClosingTags": false,
  "extensions.ignoreRecommendations": true,
  "terminal.explorerKind": "external",
  "githubPullRequests.terminalLinksHandler": "github",
  "githubPullRequests.fileListLayout": "flat",
  "githubPullRequests.remotes": [],
  "remote.autoForwardPortsSource": "hybrid",
  "eslint.experimental.useFlatConfig": true,
  "redhat.telemetry.enabled": false
}
```
