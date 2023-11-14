local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function getFilenameFromPath(path)
   return path:match("^.+/(.+)$")
end

local function getFilenameWithNoExtension(filename)
  return filename:match("[^/]*.md$")
end

local function getPathForServing(path)
  return path:gsub("static/", "/")
end

local copyAndLinkImage = function (absoluteFilename)
  local currentFileName = getFilenameWithNoExtension(vim.fn.expand('%'))
  local assetFolderName = "static/posts/" .. currentFileName:match "(.+)%..+"
  os.execute("mkdir -p " .. assetFolderName)
  os.execute("cp " .. absoluteFilename .. " " .. assetFolderName)

  local imageURL = getPathForServing(assetFolderName) .. "/" .. getFilenameFromPath(absoluteFilename) 

  vim.api.nvim_put({ "![](" .. imageURL .. ")" }, "c", true, true)
end

local imagePicker = function()
  require('telescope.builtin').find_files({
    search_dirs = {"~/Pictures", "~/Downloads"},
    attach_mappings = function(prompt_bufnr, _map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        copyAndLinkImage(selection[1])
      end)

      return true
    end
  })
end

local showImagePicker = function(_)
  imagePicker()
end

vim.api.nvim_create_user_command('HugoCopyImage', showImagePicker, { desc = "Copy an image to my Hugo folder structure" })

