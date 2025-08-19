require("mcphub").setup({
  extensions = {
    copilotchat = {
      enabled = true,
      convert_tools_to_functions = true,
      convert_resources_to_functions = true,
      add_mcp_prefix = false,
    },
  }
})
