# Neovim Configuration

This repository contains my personal Neovim configuration, structured for easy maintenance and extendability. The configuration is written in Lua and uses Packer.nvim as the package manager.

## Structure

The configuration is organized into several directories and files for clarity:

- `after/plugin/`: Custom configurations for various plugins.
- `lua/yrzhou/`: Core configuration files, including settings, key mappings, and plugin management.
- `init.lua`: The main entry point for Neovim configuration.

## Getting Started

### Prerequisites

- Neovim (0.5 or later)
- Git (for cloning the repository and downloading plugins)
- pyls (for python language server)

### Installation

1. Clone this repository into your Neovim configuration folder:

   ```bash
   git clone https://github.com/yrzhou/nvim-config.git ~/.config/nvim


2. Open Neovim, and Packer will automatically install the plugins:

  ```:PackerInstall```

3. Optionally, compile the configuration for faster startup:

  ```:PackerCompile```


## Key Features

- LSP Support: Integrated language server protocol support for various languages.
- Telescope: Fuzzy finder for files, buffers, and more.
- Treesitter: Advanced syntax highlighting using Treesitter.
- Harpoon: Quick file navigation and session management.


## Customization

Feel free to modify the lua/yrzhou/*.lua files to suit your preferences. The configuration is modular, making it easy to add or remove components.


## License
This configuration is open-sourced software licensed under the MIT license.
