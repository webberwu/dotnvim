require('img-clip').setup({
	default = {
		embed_image_as_base64 = false,
		prompt_for_file_name = false,
		drag_and_drop = {
			insert_mode = true,
		},
	},
})
require('avante_lib').load()

-- export OPENAI_API_KEY=your-api-key
require('avante').setup {
	provider = "openai",
    oopenai = {
        model = "gpt-4o",
    },
    system_prompt = [[
        扮演軟體開發專家，編碼時始終使用最佳實踐，尊重並使用代碼庫中已經存在的約定、套件等，使用繁體中文回答
    ]],
    history = {
        -- ~/.local/state/nvim
        storage_path = vim.fn.stdpath("state") .. "/avante",
        paste = {
            extension = "png",
            filename = "pasted-%Y-%m-%d-%H-%M-%S",
        },
    },
	mappings = {
		submit = {
			normal = "<C-j>",
			insert = "<C-j>",
		},
        ask = " aa",
	},
    windows = {
        width = 45,
    },
}
