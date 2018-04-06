local player = {
    x = 5,
    y = 5,
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
local mapScale = 512
screenWidth = 667 --diff
screenHeight = 375
local stripWidth = 2;
local stripHeight = 2;
local fov = 60 * math.pi / 180;
local numRays = math.ceil(screenWidth / stripWidth);
local fovHalf = fov / 2;
local viewDist = (screenWidth / 2) / math.tan((fov / 2));
local twoPI = math.pi * 2;
local fy0 = screenHeight * 0.5
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
    fx = math.floor(x)
    fy = math.floor(y)

    if fx > mapWidth-1 or fy > mapHeight-1 then return 0 end
    if fx < 0 or fy < 0 then return 0 end
    return map[fy][fx]
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
    --valor = 1
    --	for i=0,10 do
    --		map[i]={}
    --		for j=0,10 do
    --			valor =math.random(0,255)
    --			map[i][j]= valor
    --			--valor = 1-valor
    --		end
    --	end

    -- for i=0,10 do
    -- for j=0,10 do
    -- print(i,j,celda(i,j))
    -- end
    -- end
end

local function castVerticalFloorRay(i, angulo)
    local index = 0
    for y = screenHeight, fy0, -2 do
        local cos_of_rayangle = math.cos(angulo - player.rot)
        if cos_of_rayangle == 0 then cos_of_rayangle = 0.0001 end
        local straightDist = pdist(y)
        local dist = (straightDist / cos_of_rayangle) / mapScale
        local px = player.x + math.cos(angulo) * dist
        local py = player.y + math.sin(angulo) * dist

--        if pcall(celda(px, py))
--            then
        local piso = celda(px, py)
--        else
--                local fx = math.floor(px)
--                local fy = math.floor(py)
--                print(fx,fy)
--        end


        index = index + 1
        --        print(piso)
        if piso > 0 then
--            straightDist = math.sqrt(straightDist)
            dist = dist * math.cos(player.rot - angulo)
            -- actual wall height is considered 1
            local height = round(viewDist / (dist))
            --        print(height)
            local xx = (i * stripWidth)
            local yy = round((screenHeight - height) / 2)
            love.graphics.setColor(0, 0, 255)

            if (piso == 1) then
                textureoffset = wallTextureMapping[0]
            elseif (piso == 2) then
                textureoffset = wallTextureMapping[1]
            elseif (piso == 3) then
                textureoffset = wallTextureMapping[2]
            elseif (piso == 4) then
                textureoffset = wallTextureMapping[3]
            else
                textureoffset = wallTextureMapping[0]
            end

            local texturex = px % 1
            texturex = 1 - texturex
            love.graphics.rectangle("fill", xx, yy, stripWidth, height)

--            love.graphics.setColor(255, 255, 255)
--            local q = love.graphics.newQuad(textureoffset[0] + (texturex * textureWidth), textureoffset[1], 64, 64, image:getDimensions())
--            love.graphics.draw(image, q, xx, yy, 0, (stripWidth) , height )
        end
    end
end

local function floorCasting()
    for i = 0, numRays - 1 do
        local rayScreenPos = (-numRays / 2 + i) * stripWidth;
        local rayViewDist = math.sqrt(rayScreenPos * rayScreenPos + viewDist * viewDist);
        local rayAngle = math.asin(rayScreenPos / rayViewDist);
        castVerticalFloorRay(i, player.rot + rayAngle)
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