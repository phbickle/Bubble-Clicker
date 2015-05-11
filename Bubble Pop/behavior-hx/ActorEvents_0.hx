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



class ActorEvents_0 extends ActorScript
{          	
	
public var _Dead:Bool;

public var _Lifespan:Float;

public var _BubbleTimer:Float;

 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Dead", "_Dead");
_Dead = false;
nameMap.set("Lifespan", "_Lifespan");
_Lifespan = 0.0;
nameMap.set("Bubble Timer", "_BubbleTimer");
_BubbleTimer = 0.0;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _Dead = false;
propertyChanged("_Dead", _Dead);
        _Lifespan = asNumber(0);
propertyChanged("_Lifespan", _Lifespan);
        _BubbleTimer = asNumber(Engine.engine.getGameAttribute("Time"));
propertyChanged("_BubbleTimer", _BubbleTimer);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((!(actor.getCurrentFrame() == 0) && !(_Dead)))
{
            actor.setCurrentFrame(Std.int(0));
}

        if(!((Engine.engine.getGameAttribute("Time") - _BubbleTimer) == 0))
{
            _BubbleTimer = asNumber(Engine.engine.getGameAttribute("Time"));
propertyChanged("_BubbleTimer", _BubbleTimer);
            _Lifespan = asNumber((_Lifespan + (Engine.engine.getGameAttribute("Time") - _BubbleTimer)));
propertyChanged("_Lifespan", _Lifespan);
            if((_Lifespan >= 20))
{
                _Dead = true;
propertyChanged("_Dead", _Dead);
                actor.setAnimation("" + ("" + "Animation 1"));
                actor.setXVelocity(0);
                actor.setYVelocity(0);
                runLater(1000 * 0.2, function(timeTask:TimedTask):Void {
                            actor.setCurrentFrame(Std.int(0));
}, actor);
                runLater(1000 * 0.3, function(timeTask:TimedTask):Void {
                            actor.setCurrentFrame(Std.int(1));
}, actor);
                runLater(1000 * 0.6, function(timeTask:TimedTask):Void {
                            recycleActor(actor);
}, actor);
}

}

}
});
    
/* =========================== On Actor =========================== */
addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
{
if(wrapper.enabled && 3 == mouseState)
{
        if(!(_Dead))
{
            Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") - 1));
            Engine.engine.setGameAttribute("Score", (Engine.engine.getGameAttribute("Score") + 1));
            actor.setAnimation("" + ("" + "Animation 1"));
            actor.setXVelocity(0);
            actor.setYVelocity(0);
            runLater(1000 * 0.2, function(timeTask:TimedTask):Void {
                        actor.setCurrentFrame(Std.int(0));
}, actor);
            runLater(1000 * 0.3, function(timeTask:TimedTask):Void {
                        actor.setCurrentFrame(Std.int(1));
}, actor);
            runLater(1000 * 0.6, function(timeTask:TimedTask):Void {
                        recycleActor(actor);
}, actor);
            _Dead = true;
propertyChanged("_Dead", _Dead);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}