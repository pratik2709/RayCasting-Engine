function print_r(t)
    local print_r_cache = {}
    local function sub_print_r(t, indent)
        if (print_r_cache[tostring(t)]) then
            print(indent .. "*" .. tostring(t))
        else
            print_r_cache[tostring(t)] = true
            if (type(t) == "table") then
                for pos, val in pairs(t) do
                    if (type(val) == "table") then
                        print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
                        sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
                        print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
                    elseif (type(val) == "string") then
                        print(indent .. "[" .. pos .. '] => "' .. val .. '"')
                    else
                        print(indent .. "[" .. pos .. "] => " .. tostring(val))
                    end
                end
            else
                print(indent .. tostring(t))
            end
        end
    end

    if (type(t) == "table") then
        print(tostring(t) .. " {")
        sub_print_r(t, "  ")
        print("}")
    else
        sub_print_r(t, "  ")
    end
    print()
end

function tcount(t)
    local i = 0
    for k in pairs(t) do i = i + 1 end
    return i
end

function celda(x, y)
    fx = math.floor(x)
    fy = math.floor(y)
    --	if fx>10 or fy>10 then return 0 end
    --	if fx<0 or fy<0 then return 0 end
    return floor_map[fx][fy]
end

function manipulate_player_plane()
    local turnSpeed = rotSpeed * player.x
    local oldPlaneX = player.planeX
    player.planeX = player.planeX * math.cos(turnSpeed) - player.planeY * math.sin(turnSpeed)
    player.planeY = oldPlaneX * math.sin(turnSpeed) + player.planeY * math.cos(turnSpeed)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end