-- Collection of Quality-of-Life (QoL) plugins for Neovim
return {
	"snacks.nvim",
	lazy = false,
	keys = {
		-- Toggle indentation guides
		{
			"<leader>ti",
			mode = "n",
			desc = "Toggle indentation guides",
			function()
				local indent = require("snacks").indent
				if indent.enabled then
					indent.disable()
					vim.notify("Disabled indent guides", vim.log.levels.INFO)
				else
					indent.enable()
					vim.notify("Enabled indent guides", vim.log.levels.INFO)
				end
			end,
		},

		-- Toggle file explorer
		{
			"<leader>e",
			mode = "n",
			desc = "Toggle filetree explorer",
			function()
				require("snacks").explorer()
			end,
		},

		-- Find projects/files
		{
			"<leader>fp",
			mode = "n",
			desc = "Find projects",
			function()
				require("snacks").picker.projects()
			end,
		},
		{
			"<leader>ff",
			mode = "n",
			desc = "Find files",
			function()
				require("snacks").picker.files()
			end,
		},

		-- Open LazyGit - Awesome TUI for Git
		{
			"<leader>gg",
			mode = "n",
			desc = "Toggle LazyGit TUI",
			function()
				require("snacks").lazygit()
			end,
		},

		-- LSP
		{
			"gd",
			desc = "Goto Definition",
			function()
				Snacks.picker.lsp_definitions()
			end,
		},
		{
			"gD",
			desc = "Goto Declaration",
			function()
				Snacks.picker.lsp_declarations()
			end,
		},
		{
			"gr",
			desc = "References",
			nowait = true,
			function()
				Snacks.picker.lsp_references()
			end,
		},
		{
			"gI",
			desc = "Goto implementation",
			function()
				Snacks.picker.lsp_implementations()
			end,
		},
		{
			"gy",
			desc = "Goto type definition",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
		},
		{
			"<leader>ss",
			desc = "LSP Symbols",
			function()
				Snacks.picker.lsp_symbols()
			end,
		},
		{
			"<leader>sS",
			desc = "LSP workspace symbols",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
		},

		-- Miscallaneous
		{
			"<leader>uC",
			desc = "Colorschemes",
			function()
				Snacks.picker.colorschemes()
			end,
		},
	},
	after = function()
		require("snacks").setup {
			explorer = { enabled = true }, -- File explorer
			picker = { enabled = true, focus = "list" }, -- Fuzzy finder
			indent = { enabled = true }, -- Indentation guides
			notifier = { enabled = true }, -- Pretty `vim.notify`
			quickfile = { enabled = true }, -- Render file as quickly as possible before loading any plugins when `nvim <some_file>` command run
			image = { enabled = true }, -- Image viewer - Can display many images and math expressions as well

			-- Handles files larger than configured size - Prevents stuff e.g. LSP from attaching to it's buffer
			bigfile = {
				enabled = true,
				notify = true,
				size = 52428800, -- 50 megabytes
			},
		}
	end,
},
