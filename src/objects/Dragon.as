package objects 
{
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.plugin.photonstorm.FX.BlurFX;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Alec Day
	 */
	public class Dragon extends FlxExtendedSprite
	{
		[Embed(source = "../assets/tidSprite.png")] private var spriteClass:Class;
		public var inkLevel:Number = 150.0;
		private var defaultScaleX:Number
		private var defaultScaleY:Number
		
		private var p1:FlxPoint;
		private var p2:FlxPoint;
		public function Dragon(x:uint, y:uint) 
		{
			super(x, y);
			defaultScaleX = scale.x;
			defaultScaleY = scale.y;
			
			if (FlxG.getPlugin(FlxMouseControl) == null)
			{
				FlxG.addPlugin(new FlxMouseControl);
				
			}
			
			loadRotatedGraphic(spriteClass, 360, -1, false, false);
			
			drag.x = 20;
			drag.y = 30;
			
			p1 = new FlxPoint(x, y);
			p2 = new FlxPoint(0, 0);

		}
		
		override public function update():void
		{
			super.update();
			p2.x = mouseX;
			p2.y = mouseY;
			if (inkLevel > 0)
			{
				enableMouseDrag(false, true, 255, null, null);
			}
			
			else
			{
				disableMouseDrag();
			}
			if (FlxMouseControl.isDragging)
			{
				FlxMouseControl.dragTarget.velocity.x = FlxMouseControl.speedX;
				FlxMouseControl.dragTarget.velocity.y = FlxMouseControl.speedY;
				
				/* Unstable Scaling Code for Brush Effect 
				scale.x += ((FlxMouseControl.speedX + FlxMouseControl.speedY)/2) * 0.01;
				scale.y -= ((FlxMouseControl.speedX + FlxMouseControl.speedY)/2) * 0.01;
				*/
				inkLevel -= 0.1;
			}
			
			if (!FlxMouseControl.isDragging)
			{
				scale.x = defaultScaleX;
				scale.y = defaultScaleY;
			}
			
			var Xdistance:Number = mouseX - x;
			var Ydistance:Number = mouseY - y;
			
			angle = FlxU.getAngle(p2, p1) + 90;
		}
		
	}

}