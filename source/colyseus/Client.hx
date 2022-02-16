package colyseus;

import haxe.Constraints.Function;
import haxe.extern.EitherType;

@:luaRequire("colyseus.client")
extern class Client {
    
    @:luaDotMethod public function new(endpoint:String);
    public function join_or_create(room_name:String, options:Dynamic, callback:(error:String, room:Room)->Void):Void;
    public function create(room_name:String, options:Dynamic, callback:(error:String, room:Room)->Void):Void;

}

extern class Room {
    
    public var state(default, never):Dynamic;
    public var sessionId(default, never):String;
    public var id(default, never):String;
    public var name(default, never):String;

    public function send(type:EitherType<String, Int>, ?message:Dynamic):Void;
    public function on(event:RoomEvent, handler:Function):Void;
    public function on_message(type:EitherType<String, Int>, handler:(message:Dynamic)->Void):Void;

    public inline function on_state_change(handler:(state:Dynamic)->Void):Void on(STATE_CHANGE, handler);
    public inline function on_leave(handler:Void->Void):Void on(LEAVE, handler);
    public inline function on_error(handler:(code:Int, message:String)->Void):Void on(ERROR, handler);

}

enum abstract RoomEvent(String) {

    var STATE_CHANGE = "statechange";
    var LEAVE = "leave";
    var ERROR = "error";
    
}