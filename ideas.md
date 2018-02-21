-- anything greater than 0 is a wall
-- need an enemy class
-- enemy player collision detection
-- enemy sprite rendering in the raycasting world
-- enemy sprite movement in the raycasting world
-- select a number in the matrix and instatiate the enemy on the map
-- more ghosts chasing player than pacman ?

-- Rendering specific::
-- billboard sprite direction wise rendering
-- hiding the sprite behind walls
-- animate the sprites according to the sprite sheet
-- need to render sprites fully - D


context.drawImage(img,sx,sy,swidth,sheight,x,y,width,height);

ctx.drawImage(sprite.spriteAtlasImage, tx, sprite.spriteOffsetY,
                              tw, sprite.spriteHeight, sx, y, sw, sy);

img = sprite.spriteAtlasImage


sx = tx = sprite.spriteOffsetX - (Optional. The x coordinate where to start clipping)


sy = sprite.spriteOffsetY - (Optional. The y coordinate where to start clipping)


swidth = tw = cumulativeTS = Math.floor(cumulativeDS * sprite.spriteWidth / sx)
- (Optional. The width of the clipped image)


sheight = sprite.spriteHeight - (Optional. The height of the clipped image)


x = sx = Math.floor(size * sprite.spriteScaleX);
- (The x coordinate where to place the image on the canvas)
var size = this._viewDist / (Math.cos(spriteAngle) * distSprite);


y = y = Math.floor(this._options.screenHeight / 2
                               - (0.55 + sprite.spriteScaleY - 1) * size);
(The y coordinate where to place the image on the canvas	)


width = x + cumulativeDS
cumulativeDS += stripWidth;
(Optional. The width of the image to use (stretch or reduce the image))


height = sy =  Math.ceil(sprite.spriteHeight * 0.01 * size)
                               + (0.45 + sprite.spriteScaleY - 1)  * size;
(Optional. The height of the image to use (stretch or reduce the image))
