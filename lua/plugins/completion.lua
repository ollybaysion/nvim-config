-- 자동완성: blink.cmp (옛 nvim-cmp 키 그대로 — Enter 확정, C-Space 열기, C-e 닫기, C-b/C-f 문서 스크롤)
local nerd = vim.g.have_nerd_font

require("blink.cmp").setup({
  keymap = { preset = "enter" },
  appearance = { nerd_font_variant = "mono" },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 300 },
    menu = nerd and {} or { draw = { columns = { { "label", "label_description", gap = 1 }, { "kind" } } } },
  },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  signature = { enabled = true },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
