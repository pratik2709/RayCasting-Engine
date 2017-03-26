-- Configuration
function love.conf(t)
	t.title = "Raycasting port" -- The title of the window the game is in (string)
	t.version = "0.10.2"         -- The LÖVE version this game was made for (string)
	t.window.width = 320        -- we want our game to be long and thin.
	t.window.height = 240

	-- For Windows debugging
	t.console = true
end