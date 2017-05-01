function addSprite(initial_sprite_state)
    if not initial_sprite_state
        then
        initial_sprite_state = {}
        tmerge(initial_sprite_state, default_initial_sprite_state)
    else
        -- expecting to be passed correct and complete sprite state
        tmerge(initial_sprite_state, default_initial_sprite_state)
    end
    --add to sprites_array
    table.insert(_sprites, initial_sprite_state)
end


function tmerge(first_table, second_table)
    for k,v in pairs(second_table) do
        --check if k contains a value in the second table or the first table
        -- it will be always only one of those tables for this game
        if not v
        then
            first_table[k] = v
        end

    end
end

function drawSprites(distArray)
    if not check_sprite_array_contains_sprites()
        then
        return
    end

    local sprite_distances = {}
    -- get distaces from the player
    -- distance between 2 points
    if tcount(_sprites) == 1
        then
        sprite_distances[_sprites[1].id] = getDistanceToPlayer(_sprites[1])
    else
        -- get sorted distance
        -- still intermediate
        -- this path wont be called
        table.sort(_sprites, spriteDistances)
    end

    --make available to players
    player.spriteDistances = sprite_distances
    local crossHairSize = player.crossHairSize
    local screenMiddle = screenWidth/2
    local playerCrossHairHit = {}

    -- go through all the sprites
    -- draw the far away ones first
    for i=1, tcount(_sprites), 1
        do
        local sprite = _sprites[i]
        -- pick up the sprite one by one to draw
        local distSprite = sprite_distances[sprite.id]
        -- whats xsprite and ysprite
        --
        local xSprite = sprite.x - spriteDrawOffsetX
        local ySprite = sprite.y - spriteDrawOffsetY

        -- do not draw on minimap as of now
        -- sprite angle relative to player ? and sprite size ?
        -- this is a vector calculation ?
        xSprite = xSprite - player.x
        ySprite = ySprite - player.y
        local spriteAngle = math.atan2(ySprite, xSprite) - player.rot
        -- size of the sprite
        local size = viewDist/(math.cos(spriteAngle)*distSprite)

        -- inverted loop condition
        if not (tonumber(size) <= tonumber(0))
            then
            -- no idea whats happening
            -- assuming get x and y location of the sprite
            local x = math.floor(screenWidth/2 + math.tan(spriteAngle) * viewDist - size * sprite.spriteScaleX/2)
            local y = math.floor(screenHeight/2 + - (0.55 + sprite.spriteScaleY - 1) * size)

            -- calculate the scale
            local sx = math.floor(size * sprite.spriteScaleX)
            local sy = math.ceil(sprite.spriteHeight * 0.01 * size) + (0.45 + sprite.spriteScaleY - 1) * size

            --renderSprite()
            -- horizontal offset in sprite atlas
            local tx = sprite.spriteOffsetX
            -- horizontal size in sprite atlas ??
            local ts = sprite.spriteWidth

            -- no idea ?
            local cumulativeDS = 0
            local cumulativeTS = 0

            --number of strips to draw
            local strips = sx/stripWidth

            --collecting stripes to draw ??
            local drawing = false

            --all sprites collected
            local execute_draw = false


            for j=0, strips - 1, 1
                do

                --cumulative sizes??
                -- no idea
                cumulativeDS = cumulativeDS + stripWidth
                cumulativeTS = math.floor(cumulativeDS * sprite.spriteWidth/sx)
                if cumulativeTS > sprite.spriteWidth then
                    cumulativeTS = sprite.spriteWidth
                    else
                    cumulativeTS = cumulativeTS
                end

                --index in distance list ?
                -- no idea

                local distIndex = math.floor((x+cumulativeDS) * (tcount(distArray))/(screenWidth))
                --error because this is negative?
--                print (distIndex)
                --distance of wall for this strip
                local distWall = distArray[distIndex]

                if distWall ~= nil
                    then
                    local distDelta = distWall - distSprite
                else
                    distWall = nil
                end

                --cannot compare number with nil!
                if not distWall ~= nil or distDelta < (distDelta < -0.1 * distSprite)
                    then
                    if drawing
                        then
                        execute_draw = true
                    end
                    drawing = false
                else
                    if not drawing
                        then
                        drawing = true
                        x = x + cumulativeDS;
                        tx = tx + cumulativeTS;
                        cumulativeDS = 0;
                        cumulativeTS = 0;
                    end


                end
                if execute_draw
                    then
                    renderSprite(tx,cumulativeTS,x,cumulativeDS,sy)
                    execute_draw = false
                    drawing = false
                elseif j+1 >= strips and drawing
                    then
                    renderSprite(tx,cumulativeTS,x,cumulativeDS,sy);
                    break
                else

                end

                --
            end


        end

    end

end

-- hold on for now
function renderSprite(tx, tw, sx, sw, sy)
    print "hereeeee"
    local q = love.graphics.newQuad( tx, sprite.spriteOffsetY, tw, sprite.spriteHeight, tablechairData:getDimensions())
    love.graphics.draw(tablechairData, q, sx, y,0, sw, sy)
end

function spriteDistances(sprite1, sprite2)
    local sd1, sd2
    if sprite_distances[sprite1.id] == nil
        then
        -- why would this condition would happen?
        sd1 = getDistanceToPlayer(sprite1)
        sprite_distances[sprite1.id] = sd1
    else
        sd1 = sprite_distances[sprite1.id]
    end
    if sprite_distances[sprite2.id] == nil
        then
        -- why would this condition would happen?
        sd2 = getDistanceToPlayer(sprite2)
        sprite_distances[sprite2.id] = sd2
    else
        sd2 = sprite_distances[sprite2.id]
    end
    return sd1 - sd2
end


function getDistanceToPlayer(sprite)
    -- this is simple distance formula with offset which is additional
    local sdx = sprite.x - player.x - spriteDrawOffsetX
    local sdy = sprite.y - player.y - spriteDrawOffsetY
    return math.sqrt(sdx*sdx + sdy*sdy)
end

function check_sprite_array_contains_sprites()
    if tcount(_sprites) == 0
        then
        return false
    else
        return true
    end
end

--
--
--local colors = {}
--colors[1] = "red"
--colors[2] = {"blue"}
--colors[3] = "green"
--
--local otherColors = {}
--otherColors[1] = {"blue"}
--otherColors[2] = "magenta"
--otherColors[3] = "yellow"
--otherColors[4] = "key"
--
--function joinMyTables(t1, t2)
--    for k,v in ipairs(t2) do
--        table.insert(t1, v)
--    end
--    return t1
--end
--
--print_r(colors)
--joinMyTables(colors, otherColors)
--print_r(colors)


