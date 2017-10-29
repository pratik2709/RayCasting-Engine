-- sprites are added to the list rather than create a sprite map
function addSprite(initial_sprite_state)
    if not initial_sprite_state then
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
    for k, v in pairs(second_table) do
        --check if k contains a value in the second table or the first table
        -- it will be always only one of those tables for this game
        if not v then
            first_table[k] = v
        end
    end
end


-- hold on for now
function renderSprite(sprite, tx, tw, sx, sw, sy, y)
    print("rendering sprite", y)
    if tw <= 0 or sw <= 0 then
        return
    end
    --    print "hereeeee"
    local q = love.graphics.newQuad(0, 0, 64, 64, tablechairImage:getDimensions())
    love.graphics.draw(tablechairImage, q, sx, y, 0, tw / 64, sprite.spriteHeight / 64)
    --    love.graphics.print( "textt", sx, y)
end

function spriteDistances(sprite1, sprite2)
    local sd1, sd2
    if sprite_distances[sprite1.id] == nil then
        -- why would this condition would happen?
        sd1 = getDistanceToPlayer(sprite1)
        sprite_distances[sprite1.id] = sd1
    else
        sd1 = sprite_distances[sprite1.id]
    end
    if sprite_distances[sprite2.id] == nil then
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
    return math.sqrt(sdx * sdx + sdy * sdy)
end

function check_sprite_array_contains_sprites()
    if tcount(_sprites) == 0 then
        return false
    else
        return true
    end
end

function handle_multiple_sprites()
    --        print "over here in more than 1 sprites"
    -- get sorted distance
    -- still intermediate
    -- this path wont be called
    table.sort(_sprites, spriteDistances)
end
