return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        -- python
        "flake8",
        "black",
        "isort",
        "ruff",
        "basedpyright",
        -- terraform
        "tflint",
        "tfsec",
        "terraform-ls",
        -- nix
        "nil",
        "nixpkgs-fmt",
      },
    },
  },
  {
    "folke/ts-comments.nvim",
    opts = {
      lang = {
        terraform = "# %s",
      },
    },
  },
}
