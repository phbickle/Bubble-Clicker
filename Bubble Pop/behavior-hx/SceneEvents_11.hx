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



class SceneEvents_11 extends SceneScript
{
	
public var _SpawnPointx:Float;

public var _SpawnPointY:Float;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Spawn Point x", "_SpawnPointx");
_SpawnPointx = 0.0;
nameMap.set("Spawn Point Y", "_SpawnPointY");
_SpawnPointY = 0.0;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        createRecycledActor(getActorType(32), _SpawnPointx, _SpawnPointY, Script.FRONT);
        recycleActor(getLastCreatedActor());
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        g.fillColor = Utils.getColorRGB(0,0,0);
        g.strokeSize = Std.int(2);
        getLastCreatedActor().setAnimation("" + ("" + "Animation 0"));
        g.drawRect(64, 16, ((getSceneWidth()) - ((getSceneWidth()) / 4)), ((getSceneHeight()) - ((getSceneHeight()) / 16)));
        attachImageToHUD(new BitmapWrapper(new Bitmap(getImageForActor(getLastCreatedActor()))), Std.int((((getSceneWidth()) - ((getSceneWidth()) / 2)) - (new BitmapWrapper(new Bitmap(getImageForActor(getLastCreatedActor()))).width/Engine.SCALE / 2))), Std.int(((getSceneHeight()) - (((getSceneHeight()) / 3) * 2))));
        g.fillColor = Utils.getColorRGB(0,0,0);
        g.strokeSize = Std.int(1);
        g.drawString("" + "Test", 10, 10);
}
});
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(getActor(3), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        switchScene(GameModel.get().scenes.get(10).getID(), createFadeOut(0, Utils.getColorRGB(0,0,0)), createFadeIn(0, Utils.getColorRGB(0,0,0)));
}
});
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(getActor(2), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        switchScene(GameModel.get().scenes.get(12).getID(), createFadeOut(0, Utils.getColorRGB(0,0,0)), createFadeIn(0, Utils.getColorRGB(0,0,0)));
}
});
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(getActor(4), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if((Engine.engine.getGameAttribute("Store Points") >= 5000))
{
            Engine.engine.setGameAttribute("Background Colout", "Heart");
            Engine.engine.setGameAttribute("Store Points", (Engine.engine.getGameAttribute("Store Points") - 5000));
            saveGame("mySave", function(success:Bool):Void {

});
}

}
});
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(getActor(1), function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        switchScene(GameModel.get().scenes.get(2).getID(), createFadeOut(0, Utils.getColorRGB(0,0,0)), createFadeIn(0, Utils.getColorRGB(0,0,0)));
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}