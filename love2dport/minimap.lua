function drawMiniMap()
    for y = 0, mapHeight-1, 1
    do
        for x = 0, mapWidth-1, 1
        do
            local wall = map[y][x]
            if wall > 0 then
                local xs = x * miniMapScale
                local ys = y * miniMapScale
                love.graphics.setColor(153, 0, 0)
                love.graphics.rectangle( "fill", xs, ys, miniMapScale, miniMapScale )
            end
        end
    end
end

function updateMiniMap()
    love.graphics.setColor(255, 255, 255)
    love.graphics.line(player.x * miniMapScale,
        player.y * miniMapScale,
        (player.x + math.cos(player.rot) * 4) * miniMapScale,
        (player.y + math.sin(player.rot) * 4) * miniMapScale)
end

-- todo: check if width comes first or height and fix floor map
function drawFloorMiniMap()
	local wall
	for x=0,mapWidth-1, 1 do
		for y=0,mapHeight-1, 1 do
			wall=celda(x,y)
			if (wall > 0)  then
				love.graphics.setColor( wall,wall,wall)
				love.graphics.rectangle( "fill",
					x * miniMapScale,
					y * miniMapScale,
					miniMapScale,miniMapScale
				)
			end
		end
	end
end