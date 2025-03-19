-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.colorscheme.kanagawa-nvim" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.nix" },
	{ import = "astrocommunity.pack.python-ruff" },
	{ import = "astrocommunity.pack.terraform" },

	{ import = "astrocommunity.search.nvim-spectre" },
	-- { import = "astrocommunity.pack.markdown" },

	-- { import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.motion.mini-surround" },
	{ import = "astrocommunity.motion.flash-nvim" },
	-- import/override with your plugins folder
}
