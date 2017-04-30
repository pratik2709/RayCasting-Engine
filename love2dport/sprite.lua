function addSprite(initial_sprite_state)
    if not initial_sprite_state
        then
        initial_sprite_state = {}
        tmerge(initial_sprite_state, default_initial_sprite_state)
    else
        -- expecting to be passed correct and complete sprite state
        print "over here"
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

function drawSprites()
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

end

function spriteDistances(sprite1, sprite2)
    print "here"
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


