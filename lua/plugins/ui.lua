return {
	-- Fast and easy to use/configure statusline
	{
		"lualine.nvim",
		after = function()
			require("lualine").setup {}
		end,
	},

	-- Extensible UI for notifications and LSP progress messages
	{
		"fidget.nvim",
		after = function()
			require("fidget").setup {}
		end,
	},

	-- Library of 40+ independent Lua modules improving Neovim experience with minimal effort
	{
		"mini.nvim",
		after = function()
			require("mini.git").setup() -- Git integration

			-- Autopairs
			require("mini.pairs").setup {
				-- Modes in which mappings from this config are created
				modes = { insert = true, command = true, terminal = true },

				-- Extra characters to autopair
				mappings = {
					["<"] = { action = "open", pair = "<>" },
					[">"] = { action = "close", pair = "<>" },
				},
			}
		end,
	},

	-- Collection of Quality-of-Life (QoL) plugins for Neovim
	{
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
				desc = "Goto Implementation",
				function()
					Snacks.picker.lsp_implementations()
				end,
			},
			{
				"gy",
				desc = "Goto T[y]pe Definition",
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
				desc = "LSP Workspace Symbols",
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

				-- Handles files larger than configured size - Automatically prevents stuff e.g. LSP from attaching to the buffer
				bigfile = {
					enabled = true,
					notify = true,
					size = 52428800, -- 50 megabytes
				},
			}
		end,
	},
}
