debug = true
-- ~/projects/raycaster-engine/love.app/Contents/MacOS/love ~/projects/raycaster-engine/love2dport/


function love.load(arg)
    joysticks = love.joystick.getJoysticks()
    joystick = joysticks[#joysticks]

    require "initialize"
    require "utilities"
    require "minimap"
    require "player"
    require "walls"
    require "raycast"
    require "spriteRenderUtils"
    require "sprite"
    require "floor"
    require "enemy"
    require "stack"

    imageData = "gfx/walls.png"
    floorData = "gfx/eagle.png"
    gaurdSpriteAtlas = "gfx/guard.png"
    armorData = "gfx/armor.png"
    lampData = "gfx/lamp.png"
    image = love.graphics.newImage( imageData )
    floorImage = love.graphics.newImage( floorData )
    armorImage = love.graphics.newImage( gaurdSpriteAtlas )
    lampImage = love.graphics.newImage( lampData )
    addSprite({
        id          ="dining_table",
        x           = 10,
        y           = 7,
        spriteAtlas = "tablechairs.png",
        isMoving=false,
        drawOnMiniMap=false,
        miniMapColor="red",
        dir=0,
        rot=0,
        rotSpeed = 3 * pi / 180,
        speed=0,
        strafe=0,
        moveSpeed=0.05,
        spriteOffsetX=0,
        spriteOffsetY=0,
        spriteWidth=64,
        spriteHeight=64,
        spriteScaleX=16,
        spriteScaleY=10,
        hitlist={},
        playerCrossHair,
        spriteAtlasImage
    });
    createFloorMap()
--    print_r(_sprites)



end

function love.update(dt)

       if joystick then
          axis1, axis2, axis3 = joystick:getAxes()

--          position.x = position.x + axis1 * speed
--           position.y = position.y + axis2 * speed
           if axis2 > 0
               then
               bt = "left"
               player.dir = 1;
           else
               bt = "right"
               player.dir = -1;
           end
           if axis3 > 0
               then
               bt = "down"
               player.speed = 1*dt;
           else
               bt = "up"
               player.speed = 1*dt;
           end

           if axis2 == 0
            then player.dir = 0
            player.speed = 0;
          end


          move(dt)

            -- if bt == "left" then
            --     player.dir = -1;
            -- end
            -- --right
            -- if bt == "right" then
            --     player.dir = 1;
            -- end
            -- --up
            -- if bt == "up" then
            --     player.speed = 1;
            -- end
            -- --down
            -- if bt == "down" then
            --     player.speed = -1;
            -- end
       else

    if not love.keyboard.isDown("left") and not love.keyboard.isDown("right") then
        player.speed = 0
    end

    if not love.keyboard.isDown("down") and not love.keyboard.isDown("up") then
        player.dir = 0
    end
    --left
    if love.keyboard.isDown("left") then
        player.dir = -1;
        -- player is rotating so the plane needs to rotate ?
--        manipulate_player_plane()
    end
    --right
    if love.keyboard.isDown("right") then
        player.dir = 1;
--        manipulate_player_plane()
    end
    --up
    if love.keyboard.isDown("up") then
        player.speed = 1;
    end
    --down
    if love.keyboard.isDown("down") then
        player.speed = -1;
    end

           move(dt)
      end

    -- update the sprite position
--    movement()

end

function love.draw(dt)

    if joystick then
        love.graphics.print( bt, 0, 40)
    love.graphics.print( axis1, 0, 0)
    love.graphics.print( axis2, 0, 10)
    love.graphics.print( axis3, 0, 20)
    end
--    local q = love.graphics.newQuad( 1, 128, 64, 64, image:getWidth(), image:getHeight() )
--    love.graphics.draw(image, q, 100, 100,0,10,10, 32,32)
--    love.graphics.draw(floorImage, 1280/4, 720/4, 0, 1,1, 32,32)

--    drawMiniMap()
--        drawFloorMiniMap()
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



