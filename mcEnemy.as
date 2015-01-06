package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Isabel
	 */
	public class mcEnemy extends MovieClip 
	{
		private var aDirection:String;
		public function mcEnemy() 
		{
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		
		private function onAdd(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdd);
			init();
		}
		
		private function init():void 
		{
			var nEnemies:Number = 3;
			var nRandom:Number = randomNumber(1, nEnemies);
			this.gotoAndStop(nRandom);
			setupStartPostition();
		}
		
		private function setupStartPostition():void 
		{
			var leftOrRight:Number = randomNumber(1, 2);
			if (leftOrRight == 1)
			{
				this.x = - (this.width / 2);
				aDirection = "R"
			} else
			{
				this.x = stage.stageWidth + (this.width / 2);
				aDirection = "L"
			}
		}
		
		function randomNumber(low:Number = 0, high:Number = 1):Number
		{
			return Math.floor(Math.random()) * (1 + high - low) + low;
		}
		
	}

}