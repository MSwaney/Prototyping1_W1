//------------------------------------------------------------------------------------------------ 
// Author: Matthew Swaney
// Date: 01-10-2014
// Credit: Christopher Maxwell 
// Credit: https://dl.dropbox.com/s/nfect75ubi7ikb7/FSGDnBS_PT1_W1_01_HUD.wmv?&dl=1
// Credit: https://dl.dropbox.com/s/44f6k13evo4gl0h/FSGDnBS_PT1_W1_02_HUD_DrawText.wmv?&dl=1
// Credit: https://dl.dropbox.com/s/9xpir4kvkh4rjm4/FSGDnBS_PT1_W1_03_HUD_DrawTile.wmv?&dl=1
// Credit: https://dl.dropbox.com/s/umu7fnx224i8lsd/FSGDnBS_PT1_W1_04_GameType_Timer.wmv?&dl=1
// Credit: UDN
// Credit: https://udn.epicgames.com/Three/HUDTechnicalGuide.html
// 
// Purpose: Create a custom HUD for the week 1 Assignment. 
//------------------------------------------------------------------------------------------------ 
class MS_HUD extends HUD;

var Font m_font;
var Texture2D m_texture;

//------------------------------------------------------------------------------------------------ 
function DrawHUD()
{
	super.DrawHUD();

	//drawStars();
	drawScore();
	drawMyText("Whoooo wheee! Let's kick some names and takes some.....wait.");
	myTexture(850, 15);
	DrawTimers();
}

//------------------------------------------------------------------------------------------------
function drawMyText(string theString)
{
	local float textSizeX;
	local float textSizeY;
	local WorldInfo rWorldInfo;
	local MS_GameType rGame;

	rWorldInfo = class'WorldInfo'.static.GetWorldInfo();
	if( rWorldInfo != none )
	{
		rGame = MS_GameType( rWorldInfo.Game );
		if(rGame != none )
		{
			if(rGame.m_playTimer < 5)
			{
				Canvas.Font = m_font;
				Canvas.TextSize(theString, textSizeX, textSizeY, 0.5, 0.5);
	
				Canvas.SetPos((Canvas.SizeX / 2) - (textSizeX / 2), (Canvas.SizeY / 2) - (textSizeY / 2));
				Canvas.SetDrawColor( 255, 255, 0);
				Canvas.DrawText(theString, , 0.5, 0.5);
			}
		}
	}
}

//------------------------------------------------------------------------------------------------ 
event PostRender()
{
	super.PostRender();
}

//------------------------------------------------------------------------------------------------ 
/*function drawStars()
{
	local MS_GameType rGame;
	local int nStars;

	rGame = MS_GameType(WorldInfo.Game);
	if(rGame != none)
	{
		nStars = rGame.nStars;
	}

	Canvas.SetPos(10, 10);
	Canvas.SetDrawColor(255, 0, 0);
	Canvas.DrawText("We have " @ nStars @ " stars!");
}*/

//------------------------------------------------------------------------------------------------ 
function drawScore()
{
	local MS_GameType rGame;

	rGame = MS_GameType(WorldInfo.Game);
	if(rGame != none)
	{	
		Canvas.SetPos(15, 65);
		Canvas.SetDrawColor(65, 105, 225);
		Canvas.DrawText("Score: " @ rGame.nScore);
		Canvas.Font = m_font;
	}


}
//------------------------------------------------------------------------------------------------ 
function myTexture(float x, float y)
{
	Canvas.SetPos(x , y);
	Canvas.SetDrawColor(255, 255, 255);
	Canvas.DrawTile(m_texture, m_texture.SizeX / 4, m_texture.SizeY / 4, 0, 0, m_texture.SizeX, m_texture.SizeY);
}

// Draw the Game Timer and Play Timer to the HUD-------------------------------------------
function DrawTimers()
{
	local WorldInfo rWorldInfo;
	local MS_GameType rGame;
	local string rText;

	rWorldInfo = class'WorldInfo'.static.GetWorldInfo();
	if( rWorldInfo != none )
	{
		rGame = MS_GameType( rWorldInfo.Game );
		if(rGame != none )
		{
			// Play Timer
			rText = "Play Time: " @ rGame.m_playTimer;
			rText = Left(rText, InStr(rText, ".") + 2);
			Canvas.SetPos( 15, 15);
			Canvas.Font = m_font;
			Canvas.SetDrawColor(65, 105, 225);
			Canvas.DrawText( rText, , 0.5, 0.5);

			// Game Timer
			rText = "GameTimer: " @ rGame.m_gameTimer;
			rText = Left(rText, InStr(rText, ".") + 2);
			Canvas.SetPos( 15, 40);
			Canvas.Font = m_font;
			if( rGame.m_gameTimer < 5)
			{
				Canvas.SetDrawColor(255, 0, 0);
			} 
			else
			{
				Canvas.SetDrawColor(65, 105, 225);
			}
			Canvas.DrawText( rText, , 0.5, 0.5);
		}
	}
}
//------------------------------------------------------------------------------------------------
DefaultProperties
{
	m_font = Font'UI_Fonts.Fonts.UI_Fonts_Positec36'
	m_texture = Texture2D'UDKHUD.ut3_minimap_compass'
}
