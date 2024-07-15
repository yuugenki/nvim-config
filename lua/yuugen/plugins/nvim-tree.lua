return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "antosha417/nvim-lsp-file-operations" },
	enabled = true,
	config = function()
		require("lsp-file-operations").setup()

		-- recommended settings from nvim-tree docs
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

		local function natural_cmp(left, right)
			-- prioritize directories over files
			if left.type ~= "directory" and right.type == "directory" then
				return false
			elseif left.type == "directory" and right.type ~= "directory" then
				return true
			end

			left = left.name:lower()
			right = right.name:lower()

			if left == right then
				return false
			end

			for i = 1, math.max(string.len(left), string.len(right)), 1 do
				local l = string.sub(left, i, -1)
				local r = string.sub(right, i, -1)

				if
					type(tonumber(string.sub(l, 1, 1))) == "number"
					and type(tonumber(string.sub(r, 1, 1))) == "number"
				then
					local l_number = tonumber(string.match(l, "^[0-9]+"))
					local r_number = tonumber(string.match(r, "^[0-9]+"))

					if l_number ~= r_number then
						return l_number < r_number
					end
				elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
					return l < r
				end
			end
		end

		require("nvim-tree").setup({
			sort = {
				sorter = function(nodes)
					table.sort(nodes, natural_cmp)
				end,
			},
			view = {
				width = 25,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
					-- show = {
					--    file = false,
					--    folder = false,
					--    folder_arrow = true,
					--    git = false,
					--    modified = false,
					--    diagnostics = false,
					--    bookmarks = false,
					-- },
				},
			},

			-- disable window_picker for explorer to work well with window split
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				enable = false,
				ignore = true,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "󰠠",
					info = "",
					warning = "",
					error = "✖",
				},
			},
		})

		vim.keymap.set("n", "<Leader>ee", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		vim.keymap.set(
			"n",
			"<Leader>ef",
			"<Cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		)
		vim.keymap.set("n", "<Leader>ec", "<Cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		vim.keymap.set("n", "<Leader>er", "<Cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}
