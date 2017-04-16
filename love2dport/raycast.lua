function drawRay(rayX, rayY)


--    love.graphics.setColor(51, 255, 255)
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
        local rayScreenPos = (-numRays / 2 + i)* stripWidth;
        local rayViewDist = math.sqrt(rayScreenPos*rayScreenPos + vds);
        local rayAngle = math.asin(rayScreenPos / rayViewDist);
        local ang1 = raynumber * angle_between_rays
        local ang = player.rot + ang1
        local a = rayAngle + player.rot
        castSingleRay(a, s) --slightly confusing
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
                if up
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

--        drawRay(xHit, yHit)

        -- render walls here
        dist = math.sqrt(dist);
        local dist = dist * math.cos(player.rot - rayAngle);
        local height = round(viewDist / dist)
        local xx = index * stripWidth
        local yy = round((screenHeight - height) / 2)


        if (wallType == 1) then
            textureoffset = wallTextureMapping[0]
        elseif (wallType == 2) then
            textureoffset = wallTextureMapping[1]
        elseif (wallType == 3) then
            textureoffset = wallTextureMapping[2]
        elseif (wallType == 4) then
            textureoffset = wallTextureMapping[3]
        else
            textureoffset = wallTextureMapping[0]
        end

        -- draw single colored floor and ceiling

--        love.graphics.rectangle("fill", 0, 0, screenWidth, screenHeight )
--        love.graphics.reset( )
        love.graphics.setColor(255,255,255)
        local q = love.graphics.newQuad( textureoffset[0]+(texturex*textureWidth), textureoffset[1], 64, 64, image:getDimensions())
        love.graphics.draw(image, q, xx, yy,0, stripWidth/64, height/64)

        -- height is the height of the wall
        --
        local fheight = (screenHeight - height)/2
        local foffset = yy + height

        local vx = (xHit - player.x)/dist
        local vy = (yHit - player.y)/dist

        local bottom = foffset + fheight
        local distplayer = 0.0

        for fy = 0, fheight - 1, 1 do

--            local currentDist = bottom / (2 * (fy + foffset) - bottom)
--            local fweight = (currentDist - distplayer)/(dist - distplayer)
--            local wx = player.x + (vx * currentDist * fweight)
--            local wy = player.y + (vy * currentDist * fweight)
--            local mx = math.floor(wx)
--            local my = math.floor(wy)

            -- draw simple rectangles as a start
            local ct = fheight - fy;
            love.graphics.setColor(0, 255, (fy*0.5)%255)
            love.graphics.rectangle( "fill", xx, fy+foffset, stripWidth, 1 )
        end

        -- aspect ratio (relationship between width and height)
        -- aspect ratio = width/height
--        local fweight = (screenWidth / screenHeight)
--                       * this._fovFloorWeight



--        love.graphics.setColor(255, 0, 0)
--
--        love.graphics.setLineWidth( 10 )
--        love.graphics.line( 10, 0, 10, screenHeight)
--        love.graphics.setColor(0, 0, 255)
--        love.graphics.line( 20, 0, 20, height)
--        love.graphics.setColor(0, 255, 0)
--        love.graphics.line( 30, 0, 30, (screenHeight-height))
--        love.graphics.setColor(0, 255, 255)
--        love.graphics.line( 40, 0, 40, (screenHeight-height)/2)
--
--        love.graphics.setColor(0, 255, 128)
--        love.graphics.line( 50, 0, 50, y)
--
--        love.graphics.setColor(0, 128, 128)
--        love.graphics.line( 60, 0, 60, foffset)

    end
end

