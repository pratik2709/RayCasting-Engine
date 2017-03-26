function drawMiniMap()
    for y = 1, mapHeight, 1
    do
        for x = 1, mapWidth, 1
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

