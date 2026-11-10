local pairs = {
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['"'] = '"',
    ["'"] = "'",
    ['`'] = '`',
}

for open, close in pairs(pairs) do
    vim.keymap.set('i', open, open .. close .. '<Left>', { noremap = true, silent = true })
end
