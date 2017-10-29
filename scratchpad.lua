function drawSprites(distArray)
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

    -- go through all the sprites
    -- draw the far away ones first
    -- since this starts from 1 added 1 to count of sprites so that 1 < 2
    -- check if lua for loops include greater than or equal as well
    for i = 1, tcount(_sprites), 1
    do

        local sprite = _sprites[i]


        -- pick up the sprite one by one to draw
        local distSprite = sprite_distances[sprite.id]

        -- whats xsprite and ysprite?
        --
        local xSprite = sprite.x - spriteDrawOffsetX
        local ySprite = sprite.y - spriteDrawOffsetY

        -- do not draw on minimap as of now
        -- sprite angle relative to player ? and sprite size ?
        -- this is a vector calculation ?
        xSprite = xSprite - player.x
        ySprite = ySprite - player.y

        -- https://www.3dgep.com/understanding-the-view-matrix/
        --The View Matrix: This matrix will transform vertices from world-space to view-space.
        -- This matrix is the inverse of the camera’s transformation matrix described above.
        local inverseDeterminant = 1.0 / (player.planeX + player.d)


        local spriteAngle = math.atan2(ySprite, xSprite) - player.rot
        -- size of the sprite
        --        local size = viewDist/(math.cos(spriteAngle)*distSprite)
        local viewDist = 277.1281292110204
        local size = viewDist / (math.cos(spriteAngle) * distSprite)

        -- inverted loop condition
        if not (size <= 0) then

            -- no idea whats happening
            -- assuming get x and y location of the sprite
            local screenWidth = 320
            local screenHeight = 200
            sprite.spriteScaleX = 1
            sprite.spriteScaleY = 1

            --no idea whats happening here ?
            -- different from whats explained in the tutorial
            local x = math.floor(screenWidth / 2 + math.tan(spriteAngle) * viewDist - size * sprite.spriteScaleX / 2)
            local y = math.floor(screenHeight / 2 + -((0.55 + sprite.spriteScaleY - 1) * size))


            -- calculate the scale
            local sx = math.floor(size * sprite.spriteScaleX)
            local sy = math.ceil(sprite.spriteHeight * 0.01 * size) + ((0.45 + sprite.spriteScaleY - 1) * size)

            --renderSprite()
            -- horizontal offset in sprite atlas
            local tx = sprite.spriteOffsetX
            -- horizontal size in sprite atlas ??
            local ts = sprite.spriteWidth

            -- no idea ?
            local cumulativeDS = 0
            local cumulativeTS = 0

            --number of strips to draw
            local strips = sx / stripWidth

            --collecting stripes to draw ??
            local drawing = false

            --all sprites collected
            local execute_draw = false
        end
    end
end

