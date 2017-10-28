function movement()
    -- consider first sprite as enemy and make it randomly move + detect collisions
    if not isBlocking(_sprites[1].x, _sprites[1].y) then
        _sprites[1].x = _sprites[1].x + 0.1
    end

end