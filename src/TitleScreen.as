package  
{
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxExplode;
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.*;
	/**
	 * ...
	 * @author Alec Day
	 */
	
	
	public class TitleScreen extends FlxState
	{
		//Load Assets
		[Embed(source = "assets/titleScreenCard.png")] private var tsc:Class;
		[Embed(source = "assets/StartButton.png")] private var sbutton:Class;
		
		//Assign Assets
		private var bgImage:FlxSprite = new FlxSprite(0, 0, tsc);
		private var startButton:FlxExtendedSprite;
		
		public function TitleScreen() 
		{
			if (FlxG.getPlugin(FlxMouseControl) == null)
			{
				FlxG.addPlugin(new FlxMouseControl);
				
			}
		}
		
		override public function create():void
		{
			add(bgImage);
			
			startButton = new FlxExtendedSprite(100, 350);
			startButton.loadGraphic(sbutton, false, false, 180, 90);
			startButton.enableMouseClicks(false, true, 0);
			startButton.mousePressedCallback = gameStart;
			add(startButton);
			
			
			//Fade it in, mang!
			FlxG.flash(0x00000000, 1, null, false);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function gameStart(a:FlxExtendedSprite, b:uint, c:uint):void
		{
			FlxG.switchState(new LevelZero);
		}
	}

}