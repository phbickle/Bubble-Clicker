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



class Design_8_8_FloatAround extends ActorScript
{          	
	
public var _MoveX:Float;

public var _MoveY:Float;

public var _Sqrt2:Float;

public var _SpawnPointx:Float;

public var _SpawnPointY:Float;

public var _TotalSpawned:Float;

 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Move X", "_MoveX");
_MoveX = 0.0;
nameMap.set("Move Y", "_MoveY");
_MoveY = 0.0;
nameMap.set("Sqrt2", "_Sqrt2");
_Sqrt2 = 0.0;
nameMap.set("Spawn Point x", "_SpawnPointx");
_SpawnPointx = 0.0;
nameMap.set("Spawn Point Y", "_SpawnPointY");
_SpawnPointY = 0.0;
nameMap.set("Total Spawned", "_TotalSpawned");
_TotalSpawned = 0.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _Sqrt2 = asNumber(Math.sqrt(2));
propertyChanged("_Sqrt2", _Sqrt2);
        _MoveX = asNumber(randomInt(Math.floor(-16), Math.floor(16)));
propertyChanged("_MoveX", _MoveX);
        _MoveY = asNumber(randomInt(Math.floor(-16), Math.floor(16)));
propertyChanged("_MoveY", _MoveY);
        actor.setXVelocity(_MoveX);
        actor.setYVelocity(_MoveY);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(((actor.getX() >= (getScreenWidth() - (actor.getWidth()))) || (actor.getX() <= 0)))
{
            actor.setXVelocity(-(actor.getXVelocity()));
}

        if(((actor.getY() >= (getScreenHeight() - (actor.getHeight()))) || (actor.getY() <= 0)))
{
            actor.setYVelocity(-(actor.getYVelocity()));
}

}
});
    
/* ======================== Something Else ======================== */
addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((actor.getXVelocity() > 0))
{
            actor.setXVelocity((actor.getLastCollidedActor().getXVelocity() - (actor.getLastCollidedActor().getXVelocity() * 2)));
}

        else if((actor.getXVelocity() < 0))
{
            actor.setXVelocity((actor.getLastCollidedActor().getXVelocity() - (actor.getLastCollidedActor().getXVelocity() * 2)));
}

        if((actor.getYVelocity() > 0))
{
            actor.setYVelocity((actor.getLastCollidedActor().getYVelocity() - (actor.getLastCollidedActor().getYVelocity() * 2)));
}

        else if((actor.getYVelocity() < 0))
{
            actor.setYVelocity((actor.getLastCollidedActor().getYVelocity() - (actor.getLastCollidedActor().getYVelocity() * 2)));
}

        else
{
            actor.setXVelocity(_MoveX);
            actor.setYVelocity(_MoveY);
}

}
});
    
/* ======================== Specific Actor ======================== */
addActorPositionListener(actor, function(enteredScreen:Bool, exitedScreen:Bool, enteredScene:Bool, exitedScene:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && exitedScreen)
{
        Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") - 1));
        Engine.engine.setGameAttribute("Store Points", (Engine.engine.getGameAttribute("Store Points") - 1));
        recycleActor(actor);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}