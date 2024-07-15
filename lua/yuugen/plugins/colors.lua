return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",
			dim_inactive_windows = false,

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			}
		})
		vim.cmd([[
			colorscheme rose-pine 
		]])
	end,
}
