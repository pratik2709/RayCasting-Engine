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

        local left = screenMiddle - size / 2 + x

        local top = (screenHeight / 2 - (0.55) * size)
        local sy = (64 * 0.01 * size) + (0.45) * size

        local dbx = sprite.x - player.x
        local dby = sprite.y - player.y

        -- assume this is the distance between sprite and player?

        local blockdist = dbx * dbx + dby * dby
        local z = -math.floor(blockdist * 1000)



        if not (size <= 0) then
            local cumulativeDS = 0
            local cumulativeTS = 0
            local tx = 0
            -- draw sprite strip by strip
            local strips = math.floor(size / stripWidth)
--            print(strips)
            --            print("***")
--            for i = 0, strips, 1
--            do
--                cumulativeDS = (cumulativeDS + (stripWidth))
--                cumulativeTS = math.floor(cumulativeDS * sprite.spriteWidth / size)
--                if cumulativeTS > sprite.spriteWidth then
--                    cumulativeTS = sprite.spriteWidth
--                end
--
--                love.graphics.setColor(255, 255, 255)
--                left = left + cumulativeTS
--                local q = love.graphics.newQuad(cumulativeDS, 0, stripWidth, 64, armorImage:getDimensions())
--                love.graphics.draw(armorImage, q, left, top, 0, size / 64, size / 64)
--                cumulativeTS = 0
--                cumulativeDS = 0
--            end
            --            print("***")

            -- draw the sprite in 1 go

            love.graphics.setColor(255, 255, 255)
            local q = love.graphics.newQuad(16, 0, 8, 64, armorImage:getDimensions())
            left = left + size
            love.graphics.draw(armorImage, q, left, top, 0, size / 64, size / 64)
            print("***")
            print(left)
            love.graphics.setColor(255, 255, 255)
            local q = love.graphics.newQuad(16, 0, 8, 64, armorImage:getDimensions())
            left = left + size
            love.graphics.draw(armorImage, q, left, top, 0, size / 64, size / 64)
            print(left)
            print("***")

--            love.graphics.setColor(255, 255, 255)
--            local q = love.graphics.newQuad(16, 0, 8, 64, armorImage:getDimensions())
--            love.graphics.draw(armorImage, q, left+24, top, 0, size / 64, size / 64)
--
--            love.graphics.setColor(255, 255, 255)
--            local q = love.graphics.newQuad(16, 0, 8, 64, armorImage:getDimensions())
--            love.graphics.draw(armorImage, q, left + 32, top, 0, size / 64, size / 64)
--
--            love.graphics.setColor(255, 255, 255)
--            local q = love.graphics.newQuad(16, 0, 8, 64, armorImage:getDimensions())
--            love.graphics.draw(armorImage, q, left + 40, top, 0, size / 64, size / 64)
        end
    end
end




