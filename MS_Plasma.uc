//------------------------------------------------------------------------------------------------ 
// Author: Matthew Swaney
// Date: 01-10-2014
// Credit: Eat3d
// Credit: https://www.dropbox.com/sh/s4gfr7ov60zgyr1/ermIY69AID/highwinds_eat3d_unrealscript_video_files
// 
// Purpose: Create a custom projectile for the week 1 Assignment. 
//------------------------------------------------------------------------------------------------ 
class MS_Plasma extends UTProj_Rocket;

// Projectile Bounces off of surfaces------------------------------------------------------- 
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (Other != Instigator)
	{
		Other.TakeDamage(Damage,InstigatorController,HitLocation,MomentumTransfer * Normal(Velocity), MyDamageType,, self);
		Shutdown();
	}
}

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	Velocity = MirrorVectorByNormal(Velocity, HitNormal);
	SetRotation(Rotator(Velocity));
}


DefaultProperties
{
	ProjFlightTemplate=ParticleSystem'WP_ShockRifle.Particles.P_WP_ShockRifle_Ball'
	ProjExplosionTemplate=ParticleSystem'WP_ShockRifle.Particles.P_WP_ShockRifle_Ball_Impact'
	ProjectileLightClass=class'UTGame.UTShockBallLight'
	ExplosionSound=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_ComboExplosionCue'

	Speed=1350.0    // Projectile Speed
	MaxSpeed=1350.0 
	DrawScale=0.5   // Projectile Size
}
