function _init()
    t = 0
    ship = { speed = 1,
        sp = 1,
        x = 60,
        y = 60,
        h = 3,
        p = 0,
        t = 0,
        immortality = true,
        box = {x1=0, y1=0, x2=7, y2=7}
    }
    bullets = {}
    enemies = {}
    for i=1,10 do
        add(enemies, {
            sp = 17,
            m_x = 10*i,
            m_y = 2*i,
            x = -32, --why negative ?
            y = -32,
            r = 12,
            box = {x1=0, y1=0, x2=7, y2=7}
        })
    end
    start()
end

function start()
    _update = update_game
    _draw = draw_game
end

function game_over()
    _update = update_over
    _draw = draw_over
end

function update_over()
end

function draw_over()
    cls()
    print("game over")
end

function res_box(s)
    local box = {}
    box.x1 = s.box.x1 + s.x
    box.y1 = s.box.y1 + s.y
    box.x2 = s.box.x2 + s.x
    box.y2 = s.box.y2 + s.y
    return box
end

function collision(a, b)
    --todo
    local box_a = res_box(a)
    local box_b = res_box(b)

    if box_a.x1 > box_b.x2 or box_a.y1 > box_b.y2
        or box_b.x1 > box_a.x2 or box_b.y1 > box_a.y2
        then
        return false
    end

    return true
end


function fire()
    local b = {
        sp = 4, --use sprite 3 ?
        x = ship.x,
        y = ship.y,
        dx = 0,
        dy = -3,
        box = {x1=0, y1=0, x2=5, y2=5}
    }
    add(bullets, b)
end

function leftward()
    ship.x = ship.x - ship.speed
end

function rightward()
    ship.x = ship.x + ship.speed
end

function upward()
    ship.y = ship.y - ship.speed
end

function downward()
    ship.y = ship.y + ship.speed
end

function update_game()
    t = t + 1

    if ship.immortality
        then
        ship.t = ship.t + 1
        if ship.t >= 30
            then
            ship.immortality = false
            ship.t = 0
        end
    end

    for e in all(enemies)
    do
        -- why t/50 ??
        e.x = e.r*sin(t/50) + e.m_x
        e.y = e.r*cos(t/50) + e.m_y
        if collision(e, ship) and not ship.immortality
            then
            ship.immortality = true
            ship.h = ship.h - 1
            if ship.h <= 1
                then
                game_over()
            end

        end

    end

    for b in all(bullets)
    do
        b.x = b.x + b.dx
        b.y = b.y + b.dy
        if b.x < 0 or b.x > 128 or b.y < 0 or b.y > 128 then
            del(bullets, b)
        end
        for e in all(enemies)
            do
            if collision(b, e)
                then
                ship.p = ship.p + 1
                del(enemies, e)
            end
        end
    end


    if t % 8 < 4 then
        ship.sp = 2
    else
        ship.sp = 3
    end

    if btn(0) then
        leftward()
    end
    if btn(1) then
        rightward()
    end
    if btn(2) then
        upward()
    end
    if btn(3) then
        downward()
    end
    if btnp(4) then
        fire()
    end
end

function draw_game()
    cls()

    if not ship.immortality or t % 8 < 4 then
        spr(ship.sp, ship.x, ship.y)
    end

    for b in all(bullets)
    do
        print(#bullets)
        spr(b.sp, b.x, b.y)
    end

    for e in all(enemies)
        do
        spr(e.sp, e.x, e.y)
    end

    for i=1,4 do
        if i <= ship.h
            then
            spr(33, 80+6*i, 3) -- towards the left corner
        else
            spr(34, 80+6*i, 3)
        end
    end

    end

