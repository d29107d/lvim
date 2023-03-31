lvim.leader = "space"

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-d>", ":BufferLinePickClose<CR>", opts)
keymap("n", "<S-c>", ":BufferLinePick<CR>", opts)
keymap("n", "<S-p>", ":BufferLineTogglePin<CR>", opts)
keymap("n", "<S-q>", ":bd<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<S-m>", ":Vista!!<cr>", opts)

vim.keymap.set({'x', 'o', 'n'}, 'z', '<Plug>(leap-forward-to)')
vim.keymap.set({'x', 'o', 'n'}, 'Z', '<Plug>(leap-backward-to)')

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

local status_ok, tb = pcall(require, "telescope.builtin")

if status_ok then
  local vim_keymap = vim.keymap.set
  vim_keymap('n', '<leader>gb', function()
    local text = vim.call('expand', '<cword>')
  	tb.current_buffer_fuzzy_find({ default_text = text })
  end, opts)
  vim_keymap('v', '<leader>gb', function()
  	local text = vim.getVisualSelection()
  	tb.current_buffer_fuzzy_find({ default_text = text })
  end, opts)

  keymap("n", "<leader>gc", "<cmd>GrepInDirectory<CR>", opts)
  keymap("n", "<leader>fc", "<cmd>FileInDirectory<CR>", opts)

  --keymap("n", "<leader>gc", ":lua require('telescope').extensions.live_grep_args()<CR>", opts)
  vim_keymap('n', '<leader>gg', ':Telescope live_grep<cr>', opts)
  vim_keymap('n', '<leader>ga', function()
    local text = vim.call('expand','<cword>')
  	tb.grep_string({ default_text = text })
  end, opts)
  vim_keymap('v', '<leader>ga', function()
  	local text = vim.getVisualSelection()
  	tb.grep_string({ default_text = text })
  end, opts)
end
