package colyseus;

@:luaRequire("colyseus.client")
extern class Client {
    
    @:luaDotMethod public function new(endpoint:String);
    public function join_or_create(room_name:String, options:Dynamic, callback:(error:String, room:Room)->Void):Void;

}