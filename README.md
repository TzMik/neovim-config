# 🚀 Mikel's Neovim Configuration (`nvim-config`)

Welcome to my personal Neovim configuration!

This setup is designed for efficient development, primarily written in **Lua**, and utilizes the **[Lazy.nvim](https://github.com/folke/lazy.nvim)** plugin manager.

## ✨ Key Features

* **Plugin Manager:** [Lazy.nvim](https://github.com/folke/lazy.nvim)
* **Completion:** [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with LSP and Snippet integrations.
* **LSP (Language Server Protocol):** Configuration for multi-language support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
* **File Navigation:** [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for quick file and command searching.
* **Theme:** (Add the theme you use, e.g., `tokyonight.nvim`)

## 🛠️ Prerequisites

For this configuration to work correctly, you will need the following installed:

1.  **Neovim:** Version 0.9.0 or later.
2.  **Git:** To clone the repository and the plugins.
3.  **C/C++ Compiler (Optional):** For certain plugins that require compilation (like Treesitter).
4.  **Language Servers:** (e.g., `npm install -g typescript-language-server` for TypeScript).

## 📥 Installation

Follow these steps to clone and use my configuration on your system.

**⚠️ Warning:** This process will *replace* any existing Neovim configuration you have in the standard path. Make sure to back it up if necessary.

### 1. Clone the Repository

Open your terminal and execute:

```bash
# Move to config directory
cd ~/.config

# Backup your current configuration (if it exists)
mv nvim nvim.bak

# Clone my repository into the standard Neovim location
git clone https://github.com/TzMik/neovim-config.git

# Change cloned repository name to 'nvim'
mv neovim-config nvim
````

### 2\. Initialize Plugins

Once cloned, **Lazy.nvim** will automatically handle the installation of all plugins.

1.  Open Neovim for the first time:
    ```bash
    nvim
    ```
2.  You will see a **Lazy.nvim** screen as it downloads and installs all plugins listed in `lua/plugins.lua`.
3.  Wait for the process to complete. If you encounter errors or warnings, they are often due to missing dependencies (like an uninstalled LSP server).

### 3\. Enjoy\!

After the plugin installation is finished, close and reopen Neovim for all settings and keymaps to load correctly.

## ⚙️ Code Structure

The entire configuration is modularized within the `lua/` folder:

  * **`init.lua`**: The main entry point, which initializes Lazy.nvim and loads other modules.
  * **`lua/plugins.lua`**: Contains the definition and configuration for all plugins.
  * **`lua/lsp.lua`**: Configuration for Language Servers (LSP).
  * **`lua/cmp.lua`**: Configuration for autocompletion.
  * **`lua/telescope.lua`**: Configuration for file searching.
  * *Other files...*

## 🤝 Contributions and Contact

If you have any suggestions or find a bug, feel free to open an *Issue*. All help is welcome\!
