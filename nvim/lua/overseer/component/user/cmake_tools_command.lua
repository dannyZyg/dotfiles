local constants = require("overseer.constants")
local STATUS = constants.STATUS

---@type overseer.ComponentFileDefinition
return {
  desc = "Execute cmake-tools command via Lua API or Vim command",

  -- Component parameters
  params = {
    command_type = {
      desc = "Type of command to execute",
      type = "enum",
      choices = { "api", "vim_command", "lua_function" },
    },
    api_function = {
      desc = "cmake-tools API function name (e.g., 'build', 'run')",
      type = "string",
      optional = true,
    },
    api_args = {
      desc = "Arguments to pass to the API function",
      type = "opaque",
      optional = true,
    },
    has_callback = {
      desc = "Whether the API function accepts a callback",
      type = "boolean",
      default = false,
    },
    vim_command = {
      desc = "Vim command string to execute (e.g., 'CMakeBuild')",
      type = "string",
      optional = true,
    },
    lua_function = {
      desc = "Global Lua function name to execute (e.g., '_G.my_function')",
      type = "string",
      optional = true,
    },
  },

  constructor = function(params)
    return {
      on_start = function(self, task)
        -- Explicitly capture task reference for closures
        local my_task = task

        -- Validate parameters
        if params.command_type == "api" then
          if not params.api_function then
            my_task:set_status("FAILURE")
            my_task:set_result({ error = "api_function is required for api command type" })
            return
          end
        elseif params.command_type == "vim_command" then
          if not params.vim_command then
            my_task:set_status("FAILURE")
            my_task:set_result({ error = "vim_command is required for vim_command command type" })
            return
          end
        elseif params.command_type == "lua_function" then
          if not params.lua_function then
            my_task:set_status("FAILURE")
            my_task:set_result({ error = "lua_function is required for lua_function command type" })
            return
          end
        else
          my_task:set_status("FAILURE")
          my_task:set_result({ error = "Invalid command_type: " .. tostring(params.command_type) })
          return
        end

        -- Execute based on command type
        if params.command_type == "api" then
          -- API-based execution (cmake-tools Lua API)
          local ok, cmake = pcall(require, "cmake-tools")
          if not ok then
            my_task:set_status("FAILURE")
            my_task:set_result({ error = "cmake-tools.nvim not loaded" })
            return
          end

          -- Get the API function
          local func = cmake[params.api_function]
          if not func or type(func) ~= "function" then
            my_task:set_status("FAILURE")
            my_task:set_result({ error = "Unknown cmake-tools function: " .. params.api_function })
            return
          end

          -- Execute the function and finalize wrapper immediately
          if params.has_callback then
            -- Function accepts a callback (e.g., build, run, generate)
            func(params.api_args or { fargs = {} }, function(result)
              -- cmake-tools task has been spawned, do nothing
              -- Wrapper will finalize itself immediately (see below)
            end)
          else
            -- Function doesn't accept callback (e.g., build_current_file, run_current_file)
            func(params.api_args or { fargs = {} })
          end

          -- Finalize wrapper task as SUCCESS immediately after spawning cmake-tools task
          -- This prevents "Task did not finalize during exit" error when dummy command completes
          -- The task will auto-dispose via on_complete_dispose component
          vim.schedule(function()
            if my_task and my_task:is_running() then
              my_task:finalize(STATUS.SUCCESS)
            end
          end)

        elseif params.command_type == "vim_command" then
          -- Vim command execution (for custom commands)
          local ok, err = pcall(vim.cmd, params.vim_command)

          if not ok then
            my_task:set_status("FAILURE")
            my_task:set_result({ error = "Command failed: " .. tostring(err) })
            return
          end

          -- Finalize wrapper task as SUCCESS immediately after executing vim command
          -- Custom commands (like CMakeBuildAndInstall) spawn their own tasks
          -- The wrapper will auto-dispose via on_complete_dispose component
          vim.schedule(function()
            if my_task and my_task:is_running() then
              my_task:finalize(STATUS.SUCCESS)
            end
          end)

        elseif params.command_type == "lua_function" then
          -- Lua function execution
          local func_path = params.lua_function
          
          -- Parse the function path (e.g., "_G.my_function" or "module.function")
          local ok_load, func = pcall(function()
            return loadstring("return " .. func_path)()
          end)
          
          if not ok_load or not func or type(func) ~= "function" then
            my_task:set_status("FAILURE")
            my_task:set_result({ error = "Function not found: " .. func_path })
            return
          end
          
          -- Execute the function
          local ok_exec, err = pcall(func)
          
          if not ok_exec then
            my_task:set_status("FAILURE")
            my_task:set_result({ error = "Function failed: " .. tostring(err) })
            return
          end
          
          -- Finalize wrapper task as SUCCESS immediately
          vim.schedule(function()
            if my_task and my_task:is_running() then
              my_task:finalize(STATUS.SUCCESS)
            end
          end)
        end
      end,

      on_dispose = function(self, task)
        -- Cleanup if needed (currently no cleanup required)
      end,
    }
  end,
}
