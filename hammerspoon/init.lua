-- Function to focus on app or launch it if it's not running
function focusOrLaunch(appName, bundleID)
    local app = hs.application.get(appName)
    if app then
        if app:isFrontmost() then
            -- If the app is already focused, do nothing
            return
        else
            -- Focus on the app
            app:activate(true)
            app:unhide()
        end
    else
        -- Launch the app if it's not running
        hs.application.launchOrFocusByBundleID(bundleID)
    end
end

-- Define keyboard shortcuts
-- VSCode
hs.hotkey.bind({"cmd"}, "y", function()
    focusOrLaunch("Code", "com.microsoft.VSCode")
end)

-- Kitty
hs.hotkey.bind({"cmd"}, "u", function()
    focusOrLaunch("kitty", "net.kovidgoyal.kitty")
end)

-- Firefox
hs.hotkey.bind({"cmd"}, "i", function()
    focusOrLaunch("Firefox", "org.mozilla.firefox")
end)

-- Obsidian
hs.hotkey.bind({"cmd"}, "o", function()
    focusOrLaunch("Obsidian", "md.obsidian")
end)
