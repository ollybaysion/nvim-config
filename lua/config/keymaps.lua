local map = vim.keymap.set

-- 창 이동
map("n", "<C-h>", "<C-w>h", { desc = "왼쪽 창" })
map("n", "<C-j>", "<C-w>j", { desc = "아래 창" })
map("n", "<C-k>", "<C-w>k", { desc = "위 창" })
map("n", "<C-l>", "<C-w>l", { desc = "오른쪽 창" })

-- 찾기 강조 끄기
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "찾기 강조 끄기" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- 선택한 줄 위아래로 옮기기
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "선택 줄 아래로" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "선택 줄 위로" })

-- 들여쓰기 후에도 선택 유지
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 진단 (다음/이전 이동 ]d [d 는 기본 키)
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "진단 내용 보기" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "진단 목록" })

-- 터미널 모드에서 빠져나오기
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "터미널 모드 나가기" })
