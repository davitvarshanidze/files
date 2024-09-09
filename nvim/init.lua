vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
vim.opt.scrolloff = 2
vim.opt.wrap = true
vim.opt.signcolumn = 'no'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.opt.tabstop = 8
vim.opt.expandtab = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.vb = true
vim.opt.diffopt:append('iwhite')
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'
vim.opt.clipboard = "unnamedplus"

vim.keymap.set('', '<C-p>', '<cmd>Files<cr>')
vim.keymap.set('n', '<leader>;', '<cmd>Buffers<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '<C-j>', '<Esc>')
vim.keymap.set('i', '<C-j>', '<Esc>')
vim.keymap.set('v', '<C-j>', '<Esc>')
vim.keymap.set('s', '<C-j>', '<Esc>')
vim.keymap.set('x', '<C-j>', '<Esc>')
vim.keymap.set('c', '<C-j>', '<Esc>')
vim.keymap.set('o', '<C-j>', '<Esc>')
vim.keymap.set('l', '<C-j>', '<Esc>')
vim.keymap.set('t', '<C-j>', '<Esc>')
vim.keymap.set('n', '<C-k>', '<Esc>')
vim.keymap.set('i', '<C-k>', '<Esc>')
vim.keymap.set('v', '<C-k>', '<Esc>')
vim.keymap.set('s', '<C-k>', '<Esc>')
vim.keymap.set('x', '<C-k>', '<Esc>')
vim.keymap.set('c', '<C-k>', '<Esc>')
vim.keymap.set('o', '<C-k>', '<Esc>')
vim.keymap.set('l', '<C-k>', '<Esc>')
vim.keymap.set('t', '<C-k>', '<Esc>')
vim.keymap.set('v', '<C-h>', '<cmd>nohlsearch<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>nohlsearch<cr>')
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
vim.keymap.set('n', '<leader>p', '<cmd>read !wl-paste<cr>')
vim.keymap.set('n', '<leader>c', '<cmd>w !wl-copy<cr><cr>')
vim.keymap.set('n', '<leader><leader>', '<c-^>')
vim.keymap.set('n', '<leader>,', ':set invlist<cr>')
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')
vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('n', '<left>', ':bp<cr>')
vim.keymap.set('n', '<right>', ':bn<cr>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<leader>m', 'ct_')
vim.keymap.set('', '<F1>', '<Esc>')
vim.keymap.set('i', '<F1>', '<Esc>')

vim.api.nvim_create_autocmd(
	'TextYankPost',
	{
		pattern = '*',
		command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
	}
)
vim.api.nvim_create_autocmd(
	'BufReadPost',
	{
		pattern = '*',
		callback = function(ev)
			if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				if not vim.fn.expand('%:p'):find('.git', 1, true) then
					vim.cmd('exe "normal! g\'\\""')
				end
			end
		end
	}
)

vim.api.nvim_create_autocmd('BufRead', { pattern = '*.orig', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.pacnew', command = 'set readonly' })
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })

local email = vim.api.nvim_create_augroup('email', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = '/tmp/mutt*',
	group = email,
	command = 'setfiletype mail',
})

vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'mail',
  group = email,
  command = 'setlocal formatoptions+=w',
})

local text = vim.api.nvim_create_augroup('text', { clear = true })
for _, pat in ipairs({'text', 'markdown', 'mail', 'gitcommit'}) do
	vim.api.nvim_create_autocmd('Filetype', {
		pattern = pat,
		group = text,
		command = 'setlocal spell tw=72 colorcolumn=73',
	})
end

vim.api.nvim_create_autocmd('Filetype', {
	pattern = 'tex',
	group = text,
	command = 'setlocal spell tw=80 colorcolumn=81',
})

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		"wincent/base16-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme base16-darkmoss]])
			vim.o.background = 'dark'
			local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
			vim.api.nvim_set_hl(0, 'Comment', bools)
			local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
			vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true })
		end
	},
	{
		'itchyny/lightline.vim',
		lazy = false,
		config = function()
			vim.o.showmode = false
			vim.g.lightline = {
				colorscheme = 'one',
				active = {
					left = {
						{ 'mode', 'paste' },
						{ 'readonly', 'filename', 'modified' }
					},
					right = {
						{ 'lineinfo' },
						{ 'percent' },
						{ 'fileencoding', 'filetype' }
					},
				},
				component_function = {
					filename = 'LightlineFilename'
				},
			}
			function LightlineFilenameInLua(opts)
				if vim.fn.expand('%:t') == '' then
					return '[No Name]'
				else
					return vim.fn.getreg('%')
				end
			end
			vim.api.nvim_exec(
				[[
				function! g:LightlineFilename()
					return v:lua.LightlineFilenameInLua()
				endfunction
				]],
				true
			)
		end
	},
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').create_default_mappings()
		end
	},
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	},
	{
		'notjedi/nvim-rooter.lua',
		config = function()
			require('nvim-rooter').setup()
		end
	},
	{
		'junegunn/fzf.vim',
		    dependencies = {
		        { 'junegunn/fzf', build = './install --bin' },
		    },
		    config = function()
		        vim.g.fzf_layout = { down = '~20%' }
		        function list_cmd()
		            local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
		            if base == '.' then
		                return 'fd --type file --follow'
		            else
		                return vim.fn.printf('fd --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand('%')))
		            end
		        end
		        vim.api.nvim_create_user_command('Files', function(arg)
		            vim.fn['fzf#vim#files'](arg.qargs, { source = list_cmd(), options = '--tiebreak=index' }, arg.bang)
		        end, { bang = true, nargs = '?', complete = "dir" })
		    end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')

			lspconfig.rust_analyzer.setup {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						imports = {
							group = {
								enable = false,
							},
						},
						completion = {
							postfix = {
								enable = false,
							},
						},
					},
				},
			}

			local configs = require 'lspconfig.configs'
			if not configs.bash_lsp and vim.fn.executable('bash-language-server') == 1 then
				configs.bash_lsp = {
					default_config = {
						cmd = { 'bash-language-server', 'start' },
						filetypes = { 'sh' },
						root_dir = require('lspconfig').util.find_git_ancestor,
						init_options = {
							settings = {
								args = {}
							}
						}
					}
				}
			end
			if configs.bash_lsp then
				lspconfig.bash_lsp.setup {}
			end

			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<leader>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'path' },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				})
			})
		end
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require "lsp_signature".setup({
				doc_lines = 0,
				handler_opts = {
					border = "none"
				},
			})
		end
	},
	{
		'hashivim/vim-terraform',
		ft = { "terraform" },
	},
	{
		'evanleck/vim-svelte',
		ft = { "svelte" },
	},
	'cespare/vim-toml',
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		'rust-lang/rust.vim',
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			vim.g.rust_clip_command = 'wl-copy'
		end
	},
	'khaveesh/vim-fish-syntax',
	{
		'plasticboy/vim-markdown',
		ft = { "markdown" },
		dependencies = {
			'godlygeek/tabular',
		},
		config = function()
			vim.g.vim_markdown_folding_disabled = 1
			vim.g.vim_markdown_frontmatter = 1
			vim.g.vim_markdown_new_list_item_indent = 0
			vim.g.vim_markdown_auto_insert_bullets = 0
		end
	},
        {
                "ray-x/lsp_signature.nvim",
		event = "VeryLazy",
	        opts = {},
         	config = function(_, opts)
                require "lsp_signature".setup({
                doc_lines = 0,
                handler_opts = { border = "none" },
        })
                end,
        },
        {
		'windwp/nvim-autopairs',
		config = function()
	        require('nvim-autopairs').setup {}
	        end
        },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            
            lspconfig.clangd.setup {
                on_attach = function(client, bufnr)
                    local opts = { noremap=true, silent=true }
                    local buf_set_keymap = vim.api.nvim_buf_set_keymap
                    buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                    buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                    buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                end,
                flags = {
                    debounce_text_changes = 150,
                }
            }
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "rust_analyzer", "bashls" },
            })
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers {
                function (server_name)
                    lspconfig[server_name].setup {}
                end,
            }
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                }, {
                    { name = 'buffer' },
                    { name = 'path' },
                }),
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require "lsp_signature".setup({
                doc_lines = 0,
                handler_opts = { border = "none" },
            })
        end,
    },
    {
        'windwp/nvim-autopairs',
        config = function()
        require('nvim-autopairs').setup {}
        end
    },
	})
