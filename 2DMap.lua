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
    pi = 3.14
    twopi = 6.28
    player = {
        x = 16,
        y = 10,
        dir = 0,
        rot = 0,
        speed = 0,
        moveSpeed = 0.18,
        rotSpeed = 6 * pi / 180
    }

    minMapScale = 9
    screenWidth = 128
    stripWidth = 4
    fov = 60 * pi / 180
    numRays =ceil(screenWidth/stripWidth)
    viewDist = (screenWidth/2) / (sin(fov/2)/cos(fov/2))
    mapWidth = 32
    mapHeight = 24
    miniMapScale = 3
--    drawMiniMap()
end

function drawMiniMap()
    cls()
    for y=1,mapHeight,1
        do
        for x=1,mapWidth,1
            do
            local wall = map[y][x]
            if wall > 0
                then
                spr(1, x*miniMapScale, y*miniMapScale)
            end
        end
    end
end

function _update()

    if btn(0) then
        player.dir = -1;
    end
    if btn(1) then
        player.dir = 1;
    end
    if btn(2) then
        player.speed = 1;
    end
    if btn(3) then
        player.speed = -1;
    end

    move();
    castRays()
end

function castRays()
    local stripIdx = 0
    for i=0,numRays, 1 do
        --understand?
        rayScreenPos = (-numRays + i) * stripWidth
        rayViewDist = sqrt(rayScreenPos*rayScreenPos + viewDist*viewDist)
        rayAngle = asin(rayScreenPos/rayViewDist)
        castSingleRay(player.rot + rayAngle) --slightly confusing
    end

end

function castSingleRay(rayAngle)
    rayAngle = rayAngle%twopi
    if rayAngle < 0
        then
        rayAngle = rayAngle + twopi
    end

    local right = (rayAngle > twopi * 0.75 or rayAngle < twopi * 0.25)
    local up = (rayAngle < 0 or rayAngle > pi)

    local angleSin = sin(rayAngle)
    local angleCos = cos(rayAngle)
    local dist = 0
    local xHit = 0
    local yHit = 0

    local textureX

    --vertical run
    local slope = angleSin / angleCos
    local wallX
    local wallY
    local dX
    local dY
    local y
    local x
    if right then
        dX = 1
    else
        dX = -1
    end

    dY = dX * slope
    if right
        then
        x = ceil(player.x)
    else
        x = flr(player.x)
    end

    local y = player.y + (x - player.x) * slope

    while(x >= 0 and x < mapWidth and y >=0 and y < mapHeight)
        do
        local wallX
        local wallY
        if right then
            wallX = floor(x)
        else
            wallX = floor(x - 1)
        end

        wallY = floor(y)

        -- why opposite?? YX?
--    if not wallY or not wallX
--        then
--        print("her")
--        print(wallX)
--        print(wallY)
--        print(map[wallY][wallX])
--    end
        if wallX and wallY
            then
            print(wallX)
            print(wallY)
            if(map[wallY][wallX] > 0)
                then
                local distX = x - player.x
                local distY = y - player.y

                dist = distX*distX + distY*distY
                -- skipping texture
                xHit = x
                yHit = y

                break
            end
        end
        x = x + dX
        y = y + dY
    end


    --horizontal run
    local slope = angleCos / angleSin
    local dX
    local dY
    local y
    local x

    if up then
        dY = -1
    else
        dY = 1
    end

    dX = dY * slope
    if up
        then
        y = floor(player.y)
    else
        y = ceil(player.y)
    end

    x = player.x + (y - player.y) * slope

    while(x >= 0 and x < mapWidth and y >=0 and y < mapHeight)
        do
        local wallX
        local wallY
        if right then
            wallY = floor(y - 1)
        else
            wallY = floor(y)
        end

        wallX = floor(x)

        -- why opposite?? YX?
    print "**"
        print(wallX)
    print "--"
        print(wallY)
    print "##"

    if not wallY or not wallX
        then
        print("her")
        print(wallX)
        print(wallY)
        print(map[wallY][wallX])
    end
        if wallX and wallY and (map[wallY][wallX] > 0)
            then
            local distX = x - player.x
            local distY = y - player.y

            local blockdist = distX*distX + distY*distY
            if not dist or blockdist < dist
                then
                dist = blockdist
                xHit = x
                yHit = y
            end
            break
        end
        x = x + dX
        y = y+ dY
    end

    if dist
        then
        drawRay(xHit, yHit)
    end

end

function drawRay(rayX, rayY)
    --how to draw?
    line(player.x, player.y, rayX, rayY, "red")
end

function move()
    -- moveSpeed: step in map units each update dist/time
    -- speed : foward or backward
    local moveStep = player.speed * player.moveSpeed
    -- player dir 1 right and -1 left
    -- player ro speed: speed at which player can turn
    -- player rot:  current angle
    player.rot = player.rot + player.dir * player.rotSpeed;

    --unclear
    while player.rot < 0
        do
        player.rot += twopi
    end
    while player.rot >= twopi
        do
        player.rot -= twopi
    end

    local newX = player.x + cos(player.rot) * moveStep
    local newY = player.y + sin(player.rot) * moveStep

    if isBlocking(newX, newY)
        then
        return
    end

    player.x = newX
    player.y = newY
end

function isBlocking(x,y)
--    print "inside is blocking"
--    print(x)
--    print(y)
    if y < 0 or y >= mapHeight or x < 0 or x >= mapWidth
        then
        return true
    end
    return (not map[flr(y)][flr(x)] == 0)
end



function asin(x)
  if x<0 then negate=1 else negate=0 end
  x = abs(x);
  ret = -0.0187293;
  ret *= x;
  ret += 0.0742610;
  ret *= x;
  ret -= 0.2121144;
  ret *= x;
  ret += 1.5707288;
  ret = 3.14159265358979*0.5 - sqrt(1.0 - x)*ret;
  return ret - 2 * negate * ret;
end

function test()
    for i=1,24 do
        for j = 1,32 do
            print(map[i][j])
        end
    end
end



function floor(x)
    return flr(x)
end

--issues
function ceil(num)
  return flr(num+0x0.ffff)
end