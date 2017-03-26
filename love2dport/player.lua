function move()

    local moveStep = player.speed * player.moveSpeed
    player.rot = player.rot + (player.dir * player.rotSpeed)


    local newX = player.x + math.cos(player.rot) * moveStep
    local newY = player.y + math.sin(player.rot) * moveStep

    if isBlocking(newX, newY) then
        return
    end

    player.x = newX
    player.y = newY
end

function isBlocking(x, y)
    if y < 0 or y >= mapHeight or x < 0 or x >= mapWidth then
        return true
    end
--needs better detection
    if map[math.floor(y)][math.floor(x)] > 0 then
        return true
    end
end

