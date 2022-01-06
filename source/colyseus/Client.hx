package colyseus;

import haxe.Constraints.Function;
import haxe.extern.EitherType;

@:luaRequire("colyseus.client")
extern class Client {
    
    @:luaDotMethod public function new(endpoint:String);
    public function join_or_create(room_name:String, options:Dynamic, callback:(error:String, room:Room)->Void):Void;

}

extern class Room {
    
    public var state(default, never):Dynamic;
    public var id(default, never):String;
    public var name(default, never):String;

    public function send(type:EitherType<String, Int>, ?message:Dynamic):Void;
    public function on(event:RoomEvent, handler:Function):Void;

}

enum abstract RoomEvent(String) {

    var STATE_CHANGE = "statechange";
    
}