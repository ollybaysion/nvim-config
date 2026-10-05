-- 마크다운을 편집 화면에서 렌더 (제목·표·체크박스)
require("render-markdown").setup({})
vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", { desc = "마크다운 렌더 켜고 끄기" })
