debug = true
-- ~/projects/raycaster-engine/love.app/Contents/MacOS/love ~/projects/raycaster-engine/love2dport/
function love.load(arg)
    require "initialize"
    require "minimap"
    require "player"
    require "raycast"
    imageData = "gfx/walls.png"
    floorData = "gfx/eagle.png"
    image = love.graphics.newImage( imageData )
    floorImage = love.graphics.newImage( floorData )

end

function love.update(dt)
    if not love.keyboard.isDown("left") and not love.keyboard.isDown("right") then
        player.speed = 0
    end

    if not love.keyboard.isDown("down") and not love.keyboard.isDown("up") then
        player.dir = 0
    end
    --left
    if love.keyboard.isDown("left") then
        player.dir = -1;
    end
    --right
    if love.keyboard.isDown("right") then
        player.dir = 1;
    end
    --up
    if love.keyboard.isDown("up") then
        player.speed = 1;
    end
    --down
    if love.keyboard.isDown("down") then
        player.speed = -1;
    end

    move()


end

function love.draw(dt)
--    local q = love.graphics.newQuad( 1, 128, 64, 64, image:getWidth(), image:getHeight() )
--    love.graphics.draw(image, q, 100, 100,0,10,10, 32,32)
--    love.graphics.draw(floorImage, 1280/4, 720/4, 0, 1,1, 32,32)

    drawMiniMap()
    updateMiniMap()
--    love.graphics.clear( )
    love.graphics.setBackgroundColor(128, 128, 128)
--    love.graphics.rectangle("fill", 0, 0, screenWidth, screenHeight )


    castRays()
--    love.graphics.setColor(255, 0, 0)
--    love.graphics.rectangle( "fill", 0, 0, 100, 100 )
--    love.graphics.print(pi, 200, 200)
--    updateMiniMap()
end
