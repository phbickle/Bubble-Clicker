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



class SceneEvents_0 extends SceneScript
{
	
public var _Timer:Float;

public var _ChanceToSpawn:Float;

public var _GameRunning:Bool;

public var _TotalSpawned:Float;

public var _SpawnPointx:Float;

public var _SpawnPointY:Float;

public var _TimerText:String;

public var _Time:Float;

public var _BublesonScreen:Float;

public var _TimesSinceLastSpawn:Actor;

public var _TimeSinceLastSpawn:Float;

public var _BubleAtt:Actor;

public var _Dead:Bool;

public var _testbackgroundbool:Bool;

public var _TilingCounter:Float;

public var _Backgroundhasbeendrawn:Bool;

public var _BackgroundHasBeenDrawn:Actor;

public var _TilingCounterY:Float;

public var _NumberofTiles:Float;

public var _NumberofTilesY:Float;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Timer", "_Timer");
_Timer = 0.0;
nameMap.set("Chance To Spawn", "_ChanceToSpawn");
_ChanceToSpawn = 0.0;
nameMap.set("Game Running", "_GameRunning");
_GameRunning = false;
nameMap.set("Total Spawned", "_TotalSpawned");
_TotalSpawned = 0.0;
nameMap.set("Spawn Point x", "_SpawnPointx");
_SpawnPointx = 0.0;
nameMap.set("Spawn Point Y", "_SpawnPointY");
_SpawnPointY = 0.0;
nameMap.set("Timer Text", "_TimerText");
_TimerText = "";
nameMap.set("Time", "_Time");
_Time = 0.0;
nameMap.set("Bubles on Screen", "_BublesonScreen");
_BublesonScreen = 0.0;
nameMap.set("Times Since Last Spawn", "_TimesSinceLastSpawn");
nameMap.set("Time Since Last Spawn", "_TimeSinceLastSpawn");
_TimeSinceLastSpawn = 0.0;
nameMap.set("Buble Att", "_BubleAtt");
nameMap.set("Dead", "_Dead");
_Dead = false;
nameMap.set("test background bool", "_testbackgroundbool");
_testbackgroundbool = false;
nameMap.set("Tiling Counter", "_TilingCounter");
_TilingCounter = 0;
nameMap.set("Background has been drawn", "_Backgroundhasbeendrawn");
_Backgroundhasbeendrawn = false;
nameMap.set("Background Has Been Drawn", "_BackgroundHasBeenDrawn");
nameMap.set("Tiling Counter Y", "_TilingCounterY");
_TilingCounterY = 0;
nameMap.set("Number of Tiles", "_NumberofTiles");
_NumberofTiles = 0;
nameMap.set("Number of Tiles Y", "_NumberofTilesY");
_NumberofTilesY = 0;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _Time = asNumber(0);
propertyChanged("_Time", _Time);
        Engine.engine.setGameAttribute("Time", 0);
        _ChanceToSpawn = asNumber(2);
propertyChanged("_ChanceToSpawn", _ChanceToSpawn);
        _TotalSpawned = asNumber(0);
propertyChanged("_TotalSpawned", _TotalSpawned);
        _SpawnPointx = asNumber(1);
propertyChanged("_SpawnPointx", _SpawnPointx);
        _SpawnPointY = asNumber(1);
propertyChanged("_SpawnPointY", _SpawnPointY);
        Engine.engine.setGameAttribute("Bubbles on Screen", 0);
        Engine.engine.setGameAttribute("Score", 0);
        _TimeSinceLastSpawn = asNumber(0);
propertyChanged("_TimeSinceLastSpawn", _TimeSinceLastSpawn);
        loadGame("mySave", function(success:Bool):Void {

});
        createRecycledActor(getActorType(0), _SpawnPointx, _SpawnPointY, Script.FRONT);
        getLastCreatedActor().setAnimation("" + ("" + Engine.engine.getGameAttribute("Bubble Type")));
        recycleActor(getLastCreatedActor());
        _TilingCounter = asNumber(0);
propertyChanged("_TilingCounter", _TilingCounter);
        _TilingCounterY = asNumber(0);
propertyChanged("_TilingCounterY", _TilingCounterY);
        _NumberofTiles = asNumber(-1);
propertyChanged("_NumberofTiles", _NumberofTiles);
        _NumberofTilesY = asNumber(-1);
propertyChanged("_NumberofTilesY", _NumberofTilesY);
        _GameRunning = true;
propertyChanged("_GameRunning", _GameRunning);
        if((Engine.engine.getGameAttribute("Background Colout") == "Black"))
{
            setColorBackground(Utils.getColorRGB(51,51,51));
}

        else if((Engine.engine.getGameAttribute("Background Colout") == "Heart"))
{
            createRecycledActor(getActorType(32), 0, 0, Script.BACK);
            recycleActor(getLastCreatedActor());
            while(!((_TilingCounterY >= (getSceneHeight()))))
{
                _TilingCounterY = asNumber((_TilingCounterY + (getLastCreatedActor().getHeight())));
propertyChanged("_TilingCounterY", _TilingCounterY);
                _NumberofTilesY = asNumber((_NumberofTilesY + 1));
propertyChanged("_NumberofTilesY", _NumberofTilesY);
                createRecycledActor(getActorType(32), ((getLastCreatedActor().getWidth()) * _NumberofTiles), ((getLastCreatedActor().getHeight()) * _NumberofTilesY), Script.BACK);
                while(!((_TilingCounter >= (getSceneWidth()))))
{
                    _TilingCounter = asNumber((_TilingCounter + (getLastCreatedActor().getWidth())));
propertyChanged("_TilingCounter", _TilingCounter);
                    _NumberofTiles = asNumber((_NumberofTiles + 1));
propertyChanged("_NumberofTiles", _NumberofTiles);
                    createRecycledActor(getActorType(32), ((getLastCreatedActor().getWidth()) * _NumberofTiles), ((getLastCreatedActor().getHeight()) * _NumberofTilesY), Script.BACK);
}

                _TilingCounter = asNumber(0);
propertyChanged("_TilingCounter", _TilingCounter);
                _NumberofTiles = asNumber(-1);
propertyChanged("_NumberofTiles", _NumberofTiles);
}

            _TilingCounterY = asNumber(0);
propertyChanged("_TilingCounterY", _TilingCounterY);
            _NumberofTilesY = asNumber(-1);
propertyChanged("_NumberofTilesY", _NumberofTilesY);
}

        else if((Engine.engine.getGameAttribute("Background Colout") == "Heart"))
{
            createRecycledActor(getActorType(32), 0, 0, Script.BACK);
            recycleActor(getLastCreatedActor());
            while(!((_TilingCounterY >= (getSceneHeight()))))
{
                _TilingCounterY = asNumber((_TilingCounterY + (getLastCreatedActor().getHeight())));
propertyChanged("_TilingCounterY", _TilingCounterY);
                _NumberofTilesY = asNumber((_NumberofTilesY + 1));
propertyChanged("_NumberofTilesY", _NumberofTilesY);
                createRecycledActor(getActorType(32), ((getLastCreatedActor().getWidth()) * _NumberofTiles), ((getLastCreatedActor().getHeight()) * _NumberofTilesY), Script.BACK);
                while(!((_TilingCounter >= (getSceneWidth()))))
{
                    _TilingCounter = asNumber((_TilingCounter + (getLastCreatedActor().getWidth())));
propertyChanged("_TilingCounter", _TilingCounter);
                    _NumberofTiles = asNumber((_NumberofTiles + 1));
propertyChanged("_NumberofTiles", _NumberofTiles);
                    createRecycledActor(getActorType(32), ((getLastCreatedActor().getWidth()) * _NumberofTiles), ((getLastCreatedActor().getHeight()) * _NumberofTilesY), Script.BACK);
}

                _TilingCounter = asNumber(0);
propertyChanged("_TilingCounter", _TilingCounter);
                _NumberofTiles = asNumber(-1);
propertyChanged("_NumberofTiles", _NumberofTiles);
}

            _TilingCounterY = asNumber(0);
propertyChanged("_TilingCounterY", _TilingCounterY);
            _NumberofTilesY = asNumber(-1);
propertyChanged("_NumberofTilesY", _NumberofTilesY);
}

        else
{
            setColorBackground(Utils.getColorRGB(255,255,255));
}

    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((_GameRunning == true))
{
            _Time = asNumber((_Time + 1));
propertyChanged("_Time", _Time);
            if((_Time >= 60))
{
                Engine.engine.setGameAttribute("Time", (Engine.engine.getGameAttribute("Time") + 1));
                _ChanceToSpawn = asNumber(Math.abs(((Engine.engine.getGameAttribute("Time") / 10) + 20)));
propertyChanged("_ChanceToSpawn", _ChanceToSpawn);
                if(((randomInt(Math.floor(1), Math.floor(50)) <= _ChanceToSpawn) || (_TimeSinceLastSpawn > 3)))
{
                    _SpawnPointx = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneWidth()) - 64))));
propertyChanged("_SpawnPointx", _SpawnPointx);
                    _SpawnPointY = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneHeight()) - 64))));
propertyChanged("_SpawnPointY", _SpawnPointY);
                    createRecycledActor(getActorType(0), _SpawnPointx, _SpawnPointY, Script.BACK);
                    Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") + 1));
                    _TotalSpawned = asNumber((_TotalSpawned + 1));
propertyChanged("_TotalSpawned", _TotalSpawned);
                    if((_ChanceToSpawn > 30))
{
                        _SpawnPointx = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneWidth()) - 64))));
propertyChanged("_SpawnPointx", _SpawnPointx);
                        _SpawnPointY = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneHeight()) - 64))));
propertyChanged("_SpawnPointY", _SpawnPointY);
                        createRecycledActor(getActorType(0), _SpawnPointx, _SpawnPointY, Script.BACK);
                        Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") + 1));
                        _TotalSpawned = asNumber((_TotalSpawned + 1));
propertyChanged("_TotalSpawned", _TotalSpawned);
                        _TimeSinceLastSpawn = asNumber(0);
propertyChanged("_TimeSinceLastSpawn", _TimeSinceLastSpawn);
                        if((_ChanceToSpawn > 40))
{
                            _SpawnPointx = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneWidth()) - 64))));
propertyChanged("_SpawnPointx", _SpawnPointx);
                            _SpawnPointY = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneHeight()) - 64))));
propertyChanged("_SpawnPointY", _SpawnPointY);
                            createRecycledActor(getActorType(0), _SpawnPointx, _SpawnPointY, Script.BACK);
                            Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") + 1));
                            _TotalSpawned = asNumber((_TotalSpawned + 1));
propertyChanged("_TotalSpawned", _TotalSpawned);
                            _TimeSinceLastSpawn = asNumber(0);
propertyChanged("_TimeSinceLastSpawn", _TimeSinceLastSpawn);
}

                        if((_ChanceToSpawn > 50))
{
                            _SpawnPointx = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneWidth()) - 64))));
propertyChanged("_SpawnPointx", _SpawnPointx);
                            _SpawnPointY = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneHeight()) - 64))));
propertyChanged("_SpawnPointY", _SpawnPointY);
                            createRecycledActor(getActorType(0), _SpawnPointx, _SpawnPointY, Script.BACK);
                            Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") + 1));
                            _TotalSpawned = asNumber((_TotalSpawned + 1));
propertyChanged("_TotalSpawned", _TotalSpawned);
                            _TimeSinceLastSpawn = asNumber(0);
propertyChanged("_TimeSinceLastSpawn", _TimeSinceLastSpawn);
}

                        if((_ChanceToSpawn > 60))
{
                            _SpawnPointx = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneWidth()) - 64))));
propertyChanged("_SpawnPointx", _SpawnPointx);
                            _SpawnPointY = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneHeight()) - 64))));
propertyChanged("_SpawnPointY", _SpawnPointY);
                            createRecycledActor(getActorType(0), _SpawnPointx, _SpawnPointY, Script.BACK);
                            Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") + 1));
                            _TotalSpawned = asNumber((_TotalSpawned + 1));
propertyChanged("_TotalSpawned", _TotalSpawned);
                            _TimeSinceLastSpawn = asNumber(0);
propertyChanged("_TimeSinceLastSpawn", _TimeSinceLastSpawn);
}

                        if((_ChanceToSpawn > 70))
{
                            _SpawnPointx = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneWidth()) - 64))));
propertyChanged("_SpawnPointx", _SpawnPointx);
                            _SpawnPointY = asNumber(randomInt(Math.floor(18), Math.floor(((getSceneHeight()) - 64))));
propertyChanged("_SpawnPointY", _SpawnPointY);
                            createRecycledActor(getActorType(0), _SpawnPointx, _SpawnPointY, Script.BACK);
                            Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") + 1));
                            _TotalSpawned = asNumber((_TotalSpawned + 1));
propertyChanged("_TotalSpawned", _TotalSpawned);
                            _TimeSinceLastSpawn = asNumber(0);
propertyChanged("_TimeSinceLastSpawn", _TimeSinceLastSpawn);
}

}

}

                else
{
                    _TimeSinceLastSpawn = asNumber((_TimeSinceLastSpawn + 1));
propertyChanged("_TimeSinceLastSpawn", _TimeSinceLastSpawn);
}

                _Time = asNumber(0);
propertyChanged("_Time", _Time);
                if((Engine.engine.getGameAttribute("Bubbles on Screen") >= 40))
{
                    _GameRunning = false;
propertyChanged("_GameRunning", _GameRunning);
                    _Time = asNumber(0);
propertyChanged("_Time", _Time);
                    Engine.engine.setGameAttribute("Time", 0);
                    _ChanceToSpawn = asNumber(3);
propertyChanged("_ChanceToSpawn", _ChanceToSpawn);
                    _TotalSpawned = asNumber(0);
propertyChanged("_TotalSpawned", _TotalSpawned);
                    _SpawnPointx = asNumber(1);
propertyChanged("_SpawnPointx", _SpawnPointx);
                    _SpawnPointY = asNumber(1);
propertyChanged("_SpawnPointY", _SpawnPointY);
                    Engine.engine.setGameAttribute("Bubbles on Screen", 0);
                    Engine.engine.setGameAttribute("Score", 0);
                    Engine.engine.setGameAttribute("Store Points", Engine.engine.getGameAttribute("Store Points"));
                    saveGame("mySave", function(success:Bool):Void {

});
                    switchScene(GameModel.get().scenes.get(1).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
}

}

            getLastCreatedActor().setAnimation("" + ("" + Engine.engine.getGameAttribute("Bubble Type")));
}

}
});
    
/* ======================== Actor of Type ========================= */
addWhenTypeGroupKilledListener(getActorType(0), function(eventActor:Actor, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        trace("" + Engine.engine.getGameAttribute("Store Points"));
        Engine.engine.setGameAttribute("Store Points", (Engine.engine.getGameAttribute("Store Points") + 1));
        if((Engine.engine.getGameAttribute("High Score") < Engine.engine.getGameAttribute("Score")))
{
            Engine.engine.setGameAttribute("High Score", Engine.engine.getGameAttribute("Score"));
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("action2", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((Engine.engine.getGameAttribute("Number of Bombs") > 0))
{
            Engine.engine.setGameAttribute("Number of Bombs", (Engine.engine.getGameAttribute("Number of Bombs") - 1));
            for(actorOfType in getActorsOfType(getActorType(0)))
{
if(actorOfType != null && !actorOfType.dead && !actorOfType.recycled){
                Engine.engine.setGameAttribute("Bubbles on Screen", (Engine.engine.getGameAttribute("Bubbles on Screen") - 1));
                Engine.engine.setGameAttribute("Score", (Engine.engine.getGameAttribute("Score") + 1));
                actorOfType.setAnimation("" + ("" + "Animation 1"));
                actorOfType.setXVelocity(0);
                actorOfType.setYVelocity(0);
                runLater(1000 * 0.2, function(timeTask:TimedTask):Void {
                            actorOfType.setCurrentFrame(Std.int(0));
}, null);
                runLater(1000 * 0.3, function(timeTask:TimedTask):Void {
                            actorOfType.setCurrentFrame(Std.int(1));
}, null);
                runLater(1000 * 0.6, function(timeTask:TimedTask):Void {
                            recycleActor(actorOfType);
}, null);
}
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}