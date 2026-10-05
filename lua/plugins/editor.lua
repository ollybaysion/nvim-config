-- 편집 도구: 찾기 · 파일 트리 · git · 괄호
local map = vim.keymap.set

-- snacks: 찾기(picker) · 파일 트리(explorer) · 들여쓰기 선 · 알림 · 큰 파일 보호
require("snacks").setup({
  bigfile = { enabled = true },
  explorer = { enabled = true, replace_netrw = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = { enabled = true },
  quickfile = { enabled = true },
  words = { enabled = true }, -- 커서 아래 단어의 다른 위치 강조, ]] [[ 로 이동
})

-- 찾기 (옛 telescope 키 그대로)
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "파일" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "내용 (grep)" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "버퍼" })
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "도움말" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "최근 파일" })
map("n", "<leader>fw", function() Snacks.picker.grep_word() end, { desc = "커서 단어 grep" })
map("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "키 매핑" })
map("n", "<leader>fd", function() Snacks.picker.diagnostics() end, { desc = "진단" })
map("n", "<leader>fs", function() Snacks.picker.lsp_symbols() end, { desc = "심볼 (파일)" })
map("n", "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "심볼 (프로젝트)" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "nvim 설정 파일" })
map("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "똑똑한 파일 찾기" })
map("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "내용 (grep)" })
map("n", "<leader>fR", function() Snacks.picker.resume() end, { desc = "마지막 찾기 다시" })

-- 파일 트리 (옛 nvim-tree 키 그대로)
map("n", "<leader><Tab>", function() Snacks.explorer() end, { desc = "파일 트리" })

-- 버퍼 닫기 (창 배치는 유지)
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "버퍼 닫기" })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "다른 버퍼 모두 닫기" })

-- git
require("gitsigns").setup({
  on_attach = function(buf)
    local gs = require("gitsigns")
    local o = function(desc) return { buffer = buf, desc = desc } end
    map("n", "]c", function() gs.nav_hunk("next") end, o("다음 변경"))
    map("n", "[c", function() gs.nav_hunk("prev") end, o("이전 변경"))
    map("n", "<leader>gp", gs.preview_hunk, o("변경 미리보기"))
    map("n", "<leader>gr", gs.reset_hunk, o("변경 되돌리기"))
    map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, o("이 줄 blame"))
  end,
})
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "git status" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "git log" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "이 파일 git log" })

-- 괄호·따옴표 자동 짝, 감싸기(sa/sd/sr), 텍스트 객체 확장
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.ai").setup()
