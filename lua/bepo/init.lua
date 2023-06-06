local function remap(mode, from, to)
    vim.keymap.set(mode, from, to, { noremap = false, silent = false })
end

-- c: delete text and start insert
-- t: move to
-- s: delete text and start substitute
-- r: replace char under cursor with

local function setup()
    remap({ "n", "v" }, "c", "<Left>")
    remap({ "n", "v" }, "t", "<Down>")
    remap({ "n", "v" }, "s", "<Up>")
    remap({ "n", "v" }, "r", "<Right>")

    remap({ "n", "v" }, "C", "H")
    remap({ "n", "v" }, "T", "J")
    -- S is used for leap
    remap({ "n", "v" }, "R", "L")

    remap({ "n", "v" }, "l", "c")
    remap({ "n", "v" }, "L", "C")

    remap({ "n", "v" }, "h", "t")
    remap({ "n", "v" }, "H", "T")

    remap({ "n", "v" }, "K", "S")
    remap({ "n", "v" }, "k", "s")

    remap({ "n", "v" }, "j", "r")
    remap({ "n", "v" }, "J", "R")

    remap({ "n", "v" }, "k", "s")
    remap({ "n", "v" }, "k", "s")

    remap({ "n" }, ",", ";")
    remap({ "n" }, ";", ",")
    remap({ "n" }, "g,", "g;")
    remap({ "n" }, "g;", "g,")

    remap({ "n" }, "zt", "zj")
    remap({ "n" }, "zs", "zk")

    remap({ "n" }, "yh", "yt");
    remap({ "n" }, "dh", "dt");
    remap({ "n" }, "lh", "ct");

    remap({ "n", "v" }, "«", "<<")
    remap({ "n", "v" }, "»", ">>")

    remap({ "n" }, "é", ":m +1<CR>")
    remap({ "n" }, "É", ":m -2<CR>")
    remap({ "v" }, "é", ":m '>+1<CR>gv=gv")
    remap({ "v" }, "É", ":m '<-2<CR>gv=gv")
end

local function nvim_surround()
    return {
        keymaps = {
            insert = "<C-g>ç",
            insert_line = "<C-g>Ç",
            normal = "yç",
            normal_cur = "yçç",
            normal_line = "yÇ",
            normal_cur_line = "yÇÇ",
            visual = "Ç",
            visual_line = "gÇ",
            delete = "dç",
            change = "lç",
			change_line = "lÇ",
        },
    }
end

local function leap()
    vim.keymap.set("n", "S", "<Plug>(leap-forward-to)", { noremap = false })
    vim.keymap.set("n", "<C-S>", "<Plug>(leap-backward-to)", { noremap = false })
end

return {
    setup = setup,
    nvim_surround = nvim_surround,
    setup_leap = leap,
}
