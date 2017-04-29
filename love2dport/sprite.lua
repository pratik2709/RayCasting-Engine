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


