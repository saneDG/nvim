local cmp = require('cmp')

local cmp_mappings = cmp.mapping.preset;

-- disable completion with tab
-- this helps with copilot setup
-- This doesn't seem to work though
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
  mapping = cmp_mappings,
})
