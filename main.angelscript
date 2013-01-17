/*
 Hello world!
*/

#include "eth_util.angelscript"
#include "Collide.angelscript"

void main()
{
	LoadScene("scenes/Level1.esc", "onSceneCreated", "onSceneUpdate");

	// Prefer setting window properties in the app.enml file
	// SetWindowProperties("Ethanon Engine", 1024, 768, true, true, PF32BIT);
}


void ETHCallback_Spark(ETHEntity@ thisEntity)
{


	ETHInput@ input = GetInputHandle();
	float speed = UnitsPerSecond(120.0f);
	SetCameraPos(thisEntity.GetPositionXY() - (GetScreenSize() / 2.0f));
	vector2 moveDirection(0, 0);


		// move the character
	thisEntity.AddToPositionXY(getKeyboardDirections());
	moveDirection = getKeyboardDirections();



	if (CollideStatic(thisEntity))
	{
		thisEntity.AddToPositionXY(moveDirection *-0.5f);
	}

		//moveDirection = getKeyboardDirections()
	    

/*  Old Movement Style
	if (input.KeyDown(K_RIGHT))
		thisEntity.AddToPositionXY(vector2(1.0f, 0.0f) * speed);

	if (input.KeyDown(K_LEFT))
		thisEntity.AddToPositionXY(vector2(-1.0f, 0.0f) * speed);

	if (input.KeyDown(K_UP))
		thisEntity.AddToPositionXY(vector2(0.0f,-4.0f) * speed);

	
*/
}


//New Movement Style



// Compute character movement direction from the keyboard
vector2 getKeyboardDirections()
{
	ETHInput @input = GetInputHandle();
	vector2 dir(0, 0);

	if (input.KeyDown(K_LEFT))
		dir.x +=-5;

	if (input.KeyDown(K_RIGHT))
		dir.x += 5;

	if (input.KeyDown(K_UP))
		dir.y +=-5;

	if (input.KeyDown(K_DOWN))
		dir.y += 5;

	return dir;
}
