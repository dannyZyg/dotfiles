---@type overseer.TemplateFileProvider
return {
  -- Cache based on CMakeLists.txt location for performance
  cache_key = function(opts)
    return vim.fs.find("CMakeLists.txt", {
      upward = true,
      type = "file",
      path = opts.dir,
    })[1]
  end,

  generator = function(opts, cb)
    -- 1. Check if cmake-tools is available
    local ok, cmake = pcall(require, "cmake-tools")
    if not ok then
      return "cmake-tools.nvim not installed"
    end

    -- 2. Check if CMakeLists.txt exists
    local cmake_file = vim.fs.find("CMakeLists.txt", {
      upward = true,
      type = "file",
      path = opts.dir,
    })[1]

    if not cmake_file then
      return "No CMakeLists.txt file found"
    end

    local cmake_dir = vim.fs.dirname(cmake_file)

    -- 3. Define all cmake-tools tasks
    -- Each task has: name, type (api or command), and execution details
    local task_definitions = {
      -- Standard cmake-tools API commands (with callbacks)
      {
        name = "CMake: Generate",
        desc = "Configure and generate build system",
        type = "api",
        api_function = "generate",
        api_args = { fargs = {} },
        has_callback = true,
      },
      {
        name = "CMake: Build",
        desc = "Build selected target",
        type = "api",
        api_function = "build",
        api_args = { fargs = {} },
        has_callback = true,
      },
      {
        name = "CMake: Build Current File",
        desc = "Build targets related to current file",
        type = "api",
        api_function = "build_current_file",
        api_args = { fargs = {} },
        has_callback = false,
      },
      {
        name = "CMake: Run",
        desc = "Run selected launch target",
        type = "api",
        api_function = "run",
        api_args = { fargs = {} },
        has_callback = true,
      },
      {
        name = "CMake: Run Current File",
        desc = "Run target for current file",
        type = "api",
        api_function = "run_current_file",
        api_args = { fargs = {} },
        has_callback = false,
      },
      {
        name = "CMake: Debug",
        desc = "Debug selected target with DAP",
        type = "api",
        api_function = "debug",
        api_args = { fargs = {} },
        has_callback = true,
      },
      {
        name = "CMake: Debug Current File",
        desc = "Debug target for current file",
        type = "api",
        api_function = "debug_current_file",
        api_args = { fargs = {} },
        has_callback = false,
      },
      {
        name = "CMake: Run Tests",
        desc = "Run CTest",
        type = "api",
        api_function = "run_test",
        api_args = { fargs = {} },
        has_callback = true,
      },
      {
        name = "CMake: Clean",
        desc = "Clean all targets",
        type = "api",
        api_function = "clean",
        api_args = nil, -- clean() doesn't take args
        has_callback = true,
      },
      {
        name = "CMake: Install",
        desc = "Install CMake targets",
        type = "api",
        api_function = "install",
        api_args = { fargs = {} },
        has_callback = true,
      },

      -- Custom commands (from autocommand.lua)
      {
        name = "CMake: Build and Install",
        desc = "Build project then install",
        type = "vim_command",
        vim_command = "CMakeBuildAndInstall",
      },
      {
        name = "CMake: Build, Install, and Recompile SuperCollider",
        desc = "Build, install, and recompile SC",
        type = "vim_command",
        vim_command = "CMakeBuildAndInstallAndRecompileSC",
      },
    }

    -- 4. Generate overseer task definitions
    local ret = {}
    for _, task_def in ipairs(task_definitions) do
      table.insert(ret, {
        name = task_def.name,
        desc = task_def.desc,
        builder = function()
          -- Build the component configuration based on task type
          local component_config = {
            "user.cmake_tools_command",
            command_type = task_def.type,
          }

          if task_def.type == "api" then
            component_config.api_function = task_def.api_function
            component_config.api_args = task_def.api_args
            component_config.has_callback = task_def.has_callback
          elseif task_def.type == "vim_command" then
            component_config.vim_command = task_def.vim_command
          end

          return {
            name = task_def.name,
            -- Dummy command (overseer requires cmd, but we don't use it)
            cmd = { "true" },
            cwd = cmake_dir,
            -- Use our custom component with immediate finalization
            -- Component finalizes itself as SUCCESS immediately after spawning cmake-tools task
            -- When the dummy command exits, task is already finalized -> no error
            components = {
              component_config,
            },
            -- Mark as ephemeral so overseer knows this is a temporary wrapper
            metadata = {
              ephemeral = true,
              wrapper_for_cmake_tools = true,
            },
          }
        end,
      })
    end

    -- 5. Return task list via callback
    cb(ret)
  end,
}
