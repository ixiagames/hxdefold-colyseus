package colyseus;

import haxe.extern.EitherType;

extern class Room {
    
    public var state(default, never):Dynamic<{}>;
    public var id(default, never):String;
    public var name(default, never):String;

    public function send(type:EitherType<String, Int>, message:Dynamic):Void;

}