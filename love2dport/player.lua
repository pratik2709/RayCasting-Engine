function move()

    local moveStep = player.speed * player.moveSpeed
    player.rot = player.rot + (player.dir * player.rotSpeed)


    local newX = player.x + cos(player.rot) * moveStep
    local newY = player.y + sin(player.rot) * moveStep

    if isBlocking(newX, newY) then
        return
    end

    player.x = newX
    player.y = newY
end

