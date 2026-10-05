-- 모양: 색 · 아이콘 · 상태줄 · 버퍼 탭 · 키 안내
local nerd = vim.g.have_nerd_font
local map = vim.keymap.set

-- 테마: night · storm · moon · day(밝은) 중 style 로 고른다
require("tokyonight").setup({ style = "night" })
vim.cmd.colorscheme("tokyonight")

-- 아이콘: Nerd Font 가 없으면 글자로
require("mini.icons").setup({ style = nerd and "glyph" or "ascii" })
MiniIcons.mock_nvim_web_devicons() -- web-devicons 를 찾는 플러그인도 mini.icons 를 쓰게

require("lualine").setup({
  options = {
    icons_enabled = nerd,
    component_separators = nerd and { left = "", right = "" } or "|",
    section_separators = nerd and { left = "", right = "" } or "",
    globalstatus = true,
  },
})

require("bufferline").setup({
  options = {
    show_buffer_icons = nerd,
    show_buffer_close_icons = false,
    separator_style = nerd and "slope" or "thin",
    offsets = {
      { filetype = "snacks_layout_box", text = "File Explorer", text_align = "center", separator = true },
    },
  },
})
map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "첫 버퍼" })
map("n", "<leader>0", "<cmd>BufferLineGoToBuffer -1<CR>", { desc = "마지막 버퍼" })
map("n", "<leader>z", "<cmd>BufferLineCyclePrev<CR>", { desc = "이전 버퍼" })
map("n", "<leader>x", "<cmd>BufferLineCycleNext<CR>", { desc = "다음 버퍼" })

-- 리더 키를 누르고 기다리면 이어지는 키를 보여 준다
local wk = require("which-key")
wk.setup({ icons = { mappings = nerd } })
wk.add({
  { "<leader>f", group = "찾기" },
  { "<leader>g", group = "git" },
  { "<leader>c", group = "코드" },
  { "<leader>b", group = "버퍼" },
  { "<leader>m", group = "마크다운" },
})
