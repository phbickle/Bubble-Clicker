package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_5_5_DrawTime extends SceneScript
{
	
 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		
	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        createRecycledActor(getActorType(10), 0, 0, Script.BACK);
        recycleActor(getLastCreatedActor());
        attachImageToHUD(new BitmapWrapper(new Bitmap(getImageForActor(getLastCreatedActor()))), Std.int(208), Std.int(1));
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        g.drawString("" + "Time:", 6, 1);
        g.drawString("" + Engine.engine.getGameAttribute("Time"), 64, 1);
        g.drawString("" + "Bubbles:", 310, 1);
        g.drawString("" + Engine.engine.getGameAttribute("Bubbles on Screen"), 400, 1);
        g.drawString("" + "/40", 424, 1);
        g.drawString("" + "High Score:", 6, 18);
        g.drawString("" + Engine.engine.getGameAttribute("High Score"), 124, 18);
        g.drawString("" + "Score:", 310, 18);
        g.drawString("" + Engine.engine.getGameAttribute("Score"), 424, 18);
        g.drawString("" + "x", 264, 24);
        g.drawString("" + Engine.engine.getGameAttribute("Number of Bombs"), 278, 22);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}