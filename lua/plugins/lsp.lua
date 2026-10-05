-- LSP: 서버 설치는 mason, 서버별 기본 설정은 nvim-lspconfig 의 lsp/*.lua, 켜기는 mason-lspconfig
-- 0.11+ 기본 키: K 호버 · grn 이름 바꾸기 · gra 코드 액션 · grr 참조 · gri 구현 · grt 타입 정의 · gO 심볼 · [d ]d 진단
local map = vim.keymap.set

local servers = {
  "lua_ls", -- Lua (nvim 설정)
  "clangd", -- C/C++
  "jdtls", -- Java (fdc-agent-be)
  "vtsls", -- TypeScript (fdc-agent-fe)
  "eslint",
  "tailwindcss",
  "basedpyright", -- Python
  "ruff",
  "bashls",
  "jsonls",
  "yamlls",
  "marksman", -- Markdown
}

-- 포맷터 (LSP 가 아닌 도구 — conform 이 부른다)
local tools = { "stylua", "shfmt", "clang-format", "prettierd" }

require("mason").setup()
-- stylua 는 포맷터로만 쓴다 (conform) — LSP 로는 켜지 않는다
require("mason-lspconfig").setup({ ensure_installed = servers, automatic_enable = { exclude = { "stylua" } } })

local registry = require("mason-registry")
registry.refresh(function()
  for _, name in ipairs(tools) do
    local ok, pkg = pcall(registry.get_package, name)
    if ok and not pkg:is_installed() then pkg:install() end
  end
end)

-- jdtls 는 JDK 21 이상이 있어야 뜬다 (시스템 java 는 17)
-- 파일 감시: nvim 은 Linux 에서 didChangeWatchedFiles 를 안 알린다 → 에디터 밖에서 만들고 지운
-- 파일을 jdtls 가 모른다. 켜면 inotifywait(inotify-tools)로 감시한다.
vim.lsp.config("jdtls", {
  cmd_env = { JAVA_HOME = vim.fn.expand("~/tools/jdk-21.0.11+10") },
  capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } },
})

-- tailwind 는 화면 코드에서만 (기본값은 마크다운 등에도 붙는다)
vim.lsp.config("tailwindcss", {
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
})

-- nvim 설정을 고칠 때 `vim` 전역을 알게
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
    },
  },
})

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { current_line = true }, -- 커서가 있는 줄의 진단만 글로
  float = { source = "if_many" },
  signs = { text = { "E", "W", "I", "H" } },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp", { clear = true }),
  callback = function(ev)
    local o = function(desc) return { buffer = ev.buf, desc = desc } end
    map("n", "gd", function() Snacks.picker.lsp_definitions() end, o("정의로"))
    map("n", "gD", vim.lsp.buf.declaration, o("선언으로"))
    map("n", "<leader>ca", vim.lsp.buf.code_action, o("코드 액션"))
    map("n", "<leader>cr", vim.lsp.buf.rename, o("이름 바꾸기"))
    map("n", "<leader>ci", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, o("인레이 힌트 켜고 끄기"))
  end,
})
