package bp.mongo.bson;

import js.lib.*;
import js.node.*;

typedef CommonSerializeOptions = {
	@:optional
	var checkKeys:Bool;
	@:optional
	var serializeFunctions:Bool;
	@:optional
	var ignoreUndefined:Bool;
};

typedef SerializeOptions = {
	> CommonSerializeOptions,
	@:optional
	var minInternalBufferSize:Float;
};

typedef SerializeWithBufferAndIndexOptions = {
	> CommonSerializeOptions,
	@:optional
	var index:Float;
};

typedef DeserializeOptions = {
	@:optional
	var evalFunctions:Bool;
	@:optional
	var cacheFunctions:Bool;
	@:optional
	var cacheFunctionsCrc32:Bool;
	@:optional
	var promoteLongs:Bool;
	@:optional
	var promoteBuffers:Bool;
	@:optional
	var promoteValues:Bool;
	@:optional
	var fieldsAsRaw:{var readonly:Dynamic;};
	@:optional
	var bsonRegExp:Bool;
	@:optional
	var allowObjectSmallerThanBufferSize:Bool;
};

typedef CalculateObjectSizeOptions = {
	@:optional
	var serializeFunctions:Bool;
	@:optional
	var ignoreUndefined:Bool;
};

extern class Binary {
	static var readonly:Dynamic;
	var SUBTYPE_DEFAULT:Float;
	var SUBTYPE_FUNCTION:Float;
	var SUBTYPE_BYTE_ARRAY:Float;
	var SUBTYPE_UUID_OLD:Float;
	var SUBTYPE_UUID:Float;
	var SUBTYPE_MD5:Float;
	var SUBTYPE_USER_DEFINED:Float;
	function new(buffer:Buffer, ?subType:Float):Void;
	var buffer:Buffer;
	@:optional
	var sub_type:Float;
	function length():Float;
	function put(byte_value:haxe.extern.EitherType<Float, String>):Void;
	function read(position:Float, length:Float):Buffer;
	function value():String;
	function write(buffer:haxe.extern.EitherType<Buffer, String>, offset:Float):Void;
}

extern class Code {
	function new(code:haxe.extern.EitherType<String, haxe.Constraints.Function>, ?scope:Dynamic):Void;
	var readonly:Dynamic;
	var code:haxe.extern.EitherType<String, haxe.Constraints.Function>;
	@:optional
	var scope:Dynamic;
}

extern class DBRef {
	function new(namespace:String, oid:ObjectId, ?db:String):Void;
	var namespace:String;
	var oid:ObjectId;
	@:optional
	var db:String;
}

extern class Double {
	function new(value:Float):Void;
	var value:Float;
	function valueOf():Float;
}

extern class Int32 {
	function new(value:Float):Void;
	function valueOf():Float;
}

extern class LongLike<T> {
	function new(low:Float, high:Float):Void;
	function add(other:T):T;
	function and(other:T):T;
	function compare(other:T):Float;
	function div(other:T):T;
	function equals(other:T):Bool;
	function getHighBits():Float;
	function getLowBits():Float;
	function getLowBitsUnsigned():Float;
	function getNumBitsAbs():Float;
	function greaterThan(other:T):Bool;
	function greaterThanOrEqual(other:T):Bool;
	function isNegative():Bool;
	function isOdd():Bool;
	function isZero():Bool;
	function lessThan(other:T):Bool;
	function lessThanOrEqual(other:T):Bool;
	function modulo(other:T):T;
	function multiply(other:T):T;
	function negate():T;
	function not():T;
	function notEquals(other:T):Bool;
	function or(other:T):T;
	function shiftLeft(numBits:Float):T;
	function shiftRight(numBits:Float):T;
	function shiftRightUnsigned(numBits:Float):T;
	function subtract(other:T):T;
	function toInt():Float;
	function toJSON():String;
	function toNumber():Float;
	function toString(?radix:Float):String;
	function xor(other:T):T;
}

extern class Long extends LongLike<Long> {
	static var readonly:Dynamic;
	var MAX_VALUE:Long;
	var MIN_VALUE:Long;
	var NEG_ONE:Long;
	var ONE:Long;
	var ZERO:Long;
	static function fromInt(i:Float):Long;
	static function fromNumber(n:Float):Long;
	static function fromBits(lowBits:Float, highBits:Float):Long;
	static function fromString(s:String, ?opt_radix:Float):Long;
}

extern class Decimal128 {
	static function fromString(s:String):Decimal128;
	function new(bytes:Buffer):Void;
	var readonly:Dynamic;
	var bytes:Buffer;
	function toJSON():String;
	function toString():String;
}

extern class MaxKey {
	function new():Void;
}

extern class MinKey {
	function new():Void;
}

@:jsRequire('bson', "ObjectId")
extern class ObjectId {
	function new(?id:haxe.extern.EitherType<String, haxe.extern.EitherType<Float, ObjectId>>):Void;
	var generationTime:Float;
	@:optional
	static var cacheHexString:Bool;
	static function createFromHexString(hexString:String):ObjectId;
	static function createFromTime(time:Float):ObjectId;
	static function isValid(id:haxe.extern.EitherType<String, haxe.extern.EitherType<Float, ObjectId>>):Bool;
	function equals(otherID:haxe.extern.EitherType<ObjectId, String>):Bool;
	static function generate(?time:Float):Buffer;
	function getTimestamp():Date;
	function toHexString():String;
}

extern class BSONRegExp {
	function new(pattern:String, options:String):Void;
	var readonly:Dynamic;
	var pattern:String;
	var options:String;
}

extern class Symbol {
	function new(value:String):Void;
	function valueOf():String;
}

extern class Timestamp extends LongLike<Timestamp> {
	static var readonly:Dynamic;
	var MAX_VALUE:Timestamp;
	var MIN_VALUE:Timestamp;
	var NEG_ONE:Timestamp;
	var ONE:Timestamp;
	var ZERO:Timestamp;
	static function fromInt(value:Float):Timestamp;
	static function fromNumber(value:Float):Timestamp;
	static function fromBits(lowBits:Float, highBits:Float):Timestamp;
	static function fromString(str:String, ?opt_radix:Float):Timestamp;
}

@:jsRequire('bson')
extern class Bson {
	static function serialize(object:Dynamic, ?options:SerializeOptions):Buffer;
	static function serializeWithBufferAndIndex(object:Dynamic, buffer:Buffer, ?options:SerializeWithBufferAndIndexOptions):Float;
	static function deserialize(buffer:Buffer, ?options:DeserializeOptions):Dynamic;
	static function calculateObjectSize(object:Dynamic, ?options:CalculateObjectSizeOptions):Float;
	static function deserializeStream(data:Buffer, startIndex:Float, numberOfDocuments:Float, documents:Array<Dynamic>, docStartIndex:Float,
		?options:DeserializeOptions):Float;
}
