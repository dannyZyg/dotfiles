return {
  "Civitasv/cmake-tools.nvim",
  enabled = true,
  opts = function()
    return {
      cmake_command = "cmake",                                          -- this is used to specify cmake command path
      ctest_command = "ctest",                                          -- this is used to specify ctest command path
      cmake_use_preset = true,
      cmake_regenerate_on_save = true,                                  -- auto generate when save CMakeLists.txt
      cmake_generate_options = {                                        -- this will be passed when invoke `CMakeGenerate`
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
        "-G",
        "Ninja"
      },
      cmake_build_options = {},                                         -- this will be passed when invoke `CMakeBuild`
      cmake_build_directory = "build",            -- single dir; switching build types reconfigures in-place
      cmake_soft_link_compile_commands = true,   -- this will automatically make a soft link from compile commands file to project root dir
      cmake_compile_commands_from_lsp = false,   -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
      cmake_kits_path = nil,                     -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
      cmake_variants_message = {
        short = { show = true },                 -- whether to show short message
        long = { show = true, max_length = 40 }, -- whether to show long message
      },
      cmake_dap_configuration = {
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
      },
      cmake_executor = {
        name = "overseer",
        opts = {},
        default_opts = {
          overseer = {
            new_task_opts = {
              strategy = "jobstart",
            },
            on_new_task = function(task)
              require("overseer").open(
                { enter = false, direction = "bottom" }
              )
            end,
          },
        },
      },
      cmake_runner = {
        name = "overseer",
        opts = {},
        default_opts = {
          overseer = {
            new_task_opts = {
              strategy = "jobstart",
            },
            on_new_task = function(task)
              require("overseer").open(
                { enter = false, direction = "bottom" }
              )
            end,
          },
        },
      },
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        refresh_rate_ms = 100,
      },
      cmake_virtual_text_support = true,
    }
  end,
}
