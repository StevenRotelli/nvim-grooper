# NVIM-Grooper

nvim-grooper is a plugin designed to manage object libraries from vim and similar to the OEM Grooper Visual Studio Plugin

## Requirements

To use this plugin you must have an odbc connection to your Grooper database. for linux and mac users install

- freetds
- unixodbc
- luasqlodbc

**Installation**: Open your terminal and enter the following commands

```zsh
brew install freetds
brew install unixodbc
luarocks install luasql-odbc
```

**Configure ODBC** navigate to the to the /usr/local/etc/freetds.conf add a connection to your Grooper Database

```ini
[YourServerName]
    host = your_server_ip_or_domain
    port = 1433
    tds version = 7.4
```

**Packer** to install using packer place the following in your init.lua file

```lua
use ({StevenRotelli/nvim-grooper})
```

place the following in your plugins folder or init.lua

```lua
require('packer').startup(function()
    use {
        'your-github-username/your-plugin-repo-name',
        config = function()
            require('nvim-grooper').setup('YourDSNName')
        end
    }
end)
```

Alternatively You can use a connection string so

require('nvim-grooper').setup({
conn_string = "YOUR_CONNECTION_STRING_HERE"
})

## Usage

To install using Packer
