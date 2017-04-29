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


function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

function drawSprites()
    if not check_sprite_array_contains_sprites()
        then
        return
    end

end

function check_sprite_array_contains_sprites()
    if table.getn(_sprites) == 0
        then
        return false, 1
    else
        return true, 2
    end
end

check_sprite_array_contains_sprites()
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


