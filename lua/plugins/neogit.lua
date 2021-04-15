local neogit = require("neogit")

neogit.setup {
  disable_signs = false,
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  -- override/add mappings
  -- mappings = {
  --   -- modify status buffer mappings
  --   status = {
  --     -- Adds a mapping with "B" as key that does the "BranchPopup" command
  --     ["B"] = "BranchPopup",
  --     -- Removes the default mapping of "s"
  --     ["s"] = "",
  --   }
  -- }
}
