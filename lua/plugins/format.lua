-- 저장할 때 자동 포맷 — 팀 저장소를 통째로 바꾸지 않게, 포맷 설정이 있는 언어·프로젝트만
--   Java · TypeScript 는 저장소에 포맷터 설정이 없어서 자동 포맷 안 함. 필요하면 <leader>cf 로 직접.
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "ruff_format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascriptreact = { "prettierd" },
    json = { "prettierd" },
    css = { "prettierd" },
    yaml = { "prettierd" },
  },
  formatters = {
    -- 프로젝트에 prettier 설정 파일이 있을 때만
    prettierd = { require_cwd = true },
  },
  format_on_save = { timeout_ms = 1000, lsp_format = "never" },
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "포맷" })
