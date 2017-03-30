function drawRay(rayX, rayY)
    love.graphics.setColor(51, 255, 255)
    love.graphics.line(player.x * miniMapScale,
        player.y * miniMapScale,
        rayX * miniMapScale,
        rayY * miniMapScale)
end

function castRays()
    local leftmostRayPos = -numRays / 2;
    for i = 0, numRays, 1 do
        --understand?

        rayScreenPos = (leftmostRayPos + i) * stripWidth
        rayViewDist = math.sqrt(rayScreenPos * rayScreenPos + viewDist * viewDist)
        rayAngle = math.asin(rayScreenPos / rayViewDist)
        castSingleRay(player.rot + rayAngle, i) --slightly confusing
    end
end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function castSingleRay(rayAngle, index)
    rayAngle = rayAngle % twopi
    if rayAngle < 0 then
        rayAngle = rayAngle + twopi
    end

    local right = (rayAngle > (twopi * 0.75) or rayAngle < (twopi * 0.25))
    local up = (rayAngle < 0 or rayAngle > pi)

    local wallType = 0;

    local angleSin = math.sin(rayAngle)
    local angleCos = math.cos(rayAngle)
    local dist = 0
    local xHit = 0
    local yHit = 0

    local textureX
    local wallX
    local wallY

    --vertical run
    local slope = angleSin / angleCos

    local dXVer
    local dYVer
    local y
    local x
    if right then
        dXVer = 1
    else
        dXVer = -1
    end

    dYVer = dXVer * slope

    if right then
        x = math.ceil(player.x)
    else
        x = math.floor(player.x)
    end

    y = player.y + (x - player.x) * slope

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

            --wierd --check
            if (map[wallY+1][wallX+1] > 0) then
                local distX = x - player.x
                local distY = y - player.y

                dist = distX * distX + distY * distY
                wallType = map[wallY+1][wallX+1];

                -- skipping texture
                textureX = y % 1;
            if not right
            then
                textureX = 1 - textureX
            end

                xHit = x
                yHit = y

                break
            end
        x = x + dXVer
        y = y + dYVer
    end


    --horizontal run
    local slope = angleCos / angleSin
    local dXHor
    local dYHor
    local y
    local x

    if up then
        dYHor = -1
    else
        dYHor = 1
    end

    dXHor = dYHor * slope
    if up then
        y = math.floor(player.y)
    else
        y = math.ceil(player.y)
    end

    x = player.x + (y - player.y) * slope

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


        if (map[wallY+1][wallX+1] > 0) then
            local distX = x - player.x
            local distY = y - player.y

            local blockdist = distX * distX + distY * distY
            if not dist or blockdist < dist then
                dist = blockdist
                xHit = x
                yHit = y
                wallType = map[wallY+1][wallX+1];

                textureX = x % 1
                if up then
                    textureX = 1 - textureX
                end

            end
            break
        end
        x = x + dXHor
        y = y + dYHor
    end

    if dist then
        drawRay(xHit, yHit)
        -- render walls here
        local strip = screenStrips[stripIdx]
        dist = math.sqrt(dist);
        dist = dist * math.cos(player.rot - rayAngle);
        local height = round(viewDist/dist)
        local xx = index * stripWidth
        local yy = round((screenHeight - height)/2)


        if(wallType == 1)
            then
            love.graphics.setColor(128, 255, 0)
        elseif(wallType == 2)
            then
            love.graphics.setColor(255, 128, 0)
        elseif(wallType == 3)
            then
            love.graphics.setColor(204, 0, 102)
        elseif(wallType == 4)
            then
            love.graphics.setColor(0, 128, 255)
        else
            love.graphics.setColor(255, 0, 0)
        end

    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle( "fill", xx, yy, stripWidth*3, height )
--        rectfill(xx, yy, xx + stripWidth*3, yy+height, color(c))

    end
end

