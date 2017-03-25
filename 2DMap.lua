cos1 = cos function cos(angle) return cos1(angle/(3.1415*2)) end
sin1 = sin function sin(angle) return sin1(-angle/(3.1415*2)) end

function _init()
    map = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 3, 0, 3, 0, 0, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 3, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 3, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 },
        { 1, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 4, 0, 0, 4, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 4, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 4, 3, 3, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 3, 3, 4, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    };
    pi = 3.14159
    twopi = 6.28318
    player = {
        x = 16,
        y = 10,
        dir = 0,
        rot = 0,
        speed = 0,
        moveSpeed = 0.18,
        rotSpeed = 6 * pi / 180
    }

    screenWidth = 128 --diff
    screenHeight = 128
    stripWidth = 1 --diff
    fov = 60 * pi / 180
    numRays = ceil(screenWidth / stripWidth)
    viewDist = (screenWidth / 2) / (sin(fov / 2) / cos(fov / 2))
    mapWidth = 32 --diff
    mapHeight = 24
    miniMapScale = 3
    index = 0
    screenStrips = {}
    init_screen()
end


function drawMiniMap()
    for y = 1, mapHeight, 1
    do
        for x = 1, mapWidth, 1
        do
            local wall = map[y][x]
            if wall > 0 then
                rectfill(x * miniMapScale, y * miniMapScale, x * miniMapScale + miniMapScale, y * miniMapScale + miniMapScale, color(7))
            end
        end
    end
end

function _update()
    cls()
    drawMiniMap()
    if not btn(2) and not btn(3) then
        player.speed = 0
    end

    if not btn(0) and not btn(1) then
        player.dir = 0
    end
    --left
    if btn(0) then
        player.dir = -1;
    end
    --right
    if btn(1) then
        player.dir = 1;
    end
    --up
    if btn(2) then
        player.speed = 1;
    end
    --down
    if btn(3) then
        player.speed = -1;
    end

    --z
    if btn(4) then
        player.speed = 0;
        player.dir = 0;
    end

    move()
    updateMiniMap()
    castRays()
end

function castRays()
    for i = 1, numRays+1, 1 do
        --understand?
        rayScreenPos = (-numRays/2 + i) * stripWidth
        rayViewDist = sqrt(rayScreenPos * rayScreenPos + viewDist * viewDist)
        rayAngle = asin(rayScreenPos / rayViewDist)
        castSingleRay(player.rot + rayAngle, i) --slightly confusing
    end
end

function init_screen()
    for i=0,screenWidth, 1
        do
        add(screenstrips, {
            left=i,
            width= stripWidth,
            height= 0,
            colour= color(7)
        })
        end
end

function castSingleRay(rayAngle, index)

    local distx
    local disty

    rayAngle = rayAngle % twopi
    if rayAngle < 0 then
        rayAngle = rayAngle + twopi
    end

    local right = ((rayAngle > (twopi * 0.75)) or (rayAngle < (twopi * 0.25)))
    local up = (rayAngle < 0 or rayAngle > pi)

    local wallType = 0;

    local angleSin = sin(rayAngle)
    local angleCos = cos(rayAngle)

    local textureX


    --vertical run
    local slope_ver = angleSin / angleCos

    local dXVer
    local dYVer
    local y_ver
    local x_ver
    if right then
        dXVer = 1
    else
        dXVer = -1
    end

    dYVer = dXVer * slope_ver

    if right then
        x_ver = ceil(player.x)
    else
        x_ver = flr(player.x)
    end

    y_ver = player.y + (x_ver - player.x) * slope_ver

    local dist_v = -1
    local xHit_v = 0
    local yHit_v = 0
    local wallType_v = 0
    local wallX_v, wallY_v
    local do_v = true

    --horizontal run
    --horizontal run
    local slope_h = angleCos / angleSin
    local dXHor
    local dYHor
    local y_h
    local x_h

    if up then
        dYHor = -1
    else
        dYHor = 1
    end

    dXHor = dYHor * slope_h
    if up then
        y_h = flr(player.y)
    else
        y_h = ceil(player.y)
    end

    x_h = player.x + ((y_h - player.y) * slope_h)

    local dist_h = -1
    local xHit_h = 0
    local yHit_h = 0
    local wallType_h = 0
    local wallX_h, wallY_h
    local do_h = true

    while do_h or do_v
        do

        if(x_ver >= 0 and x_ver < mapWidth and y_ver >= 0 and y_ver < mapHeight)
        then
            do_v = true
        else
            do_v = false
        end

        if(x_h >= 0 and x_h < mapWidth and y_h >= 0 and y_h < mapHeight)
        then
            do_h = true
        else
            do_h = false
        end

        if do_v
            then
                if right then
                    wallX_v = flr(x_ver)
                else
                    wallX_v = flr(x_ver - 1)
                end

                wallY_v = flr(y_ver)

            if wallY_v > 0 and wallX_v > 0
                then
                wallType_v = map[wallY_v][wallX_v]
            end
--            if wallY_v > 0 and wallX_v > 0
--                then
--                wallType_v = map[wallY_v][wallX_v]
--            else
--                if wallY_v == 0
--                    then
--                    wallY_v = 1
--                end
--                if wallX_v == 0
--                    then
--                    wallX_v = 1
--                end
--                wallType_v = map[wallY_v][wallX_v]
--            end
                    --wierd --check
                if (wallType_v > 0) then
                    distx = x_ver - player.x
                    disty = y_ver - player.y

                    dist_v = distx * distx + disty * disty

                    -- skipping texture

                    xHit_v = x_ver
                    yHit_v = y_ver
                    do_v = false
                end
                x_ver = x_ver + dXVer
                y_ver = y_ver + dYVer
        end

        if do_h
            then
                if up then
                    wallY_h = flr(y_h - 1)
                else
                    wallY_h = flr(y_h)
                end

            wallX_h = flr(x_h)
--            print(y_h)
            if wallY_h > 0 and wallX_h > 0
                then
                wallType_h = map[wallY_h][wallX_h]
            end

             if (wallType_h > 0) then
                distx = x_h - player.x
                disty = y_h - player.y

                dist_h = distx * distx + disty * disty
                xHit_h = x_h
                yHit_h = y_h
                do_h = false
            end

            x_h = x_h + dXHor
            y_h = y_h + dYHor
        end

    end

    if ((dist_h ~= -1) and ((dist_v == -1) or (dist_v > dist_h)))
    then
        drawRay(xHit_h, yHit_h)
        render_walls(dist_h, rayAngle,wallType_h)
    else
        drawRay(xHit_v, yHit_v)
        render_walls(dist_v, rayAngle,wallType_v)
    end

end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return flr(num * mult + 0.5) / mult
end

function render_walls(dist, rayAngle,wallType)
    if dist then
        -- render walls here
        dist = sqrt(dist);
        dist = dist * cos(player.rot - rayAngle);
        local height = round(viewDist/dist)
        local xx = height * stripWidth
        local yy = round((screenHeight - height)/2)

        local c
        if(wallType == 1)
            then
            c = 8
        elseif(wallType == 2)
            then
            c = 9
        elseif(wallType == 3)
            then
            c = 3
        elseif(wallType == 4)
            then
            c = 12
        else
            c = 13
        end

        rectfill(xx, yy, xx + stripWidth, yy+height, color(c))
    end
end

function drawRay(rayX, rayY)
    --how to draw?
    --still need to understand
    line(player.x * miniMapScale,
        player.y * miniMapScale,
        rayX * miniMapScale,
        rayY * miniMapScale, color(8)
)
end

function move()
    -- moveSpeed: step in map units each update dist/time
    -- speed : foward or backward
    local moveStep = player.speed * player.moveSpeed
    -- player dir 1 right and -1 left
    -- player ro speed: speed at which player can turn
    -- player rot:  current angle
    player.rot += (player.dir * player.rotSpeed)

    --unclear
--    while player.rot < 0
--    do
--        player.rot += twopi
--    end
--    while player.rot >= twopi
--    do
--        player.rot -= twopi
--    end

    local newX = player.x + cos(player.rot) * moveStep
    local newY = player.y + sin(player.rot) * moveStep

    if isBlocking(newX, newY) then
        return
    end

    player.x = newX
    player.y = newY
end

function updateMiniMap()
    line(player.x * miniMapScale,
        player.y * miniMapScale,
        (player.x + cos(player.rot) * 4) * miniMapScale,
        (player.y + sin(player.rot) * 4) * miniMapScale, color(7))
end

function isBlocking(x, y)
    if y < 0 or y >= mapHeight or x < 0 or x >= mapWidth then
        return true
    end
--needs better detection
    if map[flr(y)][flr(x)] > 0 then
        return true
    end
end


-- close but not precise -- check
function asin(x)
    if x < 0 then negate = 1 else negate = 0 end
    x = abs(x);
    ret =-0.0187293;
    ret *= x;
    ret += 0.0742610;
    ret *= x;
    ret -= 0.2121144;
    ret *= x;
    ret += 1.5707288;
    ret = 3.14159265358979 * 0.5 - sqrt(1.0 - x) * ret;
    return ret - 2 * negate * ret;
end




function floor(x)
    return flr(x)
end

--issues
function ceil(num)
    return flr(num + 0x0.ffff)
end