function drawSprites101(distArray)
    -- distArray: a collection of distances from player to strip of the wall
    -- just fail if  no sprites
    assert(check_sprite_array_contains_sprites())

    local sprite_distances = {}
    -- get distaces from the player
    -- distance between 2 points
    if tcount(_sprites) == 1 then
        sprite_distances[_sprites[1].id] = getDistanceToPlayer(_sprites[1])
    else
        handle_multiple_sprites()
    end

    --make available to players
    player.spriteDistances = sprite_distances

    local screenMiddle = screenWidth / 2

    for i = 1, tcount(_sprites), 1
    do

        local sprite = _sprites[i]

        -- pick up the sprite one by one to draw
        -- cant draw the sprite in one go ??
        -- have to draw sprite strip by strip
        -- each time check
        local distSprite = sprite_distances[sprite.id]

        local dx = sprite.x + 0.5 - player.x
        local dy = sprite.y + 0.5 - player.y



        local spriteAngle = math.atan2(dy, dx) - player.rot

        local size = viewDist / (math.cos(spriteAngle) * distSprite)

        local x = math.tan(spriteAngle) * viewDist

        local left = screenMiddle - size/2 + x

        local top = (screenHeight - size)/2

        local dbx = sprite.x - player.x
        local dby = sprite.y - player.y

        -- assume this is the distance between sprite and player?

        local blockdist = dbx*dbx + dby*dby
        local z = -math.floor(blockdist*1000)



        if not (size <= 0) then

        -- draw sprite strip by strip
        local strips = size / stripWidth
        for i = 1, strips, stripWidth
            do
            love.graphics.setColor(255,255,255)
            local q = love.graphics.newQuad( i, 0, stripWidth, 64, armorImage:getDimensions())
            love.graphics.draw(armorImage, q, left, top ,0, size/64, size/64)
        end

        -- draw the sprite in 1 go
--            love.graphics.setColor(255,255,255)
--            local q = love.graphics.newQuad( 0, 0, 64, 64, armorImage:getDimensions())
--            love.graphics.draw(armorImage, q, left, top ,0, size/64, size/64)
        end

    end
end




