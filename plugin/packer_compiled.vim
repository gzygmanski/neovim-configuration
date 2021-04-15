" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/shisam/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/shisam/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/shisam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/shisam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/shisam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["format.nvim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/format.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimwiki = {
    loaded = true,
    path = "/home/shisam/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
