local opt = vim.opt

-- 들여쓰기
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- 찾기
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split" -- :s 치환 결과를 미리 보여 준다

-- 화면
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.winborder = "rounded" -- 떠 있는 창(호버·진단)에 테두리
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.showmode = false -- 모드는 상태줄이 보여 준다
opt.laststatus = 3 -- 상태줄은 화면 아래 하나만

-- 창 나누기는 오른쪽·아래로
opt.splitright = true
opt.splitbelow = true

-- 접기: 파일을 열 때는 모두 펼친 상태 (접기 기준은 autocmds 에서 treesitter 로)
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldtext = ""

-- 기타
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- y/p 가 시스템 클립보드와 공유
opt.undofile = true -- 파일을 닫았다 열어도 되돌리기 기록 유지
opt.confirm = true -- 저장 안 한 채로 :q 하면 물어본다
opt.updatetime = 250
opt.timeoutlen = 400
