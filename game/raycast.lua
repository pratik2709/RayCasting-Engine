function drawRay(rayX, rayY)

    love.graphics.line(player.x * miniMapScale,
        player.y * miniMapScale,
        rayX * miniMapScale,
        rayY * miniMapScale)
end

function castRays()

    local vds = viewDist * viewDist
    local index = 0
    local distArray = {}
    for i = 0, numRays - 1, 1 do
        --understand?
        local raynumber = -numRays / 2 + i;
        local rayScreenPos = (-numRays / 2 + i) * stripWidth;
        local rayViewDist = math.sqrt(rayScreenPos * rayScreenPos + vds);
        local rayAngle = math.asin(rayScreenPos / rayViewDist);
        local ang1 = raynumber * angle_between_rays
        local ang = player.rot + ang1
        local a = rayAngle + player.rot
        local xx, yy, height, textureoffset, dist, texturex, rayAngle = castSingleRay(a, index, distArray) --slightly confusing
        if dist then
            renderWalls(texturex, textureoffset, xx, yy, height)
        end
        --        castVerticalFloorRay(index, rayAngle, dist, yy, height)

        index = index + 1
    end
--    drawSprites101(distArray)
end

round = function(num)
    return math.floor(num + .5)
end

function castSingleRay(rayAngle, index, distArray)

    rayAngle = rayAngle % twopi
    if rayAngle < 0 then
        rayAngle = rayAngle + twopi
    end
    local right = (rayAngle > (twopi * 0.75) or rayAngle < (twopi * 0.25))
    local up = (rayAngle < 0 or rayAngle > pi)

    local vertical_stack = Stack.new()
    local vertical_info = {}
    local horizontal_stack = Stack.new()
    local horizontal_info = {}
--    s:push(1)
--    s:push(2)
--    s:push(3)
--    print_r(s)
--    s:pop()
--    print_r(s)

    local textureoffset

    local wallType = 0;
    local texturex

    local angleSin = math.sin(rayAngle)
    local angleCos = math.cos(rayAngle)

    local dist = 0

    local xHit = 0
    local yHit = 0


    local wallX
    local wallY

    --vertical run
    local slopeVer = angleSin / angleCos

    local dXVer
    local dYVer
    local y
    local x
    if right then
        dXVer = 1
    else
        dXVer = -1
    end

    dYVer = dXVer * slopeVer

    if right then
        x = math.ceil(player.x)
    else
        x = math.floor(player.x)
    end

    y = player.y + (x - player.x) * slopeVer
    while (x >= 0 and x < mapWidth and y >= 0 and y < mapHeight)
    do
        local wallX
        local wallY
        if right then
            wallX = math.floor(x)
        else
            wallX = math.floor(x - 1)
        end

        wallY = math.floor(y)

        if (map[wallY][wallX] ~= nil and map[wallY][wallX] > 0) then
            local vals = {}
            local distX = x - player.x
            local distY = y - player.y

            dist = (distX * distX) + (distY * distY)
            wallType = map[wallY][wallX];
            texturex = y % 1
            if not right then
                texturex = 1 - texturex
            end


            xHit = x
            yHit = y

            vertical_info['dist'] = dist
            vertical_info['wallType'] = wallType
            vertical_info['texturex'] = texturex
            vertical_stack:push(vertical_info)
            vertical_info = {}
            break
        end

        x = x + dXVer
        y = y + dYVer
    end

    --horizontal run
    local slopeHor = angleCos / angleSin
    local dXHor
    local dYHor
    local y
    local x


    if up then
        dYHor = -1
    else
        dYHor = 1
    end

    dXHor = dYHor * slopeHor
    if up then
        y = math.floor(player.y)
    else
        y = math.ceil(player.y)
    end

    x = player.x + ((y - player.y) * slopeHor)

    while (x >= 0 and x < mapWidth and y >= 0 and y < mapHeight)
    do
        local wallX
        local wallY
        if up then
            wallY = math.floor(y - 1)
        else
            wallY = math.floor(y)
        end

        wallX = math.floor(x)

--        print(wallY)
--        print(wallX)
--        print(map[5][-1])
        if (wallY >= 0) then
            if (map[wallY][wallX] ~= nil and map[wallY][wallX] > 0) then
                local distX = x - player.x
                local distY = y - player.y

                local blockdist = distX * distX + distY * distY
                -- FUCK THIS: 0 does not evaluate to false in LUA!!!!
                --> print(not 0) false
                if (dist == 0) or (blockdist < dist) then
                    dist = blockdist
                    xHit = x
                    yHit = y

                    texturex = x % 1
                    if up then
                        texturex = 1 - texturex
                    end

                    wallType = map[wallY][wallX];
                end

                horizontal_info['dist'] = blockdist
                horizontal_info['wallType'] = wallType
                horizontal_info['texturex'] = texturex
                horizontal_stack:push(horizontal_info)
                horizontal_info = {}
                break
            end
        end

        x = x + dXHor
        y = y + dYHor
    end

--    print_r(vertical_stack)
--    print("****************")
--    print_r(horizontal_stack)
--    print("****************")
--    print(#horizontal_stack)
--    print(#vertical_stack)
--    os.exit()

--    local horizontal_stack_size = #horizontal_stack
--    local vertical_stack_size = #vertical_stack
--    if(horizontal_stack_size == vertical_stack_size)
--        then
--        while #horizontal_stack ~= 0 do
--            local last_horizontal_element = horizontal_stack:peek()
--            local last_vertical_element = vertical_stack:peek()
--            if last_horizontal_element['dist'] < last_vertical_element['dist']
--                then
--                local xx, yy, height, textureoffset, dist
--                = calculateWallRenderValues(last_horizontal_element['dist'],
--                    rayAngle,
--                    textureoffset,
--                    index,
--                    last_horizontal_element['wallType'])
--                renderWalls(last_horizontal_element['texturex'], textureoffset, xx, yy, height)
--            end
--            horizontal_stack:pop()
--            vertical_stack:pop()
--        end
--
--    elseif(horizontal_stack_size > vertical_stack_size)
--        then
--        while #horizontal_stack ~= 0 do
--            local last_horizontal_element = horizontal_stack:peek()
--            local last_vertical_element = vertical_stack:peek()
--            if #horizontal_stack ~= #vertical_stack
--                then
--                local last_horizontal_element = horizontal_stack:peek()
--                local xx, yy, height, textureoffset, dist
--                = calculateWallRenderValues(last_horizontal_element['dist'],
--                    rayAngle,
--                    textureoffset,
--                    index,
--                    last_horizontal_element['wallType'])
--                renderWalls(last_horizontal_element['texturex'], textureoffset, xx, yy, height)
--                horizontal_stack:pop()
--            end
--            if #horizontal_stack ~= 0 and (#horizontal_stack == #vertical_stack)
--                then
--                if last_horizontal_element['dist'] < last_vertical_element['dist']
--                    then
--                    local last_horizontal_element = horizontal_stack:peek()
--                    local xx, yy, height, textureoffset, dist
--                    = calculateWallRenderValues(last_horizontal_element['dist'],
--                        rayAngle,
--                        textureoffset,
--                        index,
--                        last_horizontal_element['wallType'])
--                    renderWalls(last_horizontal_element['texturex'], textureoffset, xx, yy, height)
--                    horizontal_stack:pop()
--                    vertical_stack:pop()
--
--                elseif last_horizontal_element['dist'] > last_vertical_element['dist']
--                    then
--                    local last_vertical_element = vertical_stack:peek()
--                    local xx, yy, height, textureoffset, dist
--                    = calculateWallRenderValues(last_vertical_element['dist'],
--                        rayAngle,
--                        textureoffset,
--                        index,
--                        last_vertical_element['wallType'])
--                    renderWalls(last_vertical_element['texturex'], textureoffset, xx, yy, height)
--                    horizontal_stack:pop()
--                    vertical_stack:pop()
--                end
--            end
--        end
--
--
--    elseif(horizontal_stack_size < vertical_stack_size)
--        then
--        while #vertical_stack ~= 0 do
--            local last_horizontal_element = horizontal_stack:peek()
--            local last_vertical_element = vertical_stack:peek()
--            if #horizontal_stack ~= #vertical_stack
--                then
--                local last_vertical_element = vertical_stack:peek()
--                local xx, yy, height, textureoffset, dist
--                = calculateWallRenderValues(last_vertical_element['dist'],
--                    rayAngle,
--                    textureoffset,
--                    index,
--                    last_vertical_element['wallType'])
--                renderWalls(last_vertical_element['texturex'], textureoffset, xx, yy, height)
--                vertical_stack:pop()
--            end
--            if #horizontal_stack ~= 0 and (#horizontal_stack == #vertical_stack)
--                then
--                if last_horizontal_element['dist'] < last_vertical_element['dist']
--                    then
--                    local last_horizontal_element = horizontal_stack:peek()
--                    local xx, yy, height, textureoffset, dist
--                    = calculateWallRenderValues(last_horizontal_element['dist'],
--                        rayAngle,
--                        textureoffset,
--                        index,
--                        last_horizontal_element['wallType'])
--                    renderWalls(last_horizontal_element['texturex'], textureoffset, xx, yy, height)
--                    horizontal_stack:pop()
--                    vertical_stack:pop()
--
--                elseif last_horizontal_element['dist'] > last_vertical_element['dist']
--                    then
--                    local last_vertical_element = vertical_stack:peek()
--                    local xx, yy, height, textureoffset, dist
--                    = calculateWallRenderValues(last_vertical_element['dist'],
--                        rayAngle,
--                        textureoffset,
--                        index,
--                        last_vertical_element['wallType'])
--                    renderWalls(last_vertical_element['texturex'], textureoffset, xx, yy, height)
--                    horizontal_stack:pop()
--                    vertical_stack:pop()
--                end
--            end
--        end
--    end


    if dist then
        --        drawRay(xHit, yHit)
        local xx, yy, height, textureoffset, dist = calculateWallRenderValues(dist, rayAngle, textureoffset, index, wallType)
        table.insert(distArray, dist)
        --        renderFloor(height, yy, xx, xHit, yHit, dist, rayAngle)
        return xx, yy, height, textureoffset, dist, texturex, rayAngle
    end
    --        drawRay(xHit, yHit)

--    table.insert(distArray, dist)
    --        renderFloor(height, yy, xx, xHit, yHit, dist, rayAngle)

end

