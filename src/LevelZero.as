package  
{
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.BlurFX;
	import objects.Dragon;
	import org.flixel.FlxState;
	import org.flixel.*;
	/**
	 * ...
	 * @author Alec Day
	 */
	public class LevelZero extends FlxState
	{
		[Embed(source = "levels/mapCSV_LZ_Map.csv", mimeType = "application/octet-stream")] private var Level:Class;
		[Embed(source = "assets/betatiles.png")] private var Tiles:Class;
		[Embed(source = "assets/ink.png")] private var inkFX:Class;
		
		private var stageset:FlxTilemap = new FlxTilemap();
		
		//Player
		private var player:Dragon = new Dragon(190, 20);
		private var ink:FlxSprite = new FlxSprite(190, 20);
		
		//FX
		private var blur:BlurFX;
		private var blurEffect:FlxSprite;
		
		
		
		public function LevelZero() 
		{
			
		}
		
		override public function create():void
		{
			//	Test specific
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			ink.loadGraphic(inkFX, false, true, 13, 16);
			FlxG.bgColor = FlxG.WHITE;
			stageset.loadMap(new Level, Tiles, 90, 90);
			stageset.x = 15;
			add(stageset);
			
			blur = FlxSpecialFX.blur();
			
			blurEffect = blur.create(FlxG.width, FlxG.height, 2, 2, 2);
			blur.addSprite(ink);
			
			add(blurEffect);
			add(ink);
			add(player);
			
			blur.start(0);
		}
		
		override public function update():void
		{
			super.update();
			ink.scale.x = player.inkLevel / 25;
			ink.scale.y = player.inkLevel / 25;
			
			if (!player.isTouching(FlxObject.ANY))
			{
				ink.x = player.x + (85/2);
				ink.y = player.y + (57 / 2);
			}
			
			FlxG.collide(player, stageset);
		}
	}

}