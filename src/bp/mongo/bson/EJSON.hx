package bp.mongo.bson;

extern class EJSONTopLevel {
	static function parse(text:String, ?options:{
		@:optional
		var relaxed:Bool;
	}):{};
	static function deserialize(ejson:{}, ?options:{
		@:optional
		var relaxed:Bool;
	}):{};
	static function serialize(bson:{}, ?options:{
		@:optional
		var relaxed:Bool;
	}):{};
	@:override(function stringify(value:{}, replacer:haxe.extern.EitherType<String->Dynamic->Dynamic, Array<haxe.extern.EitherType<String, Float>>>, ?options:{
		@:optional
		var relaxed:Bool;
	}) {})
	@:override(function stringify(value:{}, replacer:haxe.extern.EitherType<String->Dynamic->Dynamic, Array<haxe.extern.EitherType<String, Float>>>,
		?indents:haxe.extern.EitherType<String, Float>, ?options:{
		@:optional
		var relaxed:Bool;
	}) {})
	static function stringify(value:{}, ?options:{
		@:optional
		var relaxed:Bool;
	}):String;
}
