require('packer').startup(function ()
	use 'wbthomason/packer.nvim'

	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'inkarkat/vim-ReplaceWithRegister'

	use 'easymotion/vim-easymotion'

	use 'psliwka/vim-smoothie'

	use 'preservim/nerdtree'

	use 'navarasu/onedark.nvim'

	-- IDE
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}

 	use 'neovim/nvim-lspconfig'
 	use 'williamboman/nvim-lsp-installer'
end)

-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND
