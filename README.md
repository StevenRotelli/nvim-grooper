![Linux](https://img.shields.io/badge/Linux-%23.svg?logo=linux&color=FCC624&logoColor=black)
![macOS](https://img.shields.io/badge/macOS-%23.svg?logo=apple&color=000000&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-%23.svg?logo=windows&color=0078D6&logoColor=white)

# ![](https://user-images.githubusercontent.com/95944145/280344172-207f314b-9002-47fc-b46c-e956f195980c.png) VIM-Grooper

`nvim-grooper` is a Neovim plugin designed to facilitate the management of Grooper object libraries directly from Neovim. This functionality is reminiscent of the Grooper Visual Studio Plugin provided by OEM.

## Prerequisites

Before using `nvim-grooper`, you must have an ODBC connection established to your Grooper database. For users on macOS and Linux, ensure the following are installed:

-   `freetds`
-   `unixodbc`
-   `luasql-odbc`

### Installation

1. **Install Dependencies**: If you're on macOS, you can use Homebrew:

    ```zsh
    brew install freetds
    brew install unixodbc
    luarocks install luasql-odbc
    ```

2. **Configure ODBC**: Add a connection to your Grooper database in `/usr/local/etc/freetds.conf`:

    ```ini
    [YourServerName]
        host = your_server_ip_or_domain
        port = 1433
        tds version = 7.4
    ```

## Plugin Installation

### Using Packer

1. Ensure you have [Packer](https://github.com/wbthomason/packer.nvim) installed.

2. In your `init.lua`, you can add:

    ```lua
    require('packer').startup(function()
        use {
            'StevenRotelli/nvim-grooper',
            config = function()
                -- Use a DSN
                require('nvim-grooper').setup('YourDSNName')
                -- Or use a connection string
                -- require('nvim-grooper').setup({
                --     conn_string = "YOUR_CONNECTION_STRING_HERE"
                -- })
            end
        }
    end)
    ```

## Usage

Once installed and configured, you can navigate through the Grooper object tree within Neovim. As you traverse the tree nodes, you can perform various actions:

-   **d**: Download
-   **u**: Update
-   **g**: Get the latest version

These commands will respectively download, update, or retrieve the latest files from your Grooper setup.

---

This improved README now provides clear installation steps for prerequisites, corrects the Packer installation process, and offers basic usage instructions. Adjustments can be made to the usage section once more features or commands are implemented in the plugin.
