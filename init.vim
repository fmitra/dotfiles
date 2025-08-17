call plug#begin()
Plug 'nvim-tree/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'qpkorr/vim-bufkill'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'phha/zenburn.nvim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ojroques/vim-oscyank'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'folke/trouble.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'folke/lazydev.nvim'
Plug 'leoluz/nvim-dap-go'
" Common dependency across multiple plugins
Plug 'nvim-lua/plenary.nvim'

" =====================
" Code Companion Start
" =====================
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'olimorris/codecompanion.nvim'

" =====================
" Copilot
" =====================
"Plug 'github/copilot.vim'
"Plug 'CopilotC-Nvim/CopilotChat.nvim'

call plug#end()

" =====================
" Behavior
" =====================
" Delete text without overwriting your register
" D to delete a whole line
" X to delete a single character or selection
nnoremap <silent> D "_dd
nnoremap <silent> X "_x
vnoremap <silent> X "_x

" Copy and paste support in unix env
set clipboard+=unnamed,unnamedplus
set iskeyword-=_

" Copy yanked text from register to clipboard
command! Y call OSCYank(getreg('+'))

" Quick resize panes with leader `\` + command
" resize current buffer by +/- 10
" resize horizontal
nnoremap <Leader>[ :vertical resize -10<cr>
nnoremap <Leader>] :vertical resize +10<cr>
" resize veritical
nnoremap <Leader>- :resize -10<cr>
nnoremap <Leader>= :resize +10<cr>

" Hack to get custom path from lua function to execute with \y
noremap <Leader>y :FileLineNum<CR>
noremap <Leader>m :Path<CR>

" Buffer swapping
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>
map <C-c> :BD<CR>

" =====================
" FZF and Ag
" =====================
" :Rag allows passing a directory to :Ag
" And enables a preview window located above the search reuslts
" that is toggled on and off with `?`
"
" Usage: :Rag foo path/
map <C-p> :FZF<CR>
map <C-f> :Ag<CR>
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:50%:hidden', '?'), <bang>0)
" Ag search (silver searcher plugin)
let g:ackprg = 'ag --nogroup --nocolor --column'

" =====================
" UX / UI
" =====================
" Code folding
set foldmethod=syntax
set foldlevelstart=20

" Status bar
let g:airline#extensions#tabline#enabled = 1

" Flag trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
map <C-w> :SyntasticCheck<CR>
map <C-e> :SyntasticReset<CR>
let g:syntastic_mode_map = {"mode": "passive"}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_js_checkers = ['eslint']

" Syntax settings
filetype plugin indent on
syntax on
set encoding=utf-8
colorscheme zenburn
set t_Co=256
set nu
colorscheme zenburn
set cursorline

set expandtab
set showmatch
set hlsearch
set ignorecase

:highlight CursorLine ctermbg=16
:highlight Visual ctermbg=16

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" Open current file in Nerd tree \v
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=55
let NERDTreeShowHidden=1

" https://github.com/preservim/nerdtree
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" File tab defaults
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4 smarttab autoindent noexpandtab
autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.ts setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.hbs setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.esj setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.styl setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
autocmd BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent

" =====================
" Lua Configs Start
" =====================
lua << EOF
local opts = { noremap=true, silent=true, buffer=bufnr }

-- Output errors to one-of quickfix or location list (uncomment whichever you need)
-- Output errors to location list
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- Output errors to quickfix list
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)

-- Fidget spinner for processing UX
require("fidget").setup {}
-- Access LSP diagnostics with `:Trouble`
require("trouble").setup {}
require('telescope').setup {}
-- Install font nerd to resolve missing icons
-- Ref: https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki/Fonts#font-nerd
require('render-markdown').setup()

-- =====================
-- Custom Commands
-- =====================
-- Copy file path and line number with `:FileLineNum`
vim.api.nvim_create_user_command("FileLineNum", function()
  local path = vim.fn.expand("%")
  local line = vim.fn.line(".")
  local out = path .. ":" .. line
  vim.fn.setreg("+", out)
  vim.notify('Copied "' .. out .. '" to the clipboard!')
end, {})

-- Copy file path and without number with `:Path`
vim.api.nvim_create_user_command("Path", function()
  local path = vim.fn.expand("%:.:h")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- =====================
-- NVIM DAP
-- =====================
-- Usage
-- DapNew
-- DapTerminate

-- <C-b> or DapToggleBreakpoint
-- DapClearBreakpoints
-- DapStepOver
-- DapStepInto
-- DapContinue
require("dapui").setup()
require("lazydev").setup({
  library = { "nvim-dap-ui" },
})
require('dap-go').setup()

-- Map DapToggleBreakpoint to ctrl+b
vim.keymap.set('n', '<C-b>', function()
  require('dap').toggle_breakpoint()
end, { noremap = true, silent = true})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- =====================
-- LSP Settings
-- =====================
-- Usage
-- `gd` - go to def
-- `gr` - find references
-- `gi` - find implementation
-- `<space>D` get defintion
-- `<space>F` formatter
local on_attach = function(client, bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  -- Detach if buffer has no filename.
  if bufname == '' then
    vim.defer_fn(function()
      vim.lsp.buf_detach_client(bufnr, client.id)
    end, 0)
    return
  end

  vim.lsp.set_log_level("debug")

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').gopls.setup {
  cmd = {'gopls', '-remote=auto', '-rpc.trace', '-v'},
  on_attach = on_attach,
  capabilities = lsp_capabilities,
  init_options = {},
  flags = {
    -- Don't spam LSP with changes. Wait a second between each.
    debounce_text_changes = 1000,
  },
}

-- =====================
-- Code Complete
-- =====================
-- Usage
-- `Shift Tab` to select a previous suggestion
-- `Tab` to select the next suggestion
-- `Control + Space` to accept the suggestion
local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<c-space>"] = cmp.mapping.confirm({select = true}),
    ["<s-tab>"] = cmp.mapping.select_prev_item(),
    ["<tab>"] = cmp.mapping.select_next_item(),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- =====================
-- CodeCompanion
-- =====================
-- Usage (From view mode)
-- `:CodeCompanionChat Add` - add highlighted text to an active chat
-- `:CodeCompanionChat` - open a new chat
-- `:CodeCompanionActions` - open actions modal
-- `:CodeCompanion ${prompt}` - inline prompt to modify active buffer
--
-- Usage (from chat buffer)
-- `/ <C-_>` opens a helper (from edit mode)
-- `# <C-_>` opens a variable (from edit mode)
-- `@ <C-_>` opens a tool (from edit mode)
-- `gd` - view debug info from chat (from view mode)
--
-- Ref API Key conf: https://codecompanion.olimorris.dev/getting-started.html
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "openai",
      model = "gpt-5-mini",
    },
    inline = {
      adapter = "openai",
      model = "gpt-5-mini",
    },
  },
})

vim.api.nvim_create_autocmd({"BufEnter", "BufReadPost"}, {
  pattern = "*CodeCompanion*",
  callback = function()
    vim.bo.filetype = "markdown"
    local ok, md = pcall(require, "render-markdown")
    if ok and md.refresh then
      md.refresh()
    end
  end
})

-- =====================
-- Copilot
-- =====================
-- Copilot configuration and install
--
-- nvm install node
-- :Copilot setup
-- Visit https://github.com/login/device to input code
--
-- Usage Copilot Core Plugin:
-- <Leader><space> to accept copilot suggestion
-- <Leader><tab> to go to next suggestion
-- <Leader><s-tab> to go to previous suggestion
--
-- Usage Copiot Chat Plugin:
-- :CopilotChatOpen to open chat session
-- :CopilotChatReset to reset chat session
-- :CopilotChat <input>? to send message to chat
-- :CopilotChatExplain to get explanation of selection in buffer
-- :CopilotChatReview to review selected code
-- :CopilotChatFix to rewrite buggy code
-- :CopilotChatDocs to add documentation for the selection in buffer
-- :CopilotChatTests tog enerate tests for the code
--vim.g.copilot_no_tab_map = true
--vim.api.nvim_set_keymap("i", "<Leader><space>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--vim.keymap.set("i", "<Leader><tab>", '<Plug>(copilot-next)')
--vim.keymap.set("i", "<Leader><s-tab>", '<Plug>(copilot-previous)')
--require("CopilotChat").setup {
--  debug = true,
--}

EOF
