-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Insert 模式按 Esc：先关闭 fcitx 中文输入法，再退出插入模式
vim.keymap.set("i", "<Esc>", function()
  if vim.fn.executable("fcitx-remote") == 1 then
    vim.fn.system("fcitx-remote -c")
  end
  return "<Esc>"
end, { expr = true, silent = true })

-- 进入命令行模式时，也关闭中文输入法，避免 :w / :q 被中文影响
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    if vim.fn.executable("fcitx-remote") == 1 then
      vim.fn.system("fcitx-remote -c")
    end
  end,
})
