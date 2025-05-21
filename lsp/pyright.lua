local function set_python_path(path)
	local clients = vim.lsp.get_clients({
		bufnr = vim.api.nvim_get_current_buf(),
		name = "pyright",
	})
	for _, client in ipairs(clients) do
		if client.settings then
			client.settings.python = vim.tbl_deep_extend("force", client.settings.python, { pythonPath = path })
		else
			client.config.settings =
				vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
		end
		client.notify("workspace/didChangeConfiguration", { settings = nil })
	end
end

return {

	on_init = function(client)
		if client.name ~= "pyright" then
			return
		end

		local path = client.workspace_folders and client.workspace_folders[1].name or nil
		if not path then
			return
		end

		-- Si ya existe pyrightconfig.json, no hacemos nada
		if vim.uv.fs_stat(path .. "/pyrightconfig.json") then
			return
		end

		-- Detectar entorno virtual
		local venv_python = nil
		local venvs = { "venv", ".venv" }
		for _, v in ipairs(venvs) do
			local venv_path = path .. "/" .. v .. "/bin/python"
			if vim.fn.has("win32") == 1 then
				venv_path = path .. "\\" .. v .. "\\Scripts\\python.exe"
			end
			if vim.fn.executable(venv_path) == 1 then
				venv_python = venv_path
				break
			end
		end

		-- Usar el Python del entorno virtual si se detecta, o el sistema
		local python_path = venv_python or vim.fn.exepath("python")

		client.config.settings.python = vim.tbl_deep_extend("force", client.config.settings.python or {}, {
			pythonPath = python_path,
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace", -- o 'openFilesOnly'
				typeCheckingMode = "basic",
				extraPaths = {
					"src", -- puedes personalizar esta ruta según tu estructura
				},
			},
		})
	end,
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightOrganizeImports", function()
			client:exec_cmd({
				command = "pyright.organizeimports",
				arguments = { vim.uri_from_bufnr(bufnr) },
			})
		end, {
			desc = "Organize Imports",
		})
		vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", set_python_path, {
			desc = "Reconfigure pyright with the provided python path",
			nargs = 1,
			complete = "file",
		})
	end,
}
