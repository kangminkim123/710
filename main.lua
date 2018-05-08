-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- created on kangmin
-- created by may 8
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
 
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5

local playerBullets = {} -- Table that holds the players Bullets


local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 200
dPad.alpha = 0.50
dPad.id = "d-pad"

local jumpButton = display.newImage( "./assets/sprites/jumpButton.png" )
jumpButton.x = display.contentWidth - 80
jumpButton.y = display.contentHeight - 80
jumpButton.id = "jump button"
jumpButton.alpha = 0.5

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 200
rightArrow.id = "right arrow"


local sheetOptionsIdle =
{
    width = 290,
    height = 500,
    numFrames = 10
}
local sheetIdleninjaGirl = graphics.newImageSheet( "./assets/spritesheets/ninjaGirlIdle.png", sheetOptionsIdle )

local sheetOptionsWalk =
{
    width = 376,
    height = 520,
    numFrames = 10
}
local sheetWalkingninjaGirl = graphics.newImageSheet( "./assets/spritesheets/ninjaWalking.png", sheetOptionsWalk )


-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleninjaGirl
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 1000,
        loopCount = 1,
        sheet = sheetWalkingninjaGirl
    }
}

local ninjaGirl = display.newSprite( sheetIdleninjaGirl, sequence_data )
ninjaGirl.x = centerX
ninjaGirl.y = centerY
ninjaGirl:setSequence( "idle" )
ninjaGirl:play()


function jumpButton:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( ninjaGirl, { 
            x = 150, 
            y = 0, 
            time = 1000 
            } )
        ninjaGirl:setSequence( "walk" )
        ninjaGirl:play()
    end

    return true
end

-- rest to idle 
local function resetToIdle (event)
    if event.phase == "ended" then
        ninjaGirl:setSequence("idle")
        ninjaGirl:play()
    end
end


jumpButton:addEventListener( "touch", jumpButton )
ninjaGirl:addEventListener("sprite", resetToIdle)

local sheetOptionsIdle =
{
    width = 232,
    height = 439,
    numFrames = 10
}
local sheetIdleninjaBoy = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyIdle.png", sheetOptionsIdle )

local sheetOptionsWalk =
{
    width = 360,
    height = 458,
    numFrames = 10
}
local sheetWalkingninjaBoy = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyWalking.png", sheetOptionsWalk )


-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleninjaBoy
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 1000,
        loopCount = 1,
        sheet = sheetWalkingninjaBoy
    }
}

local ninjaBoy = display.newSprite( sheetIdleninjaBoy, sequence_data )
ninjaBoy.x = centerX - 100
ninjaBoy.y = centerY + 500
ninjaBoy:setSequence( "idle" )
ninjaBoy:play()

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( ninjaBoy, { 
            x = 150, 
            y = 0, 
            time = 1000 
            } )
        ninjaBoy:setSequence( "walk" )
        ninjaBoy:play()
    end

    return true
end

-- rest to idle 
local function resetToIdle (event)
    if event.phase == "ended" then
        ninjaBoy:setSequence("idle")
        ninjaBoy:play()
    end
end


rightArrow:addEventListener( "touch", rightArrow )
ninjaBoy:addEventListener("sprite", resetToIdle)