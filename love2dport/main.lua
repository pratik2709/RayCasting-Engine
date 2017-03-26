debug = true

function love.load(arg)
    require "initialize"
    require "minimap"
    require "player"
end

function love.update(dt)
    drawMiniMap()
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
--    love.graphics.setColor(255, 0, 0)
--    love.graphics.rectangle( "fill", 0, 0, 100, 100 )
--    love.graphics.print(pi, 200, 200)
    drawMiniMap()
    updateMiniMap()
end
