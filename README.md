# czech-diacritics.nvim

`czech-diacritics` is a Neovim plugin that adds diacritics to czech words.

## Installation

- make sure you have `curl` installed.

```lua
-- Packer
use({
  "MirekNguyen/czech-diacritics.nvim",
    config = function()
      require("czech-diacritics").setup()
    end,
})

-- Lazy
{
  "MirekNguyen/czech-diacritics.nvim",
    cmd = "AddDiacritics"
    config = true,
}
```

## Usage

Plugin exposes following commands:

#### `AddDiacritics`

`AddDiacritics` command which adds czech diacritics to words selected in **VISUAL** mode.
