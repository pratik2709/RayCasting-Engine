function drawRay(rayX, rayY)


    love.graphics.setColor(51, 255, 255)
    love.graphics.line(player.x * miniMapScale,
        player.y * miniMapScale,
        rayX * miniMapScale,
        rayY * miniMapScale)
end

function castRays()

    local vds = viewDist * viewDist
    local s =0
    for i = 0, numRays - 1, 1 do
        --understand?
        local raynumber = -numRays / 2 + i;
        local ang1 = raynumber * angle_between_rays
        local ang = player.rot + ang1
        castSingleRay(ang, s) --slightly confusing
        s = s + 1
    end
end

round = function(num)
	return math.floor(num+.5)
end

function castSingleRay(rayAngle, index)

    rayAngle = rayAngle % twopi
    if rayAngle < 0 then
        rayAngle = rayAngle + twopi
    end
    local right = (rayAngle > (twopi * 0.75) or rayAngle < (twopi * 0.25))
    local up = (rayAngle < 0 or rayAngle > pi)


    local wallType = 0;
    local texturex

    local angleSin = math.sin(rayAngle)
    local angleCos = math.cos(rayAngle)

    local dist = 0

    local xHit = 0
    local yHit = 0


    local textureX
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

        if (map[wallY][wallX] > 0) then
            local distX = x - player.x
            local distY = y - player.y

            dist = (distX * distX) + (distY * distY)
            wallType = map[wallY][wallX];
            texturex = y%1
            if not right
                then
                texturex = 1 - texturex
            end


            xHit = x
            yHit = y


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


        if (map[wallY][wallX] > 0) then
            local distX = x - player.x
            local distY = y - player.y

            local blockdist = distX * distX + distY * distY


        -- FUCK THIS: 0 does not evaluate to false in LUA!!!!
        --> print(not 0) false
            if (dist == 0) or (blockdist < dist) then
                dist = blockdist
                xHit = x
                yHit = y

                texturex = x%1
                if not up
                    then
                    texturex = 1 - texturex
                end

                wallType = map[wallY][wallX];
            end
            break
        end

            x = x + dXHor
            y = y + dYHor
        end


    if dist then

        drawRay(xHit, yHit)

        -- render walls here
        dist = math.sqrt(dist);
        dist = dist * math.cos(player.rot - rayAngle);
        local height = round(viewDist / dist)
        local xx = index * stripWidth
        local yy = round((screenHeight - height) / 2)


        if (wallType == 1) then
            love.graphics.setColor(128, 255, 0)
        elseif (wallType == 2) then
            love.graphics.setColor(255, 128, 0)
        elseif (wallType == 3) then
            love.graphics.setColor(204, 0, 102)
        elseif (wallType == 4) then
            love.graphics.setColor(0, 128, 255)
        else
            love.graphics.setColor(255, 0, 0)
        end

--            love.graphics.setColor(255, 0, 0)
--            love.graphics.draw( image, math.floor(0+(texturex*textureWidth)) ,0,1, textureHeight, xx, yy, stripWidth, height )
            love.graphics.rectangle( "fill", xx, yy, stripWidth, height )
--                rectfill(xx, yy, xx + stripWidth*3, yy+height)
    end
end

