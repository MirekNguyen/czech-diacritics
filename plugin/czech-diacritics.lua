vim.api.nvim_create_user_command("AddDiacritics", function()
	require("czech-diacritics").add_diacritics()
end, {
	range = true,
})

