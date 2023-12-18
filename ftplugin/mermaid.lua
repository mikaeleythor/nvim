vim.cmd("au BufWritePost *.mmd !mmdc -i % -e png & <afile>")
vim.api.nvim_create_user_command('MmdPreview', '!display -update 1 %.png &', {})
