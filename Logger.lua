
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer

-- CONFIGURATION
local BOT_TOKEN = "MTU1ODU2NTQ1OTY1MTk4OTUzNA.GZlXiz.JZJmK6u6dcmwG_whhhjNuw607TgpdmuOqFdu4Y"
local CHANNEL_ID = "1555581045884190750"
local ALLOWED_DISCORD_USER_ID = "665600204082380813"
local POLL_INTERVAL = 5

-- Find supported executor HTTP request function
local requestFn =
    (syn and syn.request)
    or (http and http.request)
    or http_request
    or request

if not requestFn then
    return
end

local API_URL =
    "https://discord.com/api/v10/channels/" .. CHANNEL_ID

-- Discord API request helper
local function discordRequest(method, url, payload)
    local response = requestFn({
        Url = url,
        Method = method,
        Headers = {
            ["Authorization"] = "Bot " .. BOT_TOKEN,
            ["Content-Type"] = "application/json"
        },
        Body = payload and HttpService:JSONEncode(payload) or nil
    })

    return tonumber(response.StatusCode or response.Status),
        response.Body or ""
end

-- Read messages from Discord
local function getMessages()
    local ok, status, body = pcall(function()
        return discordRequest(
            "GET",
            API_URL .. "/messages?limit=100"
        )
    end)

    if not ok or status ~= 200 then
        return nil
    end

    local decoded, messages = pcall(function()
        return HttpService:JSONDecode(body)
    end)

    if not decoded or type(messages) ~= "table" then
        return nil
    end

    return messages
end

-- Initialize listener and ignore old commands
local initialMessages = getMessages()

if not initialMessages then
    return
end

local seen = {}

for _, message in ipairs(initialMessages) do
    if message.id then
        seen[message.id] = true
    end
end

-- Send execution log to Discord
pcall(function()
    discordRequest("POST", API_URL .. "/messages", {
        content = string.format(
            "**Script executed**\n" ..
            "**Display name:** %s\n" ..
            "**Username:** %s",
            player.DisplayName,
            player.Name
        ),
        allowed_mentions = {
            parse = {}
        }
    })
end)

-- Listen for Discord commands
while true do
    task.wait(POLL_INTERVAL)

    local messages = getMessages()

    if messages then
        -- Process messages oldest first
        for i = #messages, 1, -1 do
            local message = messages[i]

            if message.id and not seen[message.id] then
                seen[message.id] = true

                -- Accept commands only from your Discord account
                if message.author
                    and not message.author.bot
                    and message.author.id == ALLOWED_DISCORD_USER_ID then

                    local command, target = (message.content or ""):match(
                        "^(%S+)%s+([%w_]+)%s*$"
                    )

                    if command and target
                        and target:lower() == player.Name:lower() then

                        command = command:lower()

                        if command == "!kick" then
                            player:Kick("Script Updated Rejoin & Re-Run The Script.")
                            return

                        elseif command == "!rejoin" then
                            local success = pcall(function()
                                TeleportService:TeleportToPlaceInstance(
                                    game.PlaceId,
                                    game.JobId,
                                    player
                                )
                            end)

                            -- Fallback: attempt to rejoin the experience
                            -- if the same-server teleport errors immediately
                            if not success then
                                pcall(function()
                                    TeleportService:Teleport(
                                        game.PlaceId,
                                        player
                                    )
                                end)
                            end

                            return
                        end
                    end
                end
            end
        end
    end
end
