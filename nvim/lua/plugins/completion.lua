return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '*',
  opts = {
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    signature = { enabled = true },
  },
}
