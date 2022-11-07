print("colorscheme")
local colors = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colors)
if not status_ok then
    print("colorscheme not ok")
    return
end
