-- 구문 트리: 색칠 · 접기 · 들여쓰기
-- 파서는 tree-sitter CLI(~/.local/bin, 이 기계 glibc 에 맞춰 cargo 로 빌드)로 컴파일된다
local parsers = {
  "bash", "c", "cpp", "css", "diff", "dockerfile", "gitcommit", "groovy", "html",
  "java", "javascript", "json", "lua", "markdown", "markdown_inline", "python",
  "query", "regex", "sql", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
}

local ts = require("nvim-treesitter")
ts.install(parsers) -- 이미 있으면 건너뛴다 (비동기)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang or not vim.treesitter.language.add(lang) then return end
    vim.treesitter.start(ev.buf, lang)
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
