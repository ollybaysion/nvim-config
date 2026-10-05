-- nvim 0.12 설정 (2026-09-26 새로 씀; 옛 설정은 ~/arch/nvim-2024/config)
--
--   lua/config/options.lua   편집기 옵션
--   lua/config/keymaps.lua   플러그인과 무관한 키
--   lua/config/autocmds.lua  자동 명령
--   lua/plugins/init.lua     플러그인 목록 (vim.pack)
--   lua/plugins/*.lua        플러그인별 설정

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 터미널 글꼴이 Nerd Font 면 true 로 바꾼다 (아이콘 표시)
vim.g.have_nerd_font = false

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins")
require("plugins.ui")
require("plugins.editor")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.completion")
require("plugins.format")
require("plugins.markdown")
