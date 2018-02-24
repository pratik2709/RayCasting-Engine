function calculateWallRenderValues(dist, rayAngle, textureoffset, index, wallType)
    dist = math.sqrt(dist)
    dist = dist * math.cos(player.rot - rayAngle)
    -- actual wall height is considered 1
    local height = round(viewDist / (dist))
    local xx = index * stripWidth
    -- divide screenheight by half, and then go half of the wall distance
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

    return xx, yy, height, textureoffset, dist

end


function renderWalls(texturex, textureoffset, xx, yy, height)
    love.graphics.setColor(255,255,255)
    local q = love.graphics.newQuad( textureoffset[0]+(texturex*textureWidth), textureoffset[1], 64, 64, image:getDimensions())
    love.graphics.draw(image, q, xx, yy,0, stripWidth/64, height/64)
end
