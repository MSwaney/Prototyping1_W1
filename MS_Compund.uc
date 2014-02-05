//------------------------------------------------------------------------------------------------ 
// Author: Matthew Swaney
// Date: 01-10-2014
// Credit: Eat3d
// Credit: https://www.dropbox.com/sh/s4gfr7ov60zgyr1/ermIY69AID/highwinds_eat3d_unrealscript_video_files
// 
// Purpose: Create a custom compund mesh for the week 1 Assignment. 
//------------------------------------------------------------------------------------------------ 
class MS_Compund extends StaticMeshActor
	placeable;

var(StaticMeshActor) const editconst StaticMeshComponent    StaticMeshComponent_Secondary;

DefaultProperties
{
	begin object Class=StaticMeshComponent Name=StaticMeshComponent1
		bAllowApproximateOcclusion=true
		bForceDirectLightMap=true
		bUsePrecomputedShadows=true
	end object
	StaticMeshComponent_Secondary=StaticMeshComponent1
	Components.Add(StaticMeshComponent1)
}