local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dappython_status_ok, dap_python = pcall(require, "dap-python")
if not dappython_status_ok then
	return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	return
end

--[[ dap_python.setup(os.getenv("VIRTUAL_ENV") .. "/debugpy/bin/python") ]]
dap_python.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
