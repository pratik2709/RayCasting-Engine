debug = true

function love.load(arg)
    require "initialize"
end

function love.update(dt)
end

function love.draw(dt)
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle( "fill", 0, 0, 100, 100 )
    love.graphics.print(pi, 200, 200)
end
