local group = vim.api.nvim_create_augroup("user", { clear = true })

-- 복사한 범위를 잠깐 강조
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function() vim.hl.on_yank() end,
})

-- 파일을 다시 열면 마지막 커서 위치로
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local lines = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= lines then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- 창 크기가 바뀌면 나눈 창들을 고르게
vim.api.nvim_create_autocmd("VimResized", {
  group = group,
  command = "wincmd =",
})
