package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Isabel
	 */
	public class firstGame extends MovieClip 
	{
		public var mcPlayer:MovieClip;
		private var leftKeyIsDown:Boolean;
		private var rightKeyIsDown:Boolean;
		private var aMissileArray:Array;
		
		
		public function firstGame()
		{
			aMissileArray = new Array();
			//listen for keys pressed and released
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			//just linking to ANY key being pressed and released, not just the arrow keys
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function gameLoop(e:Event):void
		{
			playerControl();
			clampPlayerToStage();
			checkMissileOffScreen();
		}
		
		private function checkMissileOffScreen():void 
		{
			for (var i:int = 0; i < aMissileArray.length; i++)
			{
				var currentMissile:mcMissile = aMissileArray[i];
				if (currentMissile < 0)
				{
					aMissileArray.splice (i, 1);
					currentMissile.destroyMissile();
				}
			}
		}
		
		private function clampPlayerToStage():void 
		{
			if (mcPlayer.x < 0+mcPlayer.width/2)
			{
				mcPlayer.x = 0+mcPlayer.width/2;
			}
			
			if (mcPlayer.x > stage.stageWidth - mcPlayer.width/2)
			{
				mcPlayer.x > stage.stageWidth - mcPlayer.width / 2;
			}
		}
		
		private function playerControl():void 
		{
			if (leftKeyIsDown == true)
			{
				mcPlayer.x -= 5;
			}
			
			if (rightKeyIsDown == true)
			{
				mcPlayer.x += 5;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			var leftKeyIsDown:Boolean = false;
			//For left arrow key released
			if (e.keyCode == 37)
			{
				leftKeyIsDown = false;
			}
			//For right arrow key released
			if (e.keyCode == 39)
			{
				rightKeyIsDown = false;
			}
			//For spacebar is released
			if (e.keyCode == 32)
			{
				fireMissile();
			}
		}
		
		private function fireMissile():void 
		{
			var newMissile:mcMissile = new mcMissile;
			stage.addChild(newMissile);
			newMissile.x = mcPlayer.x;
			newMissile.y = mcPlayer.y;
			aMissileArray.push(newMissile);
			trace(aMissileArray.length);
		}
		private function keyUp(e:KeyboardEvent):void 
		{
			//For left arrow key pressed
			if (e.keyCode == 37)
			{
				leftKeyIsDown = true;
			}
			//For right arrow key pressed
			if (e.keyCode == 39)
			{
				rightKeyIsDown = true;
			}
			//For spacebar is pressed
			if (e.keyCode == 32)
			{
				spacebarIsDown = true;
			}
		}
		
	}

}