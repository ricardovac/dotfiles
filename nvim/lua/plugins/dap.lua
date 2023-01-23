--[[
Implements 4 methods:
  get_current_method_name() - return a method name.
  get_current_class_name() - return a class name where the cursor is
  get_current_package_name() - return a package name of the current file
  get_current_full_class_name() - return a full class name (package + class name)
  get_current_full_method_name(delimiter) - return a full method name (package + class + [delimiter] + method name)
--]]
--
local status_util, util = pcall(require, "jdtls.util")
local status, dap = pcall(require, "dap")
local status_util, util = pcall(require, "jdtls.util")
if not status and status_util then
	return
end

local map = vim.keymap.set

dap.adapters.java = function(callback, config)
	util.execute_command({command = 'vscode.java.startDebugSession'}, function(err0, port)
		assert(not err0, vim.inspect(err0))

		callback({ type = 'server'; host = '127.0.0.1'; port = port; })
	end)
end

dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Java Attach";
    hostName = '127.0.0.1';
    port = 5005;
  },
}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🚫', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='DebugBreakpointLine', numhl=''})

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.9"),

  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = { 
    max_type_length = nil, -- Can be integer or nil.
  }
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local dap = require('dap')
local api = vim.api
local keymap_restore = {}

function attach_to_debug()
  local dap = require('dap')
  dap.configurations.java = {
    {
      type = 'java';
      request = 'attach';
      name = "Attach to the process";
      hostName = 'localhost';
      port = '5005';
    },
  }
  dap.continue()
end 


-- map("n", "<F4>", ":lua require'dap'.run({ type = 'java', request = 'attach', name = 'Debug (Attach) - Remote', hostName = '127.0.0.1', port = 5005 })<CR>", { noremap = true })

map('n', '<F4>', ':lua attach_to_debug()<CR>')

map("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true })
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { noremap = true })

map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true })
map("n", "<leader>dso", ":lua require'dap'.step_over()<CR>", { noremap = true })

map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true })
map("n", "<leader>dsi", ":lua require'dap'.step_into()<CR>", { noremap = true })

map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true })

map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })
map("n", "<leader>do", ":lua require'dap'.toggle()<CR>", { noremap = true })
map("n", "<leader>dx", ":lua require'dap'.terminate()<CR>", { noremap = true })
