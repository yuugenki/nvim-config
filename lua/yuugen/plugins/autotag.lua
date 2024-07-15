return {
	"windwp/nvim-ts-autotag",
	config = function()
		local configs = require("nvim-ts-autotag")

		configs.setup({
			opts = {
				enable_close_on_slash = true,
			},
		})
	end,
}
