debug = true
-- ~/projects/raycaster-engine/love.app/Contents/MacOS/love ~/projects/raycaster-engine/love2dport/


function love.load(arg)
    joysticks = love.joystick.getJoysticks()
    joystick = joysticks[#joysticks]

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

       if joystick then
          axis1, axis2, axis3 = joystick:getAxes()
            love.graphics.print( "test", 0, 0)
--          position.x = position.x + axis1 * speed
--           position.y = position.y + axis2 * speed
           local bt
           if axis2 > 0
               then
               bt = "left"
           else
               bt = "right"
           end
           if axis3 > 0
               then
               bt = "down"
           else
               bt = "up"
           end

            if bt == "left" then
                player.dir = -1;
            end
            --right
            if bt == "right" then
                player.dir = 1;
            end
            --up
            if bt == "up" then
                player.speed = 1;
            end
            --down
            if bt == "down" then
                player.speed = -1;
            end

      end

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
    love.graphics.print( bt, 0, 40)
    if joystick then
    love.graphics.print( axis1, 0, 0)
    love.graphics.print( axis2, 0, 10)
    love.graphics.print( axis3, 0, 20)
    end
--    local q = love.graphics.newQuad( 1, 128, 64, 64, image:getWidth(), image:getHeight() )
--    love.graphics.draw(image, q, 100, 100,0,10,10, 32,32)
--    love.graphics.draw(floorImage, 1280/4, 720/4, 0, 1,1, 32,32)

--    drawMiniMap()
--    updateMiniMap()
--    love.graphics.clear( )
    love.graphics.setBackgroundColor(128, 128, 128)
--    love.graphics.rectangle("fill", 0, 0, screenWidth, screenHeight )


    castRays()
--    love.graphics.setColor(255, 0, 0)
--    love.graphics.rectangle( "fill", 0, 0, 100, 100 )
--    love.graphics.print(pi, 200, 200)
--    updateMiniMap()
end
