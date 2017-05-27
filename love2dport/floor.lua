function renderFloor(height, yy, xx, xHit, yHit, dist, rayAngle)
    --         height is the height of the wall

        local fheight = (screenHeight - height)/2
        local foffset = yy + height

        --coordinates of floor tile pixel on the world
        local vx = (xHit - player.x)/dist
        local vy = (yHit - player.y)/dist

--        local fweight = (screenWidth/screenHeight)*((currentDist )/(dist ))

--         absolute bottom:  always remains the screenheight (experimented)
        local bottom = foffset + fheight
        local distplayer = 0.0
--        local fweight =
--         bottom always remains the screenheight (experimented)??


        for fy = 0, fheight - 1, 1 do

              local currentDist = bottom / (2 * (fy+foffset) - bottom)
--              local c = (bottom -(fy+foffset))
--              local currentDist1 = math.sqrt((dist*dist) + (c*c))
            -- gives a flying wall effect
--              local currentDist = viewDist * ((foffset+fy) - (fheight+height/2))
--            local act = currentDist/math.cos(rayAngle-fov/2)
            -- fix this distance
--            local act_dist = currentDist/math.cos(player.rot - rayAngle)
--            print(currentDist, currentDist1)
            --            love.graphics.line(screenWidth/2,0, 0, currentDist)
            local wx = (player.x) + vx*currentDist
            local wy = (player.y) + vy*currentDist

--
            local floorTextureX = ((wx*textureWidth)%textureWidth)
            local floorTextureY = ((wy*textureHeight)%textureHeight)
--            print(floorTextureX, floorTextureY)
--                ctx.moveTo(x, fy + foffset);
--                ctx.lineTo(x + stripWidth,fy + foffset);
--                ctx.lineTo(x + stripWidth,fy + foffset + 1);
--                ctx.lineTo(x ,fy + foffset + 1);
--            love.graphics.polygon('line', xx, fy + foffset, xx + stripWidth,fy + foffset, xx + stripWidth,fy + foffset + 1, xx ,fy + foffset + 1)
--            love.graphics.setColor(255,255,255)
            local qq = love.graphics.newQuad( floorTextureX, floorTextureY, 64, 64, floorImage:getDimensions())
            -- over here for some reason divided by 64 (lenght and width to scale) does not work
            -- need to investigate!
           -- https://love2d.org/forums/viewtopic.php?t=78470
            love.graphics.draw(floorImage, qq, xx, fy+foffset,0, stripWidth, 1)

            -- draw simple rectangles as a start
--            local ct = fheight - fy;
--            love.graphics.setColor(0, 255, ((fy+foffset)*0.5)%255)
--            love.graphics.rectangle( "line", xx, fy+foffset, stripWidth, 1 )
        end

end


function castVerticalFloorRay(x,angulo, dist, yy, height)
    local mapScale = 512
    local fheight = (screenHeight - height)/2
    local foffset = yy + height
	for y=foffset,screenHeight,2 do
		local cos_of_rayangle = math.cos(angulo-player.rot)
		if cos_of_rayangle ==0 then cos_of_rayangle =0.0001 end
		local dist = (pdist(y)/ cos_of_rayangle)/mapScale
		local px = player.x + math.cos(angulo) * dist
		local py = player.y + math.sin(angulo) * dist
		local piso = celda(px,py)
		if piso>0 then
--            print "over jere"
            love.graphics.setColor(255,255,255)
			love.graphics.setColor( piso,piso,piso)
				love.graphics.rectangle( "fill",
					x * stripWidth,
					y ,
					stripWidth,1
				)
		end
	end
end

function celda(x,y)
	fx =math.floor(x)
	fy=math.floor(y)
	if fx>10 or fy>10 then return 0 end
	if fx<0 or fy<0 then return 0 end
	return floor_map[fx][fy]
end

function pdist(y)
	return viewDist*(screenHeight*0.5)/(y-screenHeight*0.5)
end

function createFloorMap()
        for i=0,10 do
        floor_map[i]={}
        for j=0,10 do
            valor =math.random(0,255)
            floor_map[i][j]= valor
            --valor = 1-valor
        end
    end
end


