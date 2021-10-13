local tempdir = "/tmp"

function config_exists(file, local_path)
  local config = vim.fn.glob(file, 0, 1)
  if not vim.tbl_isempty(config) then
    return vim.fn.getcwd() .. "/" .. config[1]
  else
    return local_path
  end
end

local remove_whitespace = {{cmd = {"sed -i 's/[ \t]+$//'"}}}

local prettier = {
  {
    cmd = {
      function(file)
        local local_path = os.getenv("HOME") .. "/.config/nvim/.prettierrc"
        local config = config_exists(".prettierrc*", local_path)
        return string.format("prettier --config %s --tab-width %s -w \"%s\"",
          config, vim.bo.shiftwidth, file)
      end
    },
    tempfile_dir = tempdir
  }
}

local mdprettier = {
  {
    cmd = {
      function(file)
        local local_path = os.getenv("HOME") .. "/.config/nvim/.prettierrc"
        local config = config_exists(".prettierrc*", local_path)
        return string.format("prettier -w \'%s\' --prose-wrap always", file)
      end
    }
  }

}

local luaformatter = {
  {
    cmd = {
      function(file)
        local local_path = os.getenv("HOME") .. "/.config/nvim/.lua-format"
        local config = config_exists(".lua-format", local_path)
        return string.format("lua-format -i %s --config=%s", file, config)
      end
    },
    tempfile_dir = tempdir
  }
}

require("format").setup {
  ["*"] = remove_whitespace,
  javascript = prettier,
  javascriptreact = prettier,
  typescript = prettier,
  typescriptreact = prettier,
  markdown = mdprettier,
  html = prettier,
  css = prettier,
  json = prettier
  -- lua = luaformatter
}
