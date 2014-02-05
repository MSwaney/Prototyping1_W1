//------------------------------------------------------------------------------------------------ 
// Author: Matthew Swaney
// Date: 01-10-2014
// Credit: Eat3d
// Credit: https://www.dropbox.com/sh/s4gfr7ov60zgyr1/ermIY69AID/highwinds_eat3d_unrealscript_video_files
// 
// Purpose: Make the rocket launcher use the custom projectile for the week 1 Assignment. 
//------------------------------------------------------------------------------------------------ 
class MS_PlasmaRocket extends UTWeap_RocketLauncher_Content;

DefaultProperties
{
	WeaponProjectiles(0)=class'MS_Plasma'
	AmmoCount=18
}
