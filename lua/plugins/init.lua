-- 플러그인 목록 — 내장 관리자 vim.pack (nvim 0.12). 잠금 파일: ~/.config/nvim/nvim-pack-lock.json
-- 업데이트: :lua vim.pack.update()  → 확인 창에서 :w 로 적용, :q 로 취소

local gh = function(repo) return "https://github.com/" .. repo end
local v = vim.version.range

-- 설치·업데이트 직후 할 일 (vim.pack.add 보다 먼저 등록해야 설치 때도 돈다)
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  -- 모양
  { src = gh("folke/tokyonight.nvim"), version = v("4") },
  gh("nvim-mini/mini.nvim"), -- icons · pairs · surround · ai
  gh("nvim-lualine/lualine.nvim"),
  { src = gh("akinsho/bufferline.nvim"), version = v("4") },
  -- 찾기 · 파일 트리 · 알림 · 들여쓰기 선
  { src = gh("folke/snacks.nvim"), version = v("2") },
  { src = gh("folke/which-key.nvim"), version = v("3") },
  -- git
  { src = gh("lewis6991/gitsigns.nvim"), version = v("2") },
  -- 구문 트리
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  -- LSP · 자동완성 · 포맷
  gh("neovim/nvim-lspconfig"),
  { src = gh("mason-org/mason.nvim"), version = v("2") },
  { src = gh("mason-org/mason-lspconfig.nvim"), version = v("2") },
  { src = gh("saghen/blink.cmp"), version = v("1") },
  gh("rafamadriz/friendly-snippets"),
  { src = gh("stevearc/conform.nvim"), version = v("9") },
  -- 마크다운
  { src = gh("MeanderingProgrammer/render-markdown.nvim"), version = v("8") },
}, { confirm = false })
