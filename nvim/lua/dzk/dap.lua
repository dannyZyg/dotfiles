local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dappython_status_ok, dap_python = pcall(require, "dap-python")
if not dappython_status_ok then
	vim.notify("Error: Failed to load dap-python", vim.log.levels.ERROR)
	return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	vim.notify("Error: Failed to load dapui", vim.log.levels.ERROR)
	return
end

dapui.setup()
dap_python.setup("python")

vim.keymap.set("n", "<leader>db", dapui.toggle)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

-- Eval var under cursor
vim.keymap.set("n", "<space>?", function()
	dapui.eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F13>", dap.restart)

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
