local player = {
    x = 8.2632423522659,
    y = 6.9649862353517,
    h = 200,
    dir = 0,
    rot = 0,
    speed = 0,
    moveSpeed = 4,
    rotSpeed = 60
}

map = { [0]=
    {[0]= 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    {[0]= 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 3, 0, 3, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 3, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 1, 1 },
    {[0]= 1, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 3, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 },
    {[0]= 1, 0, 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 1, 1 },
    {[0]= 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 },
    {[0]= 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 1, 1, 1 },
    {[0]= 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 4, 0, 0, 4, 2, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 4, 3, 3, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 3, 3, 4, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    {[0]= 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
}
local miniMapScale = 6
local mapScale = 256
screenWidth = 667 --diff
screenHeight = 375
local stripWidth = 2;
local stripHeight = 2;
local fov = 60 * math.pi / 180;
local numRays = math.ceil(screenWidth / stripWidth);
local fovHalf = fov / 2;
local viewDist = (screenWidth / 2) / math.tan((fov / 2));
local twopi = math.pi * 2;
local fy0 = screenHeight/2
mapWidth = 32 --diff
mapHeight = 24
wallTextureMapping = { [0] = { [0] = 0, 1 }, { [0] = 0, 64 }, { [0] = 0, 128 }, { [0] = 0, 256 } }
floorTextureMapping = { [0] = { [0] = 0, 128 } }
textureWidth = 64
textureHeight = 64
imageData = "gfx/walls.png"
floorData = "gfx/eagle.png"
gaurdSpriteAtlas = "gfx/guard.png"
armorData = "gfx/armor.png"
lampData = "gfx/lamp.png"
image = love.graphics.newImage(imageData)
floorImage = love.graphics.newImage(floorData)
armorImage = love.graphics.newImage(armorData)
lampImage = love.graphics.newImage(lampData)

local function pdist(y)
    return viewDist * (screenHeight * 0.5) / (y - screenHeight * 0.5)
end

local function celda(x, y)
    local celda_fx = math.floor(x)
    local celda_fy = math.floor(y)

    if celda_fx > mapWidth-1 or celda_fy > mapHeight-1 then return 0 end
    if celda_fx < 0 or celda_fy < 0 then return 0 end
    return map[celda_fy][celda_fx]
end

local function drawHero()
    love.graphics.setColor(255, 255, 0)
    love.graphics.rectangle("fill",
        player.x * miniMapScale - 2,
        player.y * miniMapScale - 2,
        miniMapScale * 0.5, miniMapScale * 0.5)
    love.graphics.line(player.x * miniMapScale, player.y * miniMapScale,
        (player.x + math.cos(player.rot) * 4) * miniMapScale,
        (player.y + math.sin(player.rot) * 4) * miniMapScale);
end

local function drawMiniMap()
    local wall
    for x = 0, mapWidth-1 do
        for y = 0, mapHeight-1 do
            wall = celda(x, y)

            if (wall > 0) then
                love.graphics.setColor(0, 0, 0)
                love.graphics.rectangle("fill",
                    x * miniMapScale,
                    y * miniMapScale,
                    miniMapScale, miniMapScale)
            end
        end
    end
end

function love.load()
    love.graphics.setBackgroundColor(128, 128, 128)
end

local function floorCasting()
    for i = 0, numRays - 1, 1 do
        local vds = viewDist * viewDist
        local rayScreenPos = (-numRays / 2 + i) * stripWidth;
        local rayViewDist = math.sqrt((rayScreenPos *
                rayScreenPos) + vds);
        local rayAngle = math.asin(rayScreenPos / rayViewDist);
        local ang = player.rot + rayAngle
        castVerticalFloorRay(i, ang)
    end
end

function castVerticalFloorRay(i, angulo)
    angulo = angulo % twopi
    if angulo < 0 then
        angulo = angulo + twopi
    end

    for y = screenHeight, fy0, -0.5 do
--        print(fy0,screenHeight,y)
        local cos_of_rayangle = math.cos(angulo - player.rot)
--        if cos_of_rayangle == 0 then cos_of_rayangle = 0.0001 end
        local straightDist = pdist(y)
        local dist = (straightDist / cos_of_rayangle) / mapScale
        local px = player.x + math.cos(angulo) * dist
        local py = player.y + math.sin(angulo) * dist

--        if pcall(celda(px, py))
--            then
        -- if celda value is wrong walls wont render
        local fx = math.ceil(px)
        local fy = math.ceil(py)

        if fx > mapWidth-1 or fy > mapHeight-1
        then
            break
        end
        if fx < 0 or fy < 0 then
            break
        end

--        local player_pos_height =
        local piso = map[fy][fx]
--        if piso ~= 0 then
--            print(piso)
--        end

--         do current height check
        if piso > 0 then
            local height = round(viewDist / (dist))
            local xx = (i * stripWidth)
            local yy = round((screenHeight - height) / 2)
            love.graphics.rectangle("fill", xx, yy, stripWidth, height)
            drawRay(fx,fy)
            y = y + height
            break
        end
    end
end




function love.draw()
        floorCasting()
    	drawMiniMap()
    	drawHero()
end

function love.keypressed(key)
    if key == "up" then
        player.speed = 1;
        return;
    end
    if key == "down" then
        player.speed = -1;
        return;
    end
    if key == "left" then
        player.dir = -1;
        return;
    end
    if key == "right" then
        player.dir = 1;
        return;
    end
end

function love.keyreleased(key)
    if key == "up" then
        player.speed = 0;
        return
    end
    if key == "down" then
        player.speed = 0;
        return
    end
    if key == "left" then
        player.dir = 0;
        return
    end
    if key == "right" then
        player.dir = 0;
        return
    end
end



local function isBlocking(x, y)
    if(celda(x,y) > 0)
        then
        return true
    end

    return false
end

local function move(dt)
    local moveStep = player.speed * player.moveSpeed * dt; -- player will move this far along the current direction vector
    player.rot = player.rot + player.dir * dt * player.rotSpeed * 3.1415169 / 180; -- add rotation if player is rotating (player.dir != 0)
    local newX = player.x + math.cos(player.rot) * moveStep; -- calculate new player position with simple trigonometry

    if not (isBlocking(newX, player.y)) then
        player.x = newX;
    end

    local newY = player.y + math.sin(player.rot) * moveStep;
    if not (isBlocking(player.x, newY)) then
        player.y = newY;
    end
end

function love.update(dt)
    move(dt)
end

round = function(num)
    return math.floor(num + .5)
end

function drawRay(rayX, rayY)

    love.graphics.setColor(255,255,255)
    love.graphics.line(player.x * miniMapScale,
        player.y * miniMapScale,
        rayX * miniMapScale,
        rayY * miniMapScale)
end