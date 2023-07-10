local buf_ok, buf = pcall(require, 'bufferline')
if not buf_ok then
  return
end

-- buf.setup()
local status, bufferline = pcall(require, "bufferline")
if not status then
  print("bufferline not installed")
  return
end

bufferline.setup({
  options = {
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    enforce_regular_tabs = true,
    offsets = {
      {
        filetype = "NvimTree",
      },
    },
    indicator = {
      style = "none",
    },
    modified_icon = "",
  },
})
