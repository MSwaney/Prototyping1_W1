//------------------------------------------------------------------------------------------------ 
// Author: Matthew Swaney
// Date: 01-10-2014
// Credit: Christopher Maxwell 
// Credit: https://dl.dropbox.com/s/616u3txmr1wzi9e/FSGDnBS_PT1_W1_00_GameType.wmv?&dl=1
// Credit: UDN
// Credit: http://udn.epicgames.com/Three/GametypeTechnicalGuide.html
// 
// Purpose: Create a custom game type for the week 1 Assignment. 
//------------------------------------------------------------------------------------------------ 
class MS_GameType extends UTGame;

//------------------------------------------------------------------------------------------------ 
var int nScore;
//var int nPoints;
//var int nStars;
var float m_gameTimer;
var float m_playTimer;

//------------------------------------------------------------------------------------------------ 
function PostBeginPlay()
{
	super.PostBeginPlay();

	//nStars = 10;
	//SetTimer(1.0, true, nameof(decreaseStars));
}

//------------------------------------------------------------------------------------------------ 
function tick(float deltaTime)
{
	m_playTimer += deltaTime;

	m_gameTimer -= deltaTime;
	if(m_gameTimer < 0)
	{
		m_gameTimer = 0;
	}
}

//------------------------------------------------------------------------------------------------ 
/*function decreaseStars()
{
	nStars -= 1;

	if (nStars < 0)
	{
		// Set Stars to 0
		nStars = 0;
		// Turn off the timer
		SetTimer( 0.0, false, nameof(decreaseStars));
	}
}*/

//------------------------------------------------------------------------------------------------ 
DefaultProperties
{
	HUDType=class'Swaney_Matthew_W1_src.MS_HUD'

	// Disable the Scaleform (flash) hud in the UTGame. See: GenericPlayerInitialization
	bUseClassicHUD = true

	nScore = 99
	//nPoints = 0
	//nStars = 0

	// Initial time value
	m_gameTimer = 10;

	// Start with no weapon
	//DefaultInventory(0)=none
}
