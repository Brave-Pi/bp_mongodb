package bp;
import js.lib.*;
import haxe.ds.*;
import js.node.events.EventEmitter;
import js.node.*;
import js.node.buffer.*;
import bp.mongo.bson.Bson;
typedef EventEmitter = js.node.events.EventEmitter<Dynamic>;
extern class MongoClient extends EventEmitter {
	function new(uri:String, ?options:MongoClientOptions):Void;
	@:overload(function(uri:String, ?options:MongoClientOptions):Promise<MongoClient> { })
	@:overload(function(uri:String, options:MongoClientOptions, callback:MongoCallback<MongoClient>):Void { })
	@:overload(function():Promise<MongoClient> { })
	@:overload(function(callback:MongoCallback<MongoClient>):Void { })
	static function connect(uri:String, callback:MongoCallback<MongoClient>):Void;
	@:overload(function(?force:Bool):Promise<Void> { })
	@:overload(function(force:Bool, callback:MongoCallback<Void>):Void { })
	function close(callback:MongoCallback<Void>):Void;
	function db(?dbName:String, ?options:MongoClientCommonOption):Db;
	function isConnected(?options:MongoClientCommonOption):Bool;
	@:overload(function(?options:{ @:optional
	var dbName : String; }):Promise<Dynamic> { })
	@:overload(function(options:{ @:optional
	var dbName : String; }, callback:MongoCallback<Dynamic>):Void { })
	function logout(callback:MongoCallback<Dynamic>):Void;
	function startSession(?options:SessionOptions):ClientSession;
	function watch<TSchema>(?pipeline:Array<Dynamic>, ?options:Dynamic):ChangeStream<TSchema>;
	@:overload(function(options:SessionOptions, operation:ClientSession -> Promise<Dynamic>):Promise<Void> { })
	function withSession(operation:ClientSession -> Promise<Dynamic>):Promise<Void>;
}
extern class ClientSession extends EventEmitter {
	
	var id : Dynamic;
	function abortTransaction(?cb:MongoCallback<Void>):Promise<Void>;
	function advanceOperationTime(operamtionTime:Timestamp):Void;
	function commitTransaction(?cb:MongoCallback<Void>):Promise<Void>;
	@:overload(function(options:Dynamic, ?cb:MongoCallback<Void>):Void { })
	function endSession(?cb:MongoCallback<Void>):Void;
	function equals(session:ClientSession):Bool;
	function incrementTransactionNumber():Void;
	function inTransaction():Bool;
	function startTransaction(?options:TransactionOptions):Void;
	function withTransaction<T>(fn:Dynamic, ?options:TransactionOptions):Promise<Void>;
}
typedef ReadConcern = {
	var level : Dynamic;
};
typedef WriteConcern = {
	@:optional
	var w : haxe.extern.EitherType<Float, haxe.extern.EitherType<String, String>>;
	@:optional
	var j : Bool;
	@:optional
	var wtimeout : Float;
};
typedef SessionOptions = {
	@:optional
	var causalConsistency : Bool;
	@:optional
	var defaultTransactionOptions : TransactionOptions;
};
typedef TransactionOptions = {
	@:optional
	var readConcern : ReadConcern;
	@:optional
	var writeConcern : WriteConcern;
	@:optional
	var readPreference : Dynamic;
};
typedef MongoClientCommonOption = {
	@:optional
	var noListener : Bool;
	@:optional
	var returnNonCachedInstance : Bool;
};
typedef MongoCallback<T> = Dynamic;
extern class MongoError extends Error {
	function new(message:haxe.extern.EitherType<String, haxe.extern.EitherType<Error, Dynamic>>):Void;
	static function create(options:haxe.extern.EitherType<String, haxe.extern.EitherType<Error, Dynamic>>):MongoError;
	function hasErrorLabel(label:String):Bool;
	@:optional
	var code : Float;
	@:optional
	var errmsg : String;
	// var name : String;
}
extern class MongoNetworkError extends MongoError {
	function new(message:String):Void;
	var errorLabels : Array<String>;
}
extern class MongoParseError extends MongoError {
	function new(message:String):Void;
}
typedef MongoClientOptions = {
	>DbCreateOptions,
	>ServerOptions,
	>MongosOptions,
	>ReplSetOptions,
	>SocketOptions,
	>SSLOptions,
	>TLSOptions,
	>HighAvailabilityOptions,
	>WriteConcern,
	>UnifiedTopologyOptions,
	@:optional
	var loggerLevel : String;
	@:optional
	var logger : Dynamic;
	@:optional
	var validateOptions : haxe.extern.EitherType<Dynamic, Bool>;
	@:optional
	var appname : String;
	@:optional
	var auth : { var user : String; var password : String; };
	@:optional
	var useNewUrlParser : Bool;
	@:optional
	var numberOfRetries : Float;
	@:optional
	var authMechanism : haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>>>>>>;
	@:optional
	var compression : { @:optional
	var compressors : Array<haxe.extern.EitherType<String, String>>; };
};
typedef SSLOptions = {
	@:optional
	var ciphers : String;
	@:optional
	var ecdhCurve : String;
	@:optional
	var poolSize : Float;
	@:optional
	var minSize : Float;
	@:optional
	var ssl : Bool;
	@:optional
	var sslValidate : Bool;
	@:optional
	var checkServerIdentity : haxe.extern.EitherType<Bool, Dynamic>;
	@:optional
	var sslCA : ReadOnlyArray<haxe.extern.EitherType<Buffer, String>>;
	@:optional
	var sslCRL : ReadOnlyArray<haxe.extern.EitherType<Buffer, String>>;
	@:optional
	var sslCert : haxe.extern.EitherType<Buffer, String>;
	@:optional
	var sslKey : haxe.extern.EitherType<Buffer, String>;
	@:optional
	var sslPass : haxe.extern.EitherType<Buffer, String>;
	@:optional
	var servername : String;
};
typedef TLSOptions = {
	@:optional
	var tls : Bool;
	@:optional
	var tlsInsecure : Bool;
	@:optional
	var tlsCAFile : String;
	@:optional
	var tlsCertificateKeyFile : String;
	@:optional
	var tlsCertificateKeyFilePassword : String;
	@:optional
	var tlsAllowInvalidCertificates : Bool;
	@:optional
	var tlsAllowInvalidHostnames : Bool;
};
typedef HighAvailabilityOptions = {
	@:optional
	var ha : Bool;
	@:optional
	var haInterval : Float;
	@:optional
	var domainsEnabled : Bool;
	@:optional
	var readPreference : Dynamic;
	@:optional
	var readPreferenceTags : Array<String>;
};
extern class ReadPreference {
	function new(mode:Dynamic, tags:Dynamic):Void;
	var mode : Dynamic;
	var tags : Dynamic;
	var options : { @:optional
	var maxStalenessSeconds : Float; };
	static var PRIMARY : String;
	static var PRIMARY_PREFERRED : String;
	static var SECONDARY : String;
	static var SECONDARY_PREFERRED : String;
	static var NEAREST : String;
	@:overload(function(mode:String):Bool { })
	function isValid(mode:String):Bool;
}
typedef DbCreateOptions = {
	>CommonOptions,
	@:optional
	var authSource : String;
	@:optional
	var forceServerObjectId : Bool;
	@:optional
	var native_parser : Bool;
	@:optional
	var serializeFunctions : Bool;
	@:optional
	var ignoreUndefined : Bool;
	@:optional
	var raw : Bool;
	@:optional
	var promoteLongs : Bool;
	@:optional
	var promoteBuffers : Bool;
	@:optional
	var readPreference : Dynamic;
	@:optional
	var promoteValues : Bool;
	@:optional
	var pkFactory : Dynamic;
	@:optional
	var promiseLibrary : Dynamic;
	@:optional
	var readConcern : haxe.extern.EitherType<ReadConcern, String>;
	@:optional
	var bufferMaxEntries : Float;
};
typedef UnifiedTopologyOptions = {
	@:optional
	var useUnifiedTopology : Bool;
	@:optional
	var localThresholdMS : Float;
	@:optional
	var serverSelectionTimeoutMS : Float;
	@:optional
	var heartbeatFrequencyMS : Float;
	@:optional
	var maxPoolSize : Float;
	@:optional
	var minPoolSize : Float;
	@:optional
	var maxIdleTimeMS : Float;
	@:optional
	var waitQueueTimeoutMS : Float;
};
typedef SocketOptions = {
	@:optional
	var autoReconnect : Bool;
	@:optional
	var noDelay : Bool;
	@:optional
	var keepAlive : Bool;
	@:optional
	var keepAliveInitialDelay : Float;
	@:optional
	var connectTimeoutMS : Float;
	@:optional
	var family : haxe.extern.EitherType<Int, haxe.extern.EitherType<Int, Null<Dynamic>>>;
	@:optional
	var socketTimeoutMS : Float;
};
typedef ServerOptions = {
	>SSLOptions,
	@:optional
	var reconnectTries : Float;
	@:optional
	var reconnectInterval : Float;
	@:optional
	var monitoring : Bool;
	@:optional
	var monitorCommands : Bool;
	@:optional
	var socketOptions : SocketOptions;
	@:optional
	var haInterval : Float;
	@:optional
	var domainsEnabled : Bool;
	@:optional
	var fsync : Bool;
};
typedef MongosOptions = {
	>SSLOptions,
	>HighAvailabilityOptions,
	@:optional
	var acceptableLatencyMS : Float;
	@:optional
	var socketOptions : SocketOptions;
};
typedef ReplSetOptions = {
	>SSLOptions,
	>HighAvailabilityOptions,
	@:optional
	var maxStalenessSeconds : Float;
	@:optional
	var replicaSet : String;
	@:optional
	var secondaryAcceptableLatencyMS : Float;
	@:optional
	var connectWithNoPrimary : Bool;
	@:optional
	var socketOptions : SocketOptions;
};
extern class Db extends EventEmitter {
	function new(databaseName:String, serverConfig:haxe.extern.EitherType<Server, haxe.extern.EitherType<ReplSet, Mongos>>, ?options:DbCreateOptions):Void;
	var serverConfig : haxe.extern.EitherType<Server, haxe.extern.EitherType<ReplSet, Mongos>>;
	var bufferMaxEntries : Float;
	var databaseName : String;
	var options : Dynamic;
	var native_parser : Bool;
	var slaveOk : Bool;
	var writeConcern : WriteConcern;
	@:overload(function(username:String, password:String, ?options:DbAddUserOptions):Promise<Dynamic> { })
	@:overload(function(username:String, password:String, options:DbAddUserOptions, callback:MongoCallback<Dynamic>):Void { })
	function addUser(username:String, password:String, callback:MongoCallback<Dynamic>):Void;
	function admin():Admin;
	@:overload(function<TSchema>(name:String, options:DbCollectionOptions, ?callback:MongoCallback<Collection<TSchema>>):Collection<TSchema> { })
	function collection<TSchema>(name:String, ?callback:MongoCallback<Collection<TSchema>>):Collection<TSchema>;
	@:overload(function(callback:MongoCallback<Array<Collection<Dynamic>>>):Void { })
	function collections():Promise<Array<Collection<Dynamic>>>;
	@:overload(function(command:Dynamic, ?options:{ var readPreference : Dynamic; @:optional
	var session : ClientSession; }):Promise<Dynamic> { })
	@:overload(function(command:Dynamic, options:{ var readPreference : Dynamic; @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function command(command:Dynamic, callback:MongoCallback<Dynamic>):Void;
	@:overload(function<TSchema>(name:String, ?options:CollectionCreateOptions):Promise<Collection<TSchema>> { })
	@:overload(function<TSchema>(name:String, options:CollectionCreateOptions, callback:MongoCallback<Collection<TSchema>>):Void { })
	function createCollection<TSchema>(name:String, callback:MongoCallback<Collection<TSchema>>):Void;
	@:overload(function(name:String, fieldOrSpec:haxe.extern.EitherType<String, Dynamic>, ?options:IndexOptions):Promise<Dynamic> { })
	@:overload(function(name:String, fieldOrSpec:haxe.extern.EitherType<String, Dynamic>, options:IndexOptions, callback:MongoCallback<Dynamic>):Void { })
	function createIndex(name:String, fieldOrSpec:haxe.extern.EitherType<String, Dynamic>, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(name:String, callback:MongoCallback<Bool>):Void { })
	function dropCollection(name:String):Promise<Bool>;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function dropDatabase():Promise<Dynamic>;
	@:overload(function(command:Dynamic, ?options:{ @:optional
	var readPreference : Dynamic; @:optional
	var session : ClientSession; }):Promise<Dynamic> { })
	@:overload(function(command:Dynamic, options:{ @:optional
	var readPreference : Dynamic; @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function executeDbAdminCommand(command:Dynamic, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(name:String, ?options:{ @:optional
	var full : Bool; @:optional
	var readPreference : Dynamic; }):Promise<Dynamic> { })
	@:overload(function(name:String, options:{ @:optional
	var full : Bool; @:optional
	var readPreference : Dynamic; }, callback:MongoCallback<Dynamic>):Void { })
	function indexInformation(name:String, callback:MongoCallback<Dynamic>):Void;
	function listCollections(?filter:Dynamic, ?options:{ @:optional
	var nameOnly : Bool; @:optional
	var batchSize : Float; @:optional
	var readPreference : Dynamic; @:optional
	var session : ClientSession; }):CommandCursor;
	@:overload(function(?options:{ @:optional
	var session : ClientSession; }):Promise<Void> { })
	@:overload(function(options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Void>):Void { })
	function profilingInfo(callback:MongoCallback<Dynamic>):Void;
	@:overload(function(?options:{ @:optional
	var session : ClientSession; }):Promise<Dynamic> { })
	@:overload(function(options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function profilingLevel(callback:MongoCallback<Dynamic>):Void;
	@:overload(function(username:String, ?options:CommonOptions):Promise<Dynamic> { })
	@:overload(function(username:String, options:CommonOptions, callback:MongoCallback<Dynamic>):Void { })
	function removeUser(username:String, callback:MongoCallback<Dynamic>):Void;
	@:overload(function<TSchema>(fromCollection:String, toCollection:String, ?options:{ @:optional
	var dropTarget : Bool; }):Promise<Collection<TSchema>> { })
	@:overload(function<TSchema>(fromCollection:String, toCollection:String, options:{ @:optional
	var dropTarget : Bool; }, callback:MongoCallback<Collection<TSchema>>):Void { })
	function renameCollection<TSchema>(fromCollection:String, toCollection:String, callback:MongoCallback<Collection<TSchema>>):Void;
	@:overload(function(level:Dynamic, ?options:{ @:optional
	var session : ClientSession; }):Promise<Dynamic> { })
	@:overload(function(level:Dynamic, options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function setProfilingLevel(level:Dynamic, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(?options:{ @:optional
	var scale : Float; }):Promise<Dynamic> { })
	@:overload(function(options:{ @:optional
	var scale : Float; }, callback:MongoCallback<Dynamic>):Void { })
	function stats(callback:MongoCallback<Dynamic>):Void;
	function watch<TSchema:(Dynamic)>(?pipeline:Array<Dynamic>, ?options:Dynamic):ChangeStream<TSchema>;
}
typedef CommonOptions = {
	>WriteConcern,
	@:optional
	var session : ClientSession;
};
extern class Server extends EventEmitter {
	function new(host:String, port:Float, ?options:ServerOptions):Void;
	function connections():Array<Dynamic>;
}
extern class ReplSet extends EventEmitter {
	function new(servers:Array<Server>, ?options:ReplSetOptions):Void;
	function connections():Array<Dynamic>;
}
extern class Mongos extends EventEmitter {
	function new(servers:Array<Server>, ?options:MongosOptions):Void;
	function connections():Array<Dynamic>;
}
typedef DbAddUserOptions = {
	>CommonOptions,
	@:optional
	var customData : Dynamic;
	@:optional
	var roles : Array<Dynamic>;
};
typedef CollectionCreateOptions = {
	>CommonOptions,
	@:optional
	var raw : Bool;
	@:optional
	var pkFactory : Dynamic;
	@:optional
	var readPreference : Dynamic;
	@:optional
	var serializeFunctions : Bool;
	@:optional
	var strict : Bool;
	@:optional
	var capped : Bool;
	@:optional
	var autoIndexId : Bool;
	@:optional
	var size : Float;
	@:optional
	var max : Float;
	@:optional
	var flags : Float;
	@:optional
	var storageEngine : Dynamic;
	@:optional
	var validator : Dynamic;
	@:optional
	var validationLevel : haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>;
	@:optional
	var validationAction : haxe.extern.EitherType<String, String>;
	@:optional
	var indexOptionDefaults : Dynamic;
	@:optional
	var viewOn : String;
	@:optional
	var pipeline : Array<Dynamic>;
	@:optional
	var collation : CollationDocument;
};
typedef DbCollectionOptions = {
	>CommonOptions,
	@:optional
	var raw : Bool;
	@:optional
	var pkFactory : Dynamic;
	@:optional
	var readPreference : Dynamic;
	@:optional
	var serializeFunctions : Bool;
	@:optional
	var strict : Bool;
	@:optional
	var readConcern : ReadConcern;
};
typedef IndexOptions = {
	>CommonOptions,
	@:optional
	var unique : Bool;
	@:optional
	var sparse : Bool;
	@:optional
	var background : Bool;
	@:optional
	var dropDups : Bool;
	@:optional
	var min : Float;
	@:optional
	var max : Float;
	@:optional
	var v : Float;
	@:optional
	var expireAfterSeconds : Float;
	@:optional
	var name : String;
	@:optional
	var partialFilterExpression : Dynamic;
	@:optional
	var collation : CollationDocument;
	@:optional
	var default_language : String;
};
typedef Admin = {
	@:overload(function(username:String, password:String, ?options:AddUserOptions):Promise<Dynamic> { })
	@:overload(function(username:String, password:String, options:AddUserOptions, callback:MongoCallback<Dynamic>):Void { })
	function addUser(username:String, password:String, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function buildInfo(?options:{ @:optional
	var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(command:Dynamic, ?options:{ @:optional
	var readPreference : Dynamic; @:optional
	var maxTimeMS : Float; }):Promise<Dynamic> { })
	@:overload(function(command:Dynamic, options:{ @:optional
	var readPreference : Dynamic; @:optional
	var maxTimeMS : Float; }, callback:MongoCallback<Dynamic>):Void { })
	function command(command:Dynamic, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(options:{ @:optional
	var nameOnly : Bool; @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function listDatabases(?options:{ @:optional
	var nameOnly : Bool; @:optional
	var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function ping(?options:{ @:optional
	var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(username:String, ?options:FSyncOptions):Promise<Dynamic> { })
	@:overload(function(username:String, options:FSyncOptions, callback:MongoCallback<Dynamic>):Void { })
	function removeUser(username:String, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function replSetGetStatus(?options:{ @:optional
	var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function serverInfo():Promise<Dynamic>;
	@:overload(function(options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function serverStatus(?options:{ @:optional
	var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(collectionNme:String, ?options:Dynamic):Promise<Dynamic> { })
	@:overload(function(collectionNme:String, options:Dynamic, callback:MongoCallback<Dynamic>):Void { })
	function validateCollection(collectionNme:String, callback:MongoCallback<Dynamic>):Void;
};
typedef AddUserOptions = {
	>CommonOptions,
	var fsync : Bool;
	@:optional
	var customData : Dynamic;
	@:optional
	var roles : Array<Dynamic>;
};
typedef FSyncOptions = {
	>CommonOptions,
	@:optional
	var fsync : Bool;
};
typedef Collection<TSchema> = {
	var collectionName : String;
	var namespace : String;
	var writeConcern : WriteConcern;
	var readConcern : ReadConcern;
	var hint : Dynamic;
	@:overload(function<T>(pipeline:Array<Dynamic>, callback:MongoCallback<AggregationCursor<T>>):AggregationCursor<T> { })
	@:overload(function<T>(?pipeline:Array<Dynamic>, ?options:CollectionAggregationOptions, ?callback:MongoCallback<AggregationCursor<T>>):AggregationCursor<T> { })
	function aggregate<T>(callback:MongoCallback<AggregationCursor<T>>):AggregationCursor<T>;
	@:overload(function(operations:Array<Dynamic>, ?options:CollectionBulkWriteOptions):Promise<BulkWriteOpResultObject> { })
	@:overload(function(operations:Array<Dynamic>, options:CollectionBulkWriteOptions, callback:MongoCallback<BulkWriteOpResultObject>):Void { })
	function bulkWrite(operations:Array<Dynamic>, callback:MongoCallback<BulkWriteOpResultObject>):Void;
	@:overload(function(query:Dynamic, callback:MongoCallback<Float>):Void { })
	@:overload(function(?query:Dynamic, ?options:MongoCountPreferences):Promise<Float> { })
	@:overload(function(query:Dynamic, options:MongoCountPreferences, callback:MongoCallback<Float>):Void { })
	function count(callback:MongoCallback<Float>):Void;
	@:overload(function(query:Dynamic, callback:MongoCallback<Float>):Void { })
	@:overload(function(?query:Dynamic, ?options:MongoCountPreferences):Promise<Float> { })
	@:overload(function(query:Dynamic, options:MongoCountPreferences, callback:MongoCallback<Float>):Void { })
	function countDocuments(callback:MongoCallback<Float>):Void;
	@:overload(function(fieldOrSpec:haxe.extern.EitherType<String, Dynamic>, ?options:IndexOptions):Promise<String> { })
	@:overload(function(fieldOrSpec:haxe.extern.EitherType<String, Dynamic>, options:IndexOptions, callback:MongoCallback<String>):Void { })
	function createIndex(fieldOrSpec:haxe.extern.EitherType<String, Dynamic>, callback:MongoCallback<String>):Void;
	@:overload(function(indexSpecs:Array<IndexSpecification>, ?options:{ @:optional
	var session : ClientSession; }):Promise<Dynamic> { })
	@:overload(function(indexSpecs:Array<IndexSpecification>, options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function createIndexes(indexSpecs:Array<IndexSpecification>, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(filter:Dynamic, ?options:CommonOptions):Promise<DeleteWriteOpResultObject> { })
	@:overload(function(filter:Dynamic, options:CommonOptions, callback:MongoCallback<DeleteWriteOpResultObject>):Void { })
	function deleteMany(filter:Dynamic, callback:MongoCallback<DeleteWriteOpResultObject>):Void;
	@:overload(function(filter:Dynamic, ?options:Dynamic):Promise<DeleteWriteOpResultObject> { })
	@:overload(function(filter:Dynamic, options:Dynamic, callback:MongoCallback<DeleteWriteOpResultObject>):Void { })
	function deleteOne(filter:Dynamic, callback:MongoCallback<DeleteWriteOpResultObject>):Void;
	@:overload(function<Key:(Dynamic)>(key:Key, query:Dynamic, callback:MongoCallback<Array<Dynamic>>):Void { })
	@:overload(function<Key:(Dynamic)>(key:Key, ?query:Dynamic, ?options:MongoDistinctPreferences):Promise<Array<Dynamic>> { })
	@:overload(function<Key:(Dynamic)>(key:Key, query:Dynamic, options:MongoDistinctPreferences, callback:MongoCallback<Array<Dynamic>>):Void { })
	@:overload(function(key:String, callback:MongoCallback<Array<Dynamic>>):Void { })
	@:overload(function(key:String, query:Dynamic, callback:MongoCallback<Array<Dynamic>>):Void { })
	@:overload(function(key:String, ?query:Dynamic, ?options:MongoDistinctPreferences):Promise<Array<Dynamic>> { })
	@:overload(function(key:String, query:Dynamic, options:MongoDistinctPreferences, callback:MongoCallback<Array<Dynamic>>):Void { })
	function distinct<Key:(Dynamic)>(key:Key, callback:MongoCallback<Array<Dynamic>>):Void;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(options:{ var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function drop(?options:{ var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(indexName:String, ?options:Dynamic):Promise<Dynamic> { })
	@:overload(function(indexName:String, options:Dynamic, callback:MongoCallback<Dynamic>):Void { })
	function dropIndex(indexName:String, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(?callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(options:{ @:optional
	var session : ClientSession; @:optional
	var maxTimeMS : Float; }, callback:MongoCallback<Dynamic>):Void { })
	function dropIndexes(?options:{ @:optional
	var session : ClientSession; @:optional
	var maxTimeMS : Float; }):Promise<Dynamic>;
	@:overload(function(query:Dynamic, callback:MongoCallback<Float>):Void { })
	@:overload(function(?query:Dynamic, ?options:MongoCountPreferences):Promise<Float> { })
	@:overload(function(query:Dynamic, options:MongoCountPreferences, callback:MongoCallback<Float>):Void { })
	function estimatedDocumentCount(callback:MongoCallback<Float>):Void;
	@:overload(function<T>(query:Dynamic, ?options:FindOneOptions):Cursor<T> { })
	function find<T>(?query:Dynamic):Cursor<T>;
	@:overload(function<T>(filter:Dynamic, ?options:FindOneOptions):Promise<haxe.extern.EitherType<T, Null<Dynamic>>> { })
	@:overload(function<T>(filter:Dynamic, options:FindOneOptions, callback:MongoCallback<haxe.extern.EitherType<T, Null<Dynamic>>>):Void { })
	function findOne<T>(filter:Dynamic, callback:MongoCallback<haxe.extern.EitherType<T, Null<Dynamic>>>):Void;
	@:overload(function(filter:Dynamic, ?options:FindOneAndDeleteOption):Promise<FindAndModifyWriteOpResultObject<TSchema>> { })
	@:overload(function(filter:Dynamic, options:FindOneAndDeleteOption, callback:MongoCallback<FindAndModifyWriteOpResultObject<TSchema>>):Void { })
	function findOneAndDelete(filter:Dynamic, callback:MongoCallback<FindAndModifyWriteOpResultObject<TSchema>>):Void;
	@:overload(function(filter:Dynamic, replacement:Dynamic, ?options:FindOneAndReplaceOption):Promise<FindAndModifyWriteOpResultObject<TSchema>> { })
	@:overload(function(filter:Dynamic, replacement:Dynamic, options:FindOneAndReplaceOption, callback:MongoCallback<FindAndModifyWriteOpResultObject<TSchema>>):Void { })
	function findOneAndReplace(filter:Dynamic, replacement:Dynamic, callback:MongoCallback<FindAndModifyWriteOpResultObject<TSchema>>):Void;
	@:overload(function(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, TSchema>, ?options:FindOneAndUpdateOption):Promise<FindAndModifyWriteOpResultObject<TSchema>> { })
	@:overload(function(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, TSchema>, options:FindOneAndUpdateOption, callback:MongoCallback<FindAndModifyWriteOpResultObject<TSchema>>):Void { })
	function findOneAndUpdate(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, TSchema>, callback:MongoCallback<FindAndModifyWriteOpResultObject<TSchema>>):Void;
	@:overload(function(x:Float, y:Float, ?options:GeoHaystackSearchOptions):Promise<Dynamic> { })
	@:overload(function(x:Float, y:Float, options:GeoHaystackSearchOptions, callback:MongoCallback<Dynamic>):Void { })
	function geoHaystackSearch(x:Float, y:Float, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(keys:haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Array<Dynamic>, haxe.extern.EitherType<haxe.Constraints.Function, Code>>>, condition:Dynamic, initial:Dynamic, reduce:haxe.extern.EitherType<haxe.Constraints.Function, Code>, finalize:haxe.extern.EitherType<haxe.Constraints.Function, Code>, command:Bool, ?options:{ @:optional
	var readPreference : Dynamic; @:optional
	var session : ClientSession; }):Promise<Dynamic> { })
	@:overload(function(keys:haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Array<Dynamic>, haxe.extern.EitherType<haxe.Constraints.Function, Code>>>, condition:Dynamic, initial:Dynamic, reduce:haxe.extern.EitherType<haxe.Constraints.Function, Code>, finalize:haxe.extern.EitherType<haxe.Constraints.Function, Code>, command:Bool, options:{ @:optional
	var readPreference : Dynamic; @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function group(keys:haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Array<Dynamic>, haxe.extern.EitherType<haxe.Constraints.Function, Code>>>, condition:Dynamic, initial:Dynamic, reduce:haxe.extern.EitherType<haxe.Constraints.Function, Code>, finalize:haxe.extern.EitherType<haxe.Constraints.Function, Code>, command:Bool, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(options:{ @:optional
	var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function indexes(?options:{ var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(indexes:haxe.extern.EitherType<String, Array<String>>, ?options:{ var session : ClientSession; }):Promise<Bool> { })
	@:overload(function(indexes:haxe.extern.EitherType<String, Array<String>>, options:{ var session : ClientSession; }, callback:MongoCallback<Bool>):Void { })
	function indexExists(indexes:haxe.extern.EitherType<String, Array<String>>, callback:MongoCallback<Bool>):Void;
	@:overload(function(?options:{ var full : Bool; var session : ClientSession; }):Promise<Dynamic> { })
	@:overload(function(options:{ var full : Bool; var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function indexInformation(callback:MongoCallback<Dynamic>):Void;
	function initializeOrderedBulkOp(?options:CommonOptions):OrderedBulkOperation;
	function initializeUnorderedBulkOp(?options:CommonOptions):UnorderedBulkOperation;
	@:overload(function(docs:Dynamic, ?options:CollectionInsertOneOptions):Promise<InsertWriteOpResult<Dynamic>> { })
	@:overload(function(docs:Dynamic, options:CollectionInsertOneOptions, callback:MongoCallback<InsertWriteOpResult<Dynamic>>):Void { })
	function insert(docs:Dynamic, callback:MongoCallback<InsertWriteOpResult<Dynamic>>):Void;
	@:overload(function(docs:Array<Dynamic>, ?options:CollectionInsertManyOptions):Promise<InsertWriteOpResult<Dynamic>> { })
	@:overload(function(docs:Array<Dynamic>, options:CollectionInsertManyOptions, callback:MongoCallback<InsertWriteOpResult<Dynamic>>):Void { })
	function insertMany(docs:Array<Dynamic>, callback:MongoCallback<InsertWriteOpResult<Dynamic>>):Void;
	@:overload(function(docs:Dynamic, ?options:CollectionInsertOneOptions):Promise<InsertOneWriteOpResult<Dynamic>> { })
	@:overload(function(docs:Dynamic, options:CollectionInsertOneOptions, callback:MongoCallback<InsertOneWriteOpResult<Dynamic>>):Void { })
	function insertOne(docs:Dynamic, callback:MongoCallback<InsertOneWriteOpResult<Dynamic>>):Void;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(options:{ var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function isCapped(?options:{ var session : ClientSession; }):Promise<Dynamic>;
	function listIndexes(?options:{ @:optional
	var batchSize : Float; @:optional
	var readPreference : Dynamic; @:optional
	var session : ClientSession; }):CommandCursor;
	@:overload(function<TKey, TValue>(map:haxe.extern.EitherType<Dynamic, String>, reduce:haxe.extern.EitherType<Dynamic, String>, ?options:MapReduceOptions):Promise<Dynamic> { })
	@:overload(function<TKey, TValue>(map:haxe.extern.EitherType<Dynamic, String>, reduce:haxe.extern.EitherType<Dynamic, String>, options:MapReduceOptions, callback:MongoCallback<Dynamic>):Void { })
	function mapReduce<TKey, TValue>(map:haxe.extern.EitherType<Dynamic, String>, reduce:haxe.extern.EitherType<Dynamic, String>, callback:MongoCallback<Dynamic>):Void;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(options:{ var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function options(?options:{ var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(?options:ParallelCollectionScanOptions):Promise<Array<Cursor<Dynamic>>> { })
	@:overload(function(options:ParallelCollectionScanOptions, callback:MongoCallback<Array<Cursor<Dynamic>>>):Void { })
	function parallelCollectionScan(callback:MongoCallback<Array<Cursor<Dynamic>>>):Void;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	@:overload(function(options:{ var session : ClientSession; }, callback:MongoCallback<Dynamic>):Void { })
	function reIndex(?options:{ var session : ClientSession; }):Promise<Dynamic>;
	@:overload(function(selector:Dynamic, ?options:Dynamic):Promise<WriteOpResult> { })
	@:overload(function(selector:Dynamic, ?options:Dynamic, ?callback:MongoCallback<WriteOpResult>):Void { })
	function remove(selector:Dynamic, callback:MongoCallback<WriteOpResult>):Void;
	@:overload(function(newName:String, ?options:{ @:optional
	var dropTarget : Bool; @:optional
	var session : ClientSession; }):Promise<Collection<TSchema>> { })
	@:overload(function(newName:String, options:{ @:optional
	var dropTarget : Bool; @:optional
	var session : ClientSession; }, callback:MongoCallback<Collection<TSchema>>):Void { })
	function rename(newName:String, callback:MongoCallback<Collection<TSchema>>):Void;
	@:overload(function(filter:Dynamic, doc:TSchema, ?options:ReplaceOneOptions):Promise<ReplaceWriteOpResult> { })
	@:overload(function(filter:Dynamic, doc:TSchema, options:ReplaceOneOptions, callback:MongoCallback<ReplaceWriteOpResult>):Void { })
	function replaceOne(filter:Dynamic, doc:TSchema, callback:MongoCallback<ReplaceWriteOpResult>):Void;
	@:overload(function(doc:TSchema, ?options:CommonOptions):Promise<WriteOpResult> { })
	@:overload(function(doc:TSchema, options:CommonOptions, callback:MongoCallback<WriteOpResult>):Void { })
	function save(doc:TSchema, callback:MongoCallback<WriteOpResult>):Void;
	@:overload(function(?options:{ var scale : Float; @:optional
	var session : ClientSession; }):Promise<CollStats> { })
	@:overload(function(options:{ var scale : Float; @:optional
	var session : ClientSession; }, callback:MongoCallback<CollStats>):Void { })
	function stats(callback:MongoCallback<CollStats>):Void;
	@:overload(function(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, ?options:Dynamic):Promise<WriteOpResult> { })
	@:overload(function(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, options:Dynamic, callback:MongoCallback<WriteOpResult>):Void { })
	function update(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, callback:MongoCallback<WriteOpResult>):Void;
	@:overload(function(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, ?options:UpdateManyOptions):Promise<UpdateWriteOpResult> { })
	@:overload(function(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, options:UpdateManyOptions, callback:MongoCallback<UpdateWriteOpResult>):Void { })
	function updateMany(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, callback:MongoCallback<UpdateWriteOpResult>):Void;
	@:overload(function(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, ?options:UpdateOneOptions):Promise<UpdateWriteOpResult> { })
	@:overload(function(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, options:UpdateOneOptions, callback:MongoCallback<UpdateWriteOpResult>):Void { })
	function updateOne(filter:Dynamic, update:haxe.extern.EitherType<Dynamic, Dynamic>, callback:MongoCallback<UpdateWriteOpResult>):Void;
	@:overload(function<T>(?options:Dynamic):ChangeStream<T> { })
	function watch<T>(?pipeline:Array<Dynamic>, ?options:Dynamic):ChangeStream<T>;
};
@:enum abstract BSONType(Int) {
	var Double = 1;
	var String = 2;
	var Object = 3;
	var Array = 4;
	var BinData = 5;
	var Undefined = 6;
	var ObjectId = 7;
	var Boolean = 8;
	var Date = 9;
	var Null = 10;
	var Regex = 11;
	var DBPointer = 12;
	var JavaScript = 13;
	var Symbol = 14;
	var JavaScriptWithScope = 15;
	var Int = 16;
	var Timestamp = 17;
	var Long = 18;
	var Decimal = 19;
	var MinKey = -1;
	var MaxKey = 127;
}
typedef CollStats = {
	var ns : String;
	var count : Float;
	var size : Float;
	var avgObjSize : Float;
	var storageSize : Float;
	var numExtents : Float;
	var nindexes : Float;
	var lastExtentSize : Float;
	var paddingFactor : Float;
	@:optional
	var userFlags : Float;
	var totalIndexSize : Float;
	var indexSizes : { var _id_ : Float; };
	var capped : Bool;
	var max : Float;
	var maxSize : Float;
	@:optional
	var wiredTiger : WiredTigerData;
	@:optional
	var indexDetails : Dynamic;
	var ok : Float;
};
typedef WiredTigerData = Dynamic;
typedef CollectionAggregationOptions = {
	@:optional
	var readPreference : Dynamic;
	@:optional
	var cursor : { @:optional
	var batchSize : Float; };
	@:optional
	var explain : Bool;
	@:optional
	var allowDiskUse : Bool;
	@:optional
	var maxTimeMS : Float;
	@:optional
	var bypassDocumentValidation : Bool;
	@:optional
	var hint : haxe.extern.EitherType<String, Dynamic>;
	@:optional
	var raw : Bool;
	@:optional
	var promoteLongs : Bool;
	@:optional
	var promoteValues : Bool;
	@:optional
	var promoteBuffers : Bool;
	@:optional
	var collation : CollationDocument;
	@:optional
	var comment : String;
	@:optional
	var session : ClientSession;
};
typedef CollectionInsertManyOptions = {
	>CommonOptions,
	@:optional
	var serializeFunctions : Bool;
	@:optional
	var forceServerObjectId : Bool;
	@:optional
	var bypassDocumentValidation : Bool;
	@:optional
	var ordered : Bool;
};
typedef CollectionBulkWriteOptions = {
	>CommonOptions,
	@:optional
	var serializeFunctions : Bool;
	@:optional
	var ordered : Bool;
	@:optional
	var bypassDocumentValidation : Bool;
	@:optional
	var forceServerObjectId : Bool;
};
typedef BulkWriteOpResultObject = {
	@:optional
	var insertedCount : Float;
	@:optional
	var matchedCount : Float;
	@:optional
	var modifiedCount : Float;
	@:optional
	var deletedCount : Float;
	@:optional
	var upsertedCount : Float;
	@:optional
	var insertedIds : Dynamic;
	@:optional
	var upsertedIds : Dynamic;
	@:optional
	var result : Dynamic;
};
typedef MongoCountPreferences = {
	@:optional
	var limit : Float;
	@:optional
	var skip : Float;
	@:optional
	var hint : String;
	@:optional
	var readPreference : Dynamic;
	@:optional
	var maxTimeMS : Float;
	@:optional
	var session : ClientSession;
};
typedef MongoDistinctPreferences = {
	@:optional
	var readPreference : Dynamic;
	@:optional
	var maxTimeMS : Float;
	@:optional
	var session : ClientSession;
};
typedef DeleteWriteOpResultObject = {
	var result : { @:optional
	var ok : Float; @:optional
	var n : Float; };
	@:optional
	var connection : Dynamic;
	@:optional
	var deletedCount : Float;
};
typedef FindAndModifyWriteOpResultObject<TSchema> = {
	@:optional
	var value : TSchema;
	@:optional
	var lastErrorObject : Dynamic;
	@:optional
	var ok : Float;
};
typedef FindOneAndReplaceOption = {
	>CommonOptions,
	@:optional
	var projection : Dynamic;
	@:optional
	var sort : Dynamic;
	@:optional
	var maxTimeMS : Float;
	@:optional
	var upsert : Bool;
	@:optional
	var returnOriginal : Bool;
	@:optional
	var collation : CollationDocument;
};
typedef FindOneAndUpdateOption = {
	>FindOneAndReplaceOption,
	@:optional
	var arrayFilters : Array<Dynamic>;
};
typedef FindOneAndDeleteOption = {
	@:optional
	var projection : Dynamic;
	@:optional
	var sort : Dynamic;
	@:optional
	var maxTimeMS : Float;
	@:optional
	var session : ClientSession;
	@:optional
	var collation : CollationDocument;
};
typedef GeoHaystackSearchOptions = {
	@:optional
	var readPreference : Dynamic;
	@:optional
	var maxDistance : Float;
	@:optional
	var search : Dynamic;
	@:optional
	var limit : Float;
	@:optional
	var session : ClientSession;
};
extern class Code {
	function new(code:haxe.extern.EitherType<String, haxe.Constraints.Function>, ?scope:Dynamic):Void;
	var code : haxe.extern.EitherType<String, haxe.Constraints.Function>;
	var scope : Dynamic;
}
typedef OrderedBulkOperation = {
	var length : Float;
	@:overload(function(?options:FSyncOptions):Promise<BulkWriteResult> { })
	@:overload(function(options:FSyncOptions, callback:MongoCallback<BulkWriteResult>):Void { })
	function execute(callback:MongoCallback<BulkWriteResult>):Void;
	function find(selector:Dynamic):FindOperatorsOrdered;
	function insert(doc:Dynamic):OrderedBulkOperation;
};
typedef BulkWriteResultUpsertedIdObject = {
	var index : Float;
	var _id : ObjectId;
};
typedef BulkWriteResult = {
	var ok : Bool;
	var nInserted : Float;
	var nMatched : Float;
	var nModified : Float;
	var nUpserted : Float;
	var nRemoved : Float;
	function getInsertedIds():Array<Dynamic>;
	function getLastOp():Dynamic;
	function getRawResponse():Dynamic;
	function getUpsertedIdAt(index:Float):BulkWriteResultUpsertedIdObject;
	function getUpsertedIds():Array<BulkWriteResultUpsertedIdObject>;
	function getWriteConcernError():WriteConcernError;
	function getWriteErrorAt(index:Float):WriteError;
	function getWriteErrorCount():Float;
	function getWriteErrors():Array<Dynamic>;
	function hasWriteErrors():Bool;
};
typedef WriteError = {
	var code : Float;
	var index : Float;
	var errmsg : String;
};
typedef WriteConcernError = {
	var code : Float;
	var errmsg : String;
};
typedef FindOperatorsOrdered = {
	function delete():OrderedBulkOperation;
	function deleteOne():OrderedBulkOperation;
	function replaceOne(doc:Dynamic):OrderedBulkOperation;
	function update(doc:Dynamic):OrderedBulkOperation;
	function updateOne(doc:Dynamic):OrderedBulkOperation;
	function upsert():FindOperatorsOrdered;
};
typedef UnorderedBulkOperation = {
	var length : Float;
	@:overload(function(?options:FSyncOptions):Promise<BulkWriteResult> { })
	@:overload(function(options:FSyncOptions, callback:MongoCallback<BulkWriteResult>):Void { })
	function execute(callback:MongoCallback<BulkWriteResult>):Void;
	function find(selector:Dynamic):FindOperatorsUnordered;
	function insert(doc:Dynamic):UnorderedBulkOperation;
};
typedef FindOperatorsUnordered = {
	var length : Float;
	function remove():UnorderedBulkOperation;
	function removeOne():UnorderedBulkOperation;
	function replaceOne(doc:Dynamic):UnorderedBulkOperation;
	function update(doc:Dynamic):UnorderedBulkOperation;
	function updateOne(doc:Dynamic):UnorderedBulkOperation;
	function upsert():FindOperatorsUnordered;
};
typedef FindOneOptions = {
	@:optional
	var limit : Float;
	@:optional
	var sort : haxe.extern.EitherType<Array<Dynamic>, Dynamic>;
	@:optional
	var projection : Dynamic;
	@:optional
	var fields : Dynamic;
	@:optional
	var skip : Float;
	@:optional
	var hint : Dynamic;
	@:optional
	var explain : Bool;
	@:optional
	var snapshot : Bool;
	@:optional
	var timeout : Bool;
	@:optional
	var tailable : Bool;
	@:optional
	var batchSize : Float;
	@:optional
	var returnKey : Bool;
	@:optional
	var maxScan : Float;
	@:optional
	var min : Float;
	@:optional
	var max : Float;
	@:optional
	var showDiskLoc : Bool;
	@:optional
	var comment : String;
	@:optional
	var raw : Bool;
	@:optional
	var promoteLongs : Bool;
	@:optional
	var promoteValues : Bool;
	@:optional
	var promoteBuffers : Bool;
	@:optional
	var readPreference : Dynamic;
	@:optional
	var partial : Bool;
	@:optional
	var maxTimeMS : Float;
	@:optional
	var collation : CollationDocument;
	@:optional
	var session : ClientSession;
};
typedef CollectionInsertOneOptions = {
	>CommonOptions,
	@:optional
	var serializeFunctions : Bool;
	@:optional
	var forceServerObjectId : Bool;
	@:optional
	var bypassDocumentValidation : Bool;
};
typedef InsertWriteOpResult<TSchema:({ var _id : Dynamic; })> = {
	var insertedCount : Float;
	var ops : Array<TSchema>;
	var insertedIds : { };
	var connection : Dynamic;
	var result : { var ok : Float; var n : Float; };
};
typedef InsertOneWriteOpResult<TSchema:({ var _id : Dynamic; })> = {
	var insertedCount : Float;
	var ops : Array<TSchema>;
	var insertedId : Array<TSchema>;
	var connection : Dynamic;
	var result : { var ok : Float; var n : Float; };
};
typedef ParallelCollectionScanOptions = {
	@:optional
	var readPreference : Dynamic;
	@:optional
	var batchSize : Float;
	@:optional
	var numCursors : Float;
	@:optional
	var raw : Bool;
	@:optional
	var session : ClientSession;
};
typedef ReplaceOneOptions = {
	>CommonOptions,
	@:optional
	var upsert : Bool;
	@:optional
	var bypassDocumentValidation : Bool;
};
typedef UpdateOneOptions = {
	>ReplaceOneOptions,
	@:optional
	var arrayFilters : Array<Dynamic>;
};
typedef UpdateManyOptions = {
	>CommonOptions,
	@:optional
	var upsert : Bool;
	@:optional
	var arrayFilters : Array<Dynamic>;
};
typedef UpdateWriteOpResult = {
	var result : { var ok : Float; var n : Float; var nModified : Float; };
	var connection : Dynamic;
	var matchedCount : Float;
	var modifiedCount : Float;
	var upsertedCount : Float;
	var upsertedId : { var _id : ObjectId; };
};
typedef ReplaceWriteOpResult = {
	>UpdateWriteOpResult,
	var ops : Array<Dynamic>;
};
typedef MapReduceOptions = {
	@:optional
	var readPreference : Dynamic;
	@:optional
	var out : Dynamic;
	@:optional
	var query : Dynamic;
	@:optional
	var sort : Dynamic;
	@:optional
	var limit : Float;
	@:optional
	var keeptemp : Bool;
	@:optional
	var finalize : haxe.extern.EitherType<haxe.Constraints.Function, String>;
	@:optional
	var scope : Dynamic;
	@:optional
	var jsMode : Bool;
	@:optional
	var verbose : Bool;
	@:optional
	var bypassDocumentValidation : Bool;
	@:optional
	var session : ClientSession;
};
typedef WriteOpResult = {
	var ops : Array<Dynamic>;
	var connection : Dynamic;
	var result : Dynamic;
};
extern class Cursor<T> extends js.node.stream.Readable<Cursor<T>> {
	var sortValue : String;
	var timeout : Bool;
	var readPreference : ReadPreference;
	function addCursorFlag(flag:String, value:Bool):Cursor<T>;
	function addQueryModifier(name:String, value:Bool):Cursor<T>;
	function batchSize(value:Float):Cursor<T>;
	function clone():Cursor<T>;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function close():Promise<Dynamic>;
	function collation(value:CollationDocument):Cursor<T>;
	function comment(value:String):Cursor<T>;
	@:overload(function(applySkipLimit:Bool, callback:MongoCallback<Float>):Void { })
	@:overload(function(options:CursorCommentOptions, callback:MongoCallback<Float>):Void { })
	@:overload(function(applySkipLimit:Bool, options:CursorCommentOptions, callback:MongoCallback<Float>):Void { })
	@:overload(function(?applySkipLimit:Bool, ?options:CursorCommentOptions):Promise<Float> { })
	function count(callback:MongoCallback<Float>):Void;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function explain():Promise<Dynamic>;
	function filter(filter:Dynamic):Cursor<T>;
	@:overload(function(iterator:IteratorCallback<T>):Promise<Void> { })
	function forEach(iterator:IteratorCallback<T>, callback:EndCallback):Void;
	@:overload(function(callback:MongoCallback<Bool>):Void { })
	function hasNext():Promise<Bool>;
	function hint(hint:haxe.extern.EitherType<String, Dynamic>):Cursor<T>;
	function isClosed():Bool;
	function limit(value:Float):Cursor<T>;
	function map<U>(transform:T -> U):Cursor<U>;
	function max(max:Dynamic):Cursor<T>;
	function maxAwaitTimeMS(value:Float):Cursor<T>;
	function maxScan(maxScan:Dynamic):Cursor<T>;
	function maxTimeMS(value:Float):Cursor<T>;
	function min(min:Dynamic):Cursor<T>;
	@:overload(function(callback:MongoCallback<haxe.extern.EitherType<T, Null<Dynamic>>>):Void { })
	function next():Promise<T>;
	function project(value:Dynamic):Cursor<T>;
	function read(size:Float):haxe.extern.EitherType<String, haxe.extern.EitherType<Buffer, Void>>;
	function returnKey(returnKey:Dynamic):Cursor<T>;
	function rewind():Void;
	function setCursorOption(field:String, value:Dynamic):Cursor<T>;
	function setReadPreference(readPreference:Dynamic):Cursor<T>;
	function showRecordId(showRecordId:Dynamic):Cursor<T>;
	function skip(value:Float):Cursor<T>;
	function snapshot(snapshot:Dynamic):Cursor<T>;
	function sort(keyOrList:haxe.extern.EitherType<String, haxe.extern.EitherType<Array<Dynamic>, Dynamic>>, ?direction:Float):Cursor<T>;
	function stream(?options:{ @:optional
	var transform : T -> Dynamic; }):Cursor<T>;
	@:overload(function(callback:MongoCallback<Array<T>>):Void { })
	function toArray():Promise<Array<T>>;
	function unshift(stream:haxe.extern.EitherType<Buffer, String>):Void;
}
typedef CursorCommentOptions = {
	@:optional
	var skip : Float;
	@:optional
	var limit : Float;
	@:optional
	var maxTimeMS : Float;
	@:optional
	var hint : String;
	@:optional
	var readPreference : Dynamic;
};
typedef IteratorCallback<T> = { };
typedef EndCallback = { };
extern class AggregationCursor<T> extends js.node.stream.Readable<AggregationCursor<T>> {
	function batchSize(value:Float):AggregationCursor<T>;
	function clone():AggregationCursor<T>;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function close():Promise<Dynamic>;
	function each(callback:MongoCallback<Dynamic>):Void;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function explain():Promise<Dynamic>;
	function geoNear(document:Dynamic):AggregationCursor<T>;
	function group<U>(document:Dynamic):AggregationCursor<U>;
	@:overload(function(callback:MongoCallback<Bool>):Void { })
	function hasNext():Promise<Bool>;
	function isClosed():Bool;
	function limit(value:Float):AggregationCursor<T>;
	function lookup(document:Dynamic):AggregationCursor<T>;
	function match(document:Dynamic):AggregationCursor<T>;
	function maxTimeMS(value:Float):AggregationCursor<T>;
	@:overload(function(callback:MongoCallback<haxe.extern.EitherType<T, Null<Dynamic>>>):Void { })
	function next():Promise<haxe.extern.EitherType<T, Null<Dynamic>>>;
	function out(destination:String):AggregationCursor<T>;
	function project<U>(document:Dynamic):AggregationCursor<U>;
	function read(size:Float):haxe.extern.EitherType<String, haxe.extern.EitherType<Buffer, Void>>;
	function redact(document:Dynamic):AggregationCursor<T>;
	function rewind():AggregationCursor<T>;
	function skip(value:Float):AggregationCursor<T>;
	function sort(document:Dynamic):AggregationCursor<T>;
	@:overload(function(callback:MongoCallback<Array<T>>):Void { })
	function toArray():Promise<Array<T>>;
	function unshift(stream:haxe.extern.EitherType<Buffer, String>):Void;
	function unwind<U>(field:String):AggregationCursor<U>;
}
extern class CommandCursor extends js.node.stream.Readable<CommandCursor> {
	@:overload(function(callback:MongoCallback<Bool>):Void { })
	function hasNext():Promise<Bool>;
	function batchSize(value:Float):CommandCursor;
	function clone():CommandCursor;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function close():Promise<Dynamic>;
	function each(callback:MongoCallback<Dynamic>):Void;
	function isClosed():Bool;
	function maxTimeMS(value:Float):CommandCursor;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function next():Promise<Dynamic>;
	function read(size:Float):haxe.extern.EitherType<String, haxe.extern.EitherType<Buffer, Void>>;
	function rewind():CommandCursor;
	function setReadPreference(readPreference:Dynamic):CommandCursor;
	@:overload(function(callback:MongoCallback<Array<Dynamic>>):Void { })
	function toArray():Promise<Array<Dynamic>>;
	function unshift(stream:haxe.extern.EitherType<Buffer, String>):Void;
}
extern class GridFSBucket {
	function new(db:Db, ?options:GridFSBucketOptions):Void;
	function delete(id:ObjectId, ?callback:GridFSBucketErrorCallback):Void;
	function drop(?callback:GridFSBucketErrorCallback):Void;
	function find(?filter:Dynamic, ?options:GridFSBucketFindOptions):Cursor<Dynamic>;
	function openDownloadStream(id:ObjectId, ?options:{ var start : Float; var end : Float; }):GridFSBucketReadStream;
	function openDownloadStreamByName(filename:String, ?options:{ var revision : Float; var start : Float; var end : Float; }):GridFSBucketReadStream;
	function openUploadStream(filename:String, ?options:GridFSBucketOpenUploadStreamOptions):GridFSBucketWriteStream;
	function openUploadStreamWithId(id:Dynamic, filename:String, ?options:GridFSBucketOpenUploadStreamOptions):GridFSBucketWriteStream;
	function rename(id:ObjectId, filename:String, ?callback:GridFSBucketErrorCallback):Void;
}
typedef GridFSBucketOptions = {
	@:optional
	var bucketName : String;
	@:optional
	var chunkSizeBytes : Float;
	@:optional
	var writeConcern : WriteConcern;
	@:optional
	var readPreference : Dynamic;
};
typedef GridFSBucketErrorCallback = Dynamic;
typedef GridFSBucketFindOptions = {
	@:optional
	var batchSize : Float;
	@:optional
	var limit : Float;
	@:optional
	var maxTimeMS : Float;
	@:optional
	var noCursorTimeout : Bool;
	@:optional
	var skip : Float;
	@:optional
	var sort : Dynamic;
};
typedef GridFSBucketOpenUploadStreamOptions = {
	@:optional
	var chunkSizeBytes : Float;
	@:optional
	var metadata : Dynamic;
	@:optional
	var contentType : String;
	@:optional
	var aliases : Array<String>;
};
extern class GridFSBucketReadStream extends js.node.stream.Readable<GridFSBucketReadStream> {
	var id : ObjectId;
	function new(chunks:Collection<Dynamic>, files:Collection<Dynamic>, readPreference:Dynamic, filter:Dynamic, ?options:GridFSBucketReadStreamOptions):Void;
}
typedef GridFSBucketReadStreamOptions = {
	@:optional
	var sort : Float;
	@:optional
	var skip : Float;
	@:optional
	var start : Float;
	@:optional
	var end : Float;
};
extern class GridFSBucketWriteStream extends js.node.stream.Writable<GridFSBucketWriteStream> {
	var id : Dynamic;
	function new(bucket:GridFSBucket, filename:String, ?options:GridFSBucketWriteStreamOptions):Void;
	function abort(?callback:GridFSBucketErrorCallback):Void;
}
typedef GridFSBucketWriteStreamOptions = {
	>WriteConcern,
	@:optional
	var id : Dynamic;
	@:optional
	var chunkSizeBytes : Float;
	@:optional
	var disableMD5 : Bool;
};
extern class TypedEventEmitter<Events> {
	function addListener<E:(Events)>(event:E, listener:Array<Events>):TypedEventEmitter<Events>;
	function on<E:(Events)>(event:E, listener:Array<Events>):TypedEventEmitter<Events>;
	function once<E:(Events)>(event:E, listener:Array<Events>):TypedEventEmitter<Events>;
	function prependListener<E:(Events)>(event:E, listener:Array<Events>):TypedEventEmitter<Events>;
	function prependOnceListener<E:(Events)>(event:E, listener:Array<Events>):TypedEventEmitter<Events>;
	function off<E:(Events)>(event:E, listener:Array<Events>):TypedEventEmitter<Events>;
	function removeAllListeners<E:(Events)>(?event:E):TypedEventEmitter<Events>;
	function removeListener<E:(Events)>(event:E, listener:Array<Events>):TypedEventEmitter<Events>;
	function emit<E:(Events)>(event:E, args:haxe.extern.Rest<Dynamic>):Bool;
	function eventNames():Array<Events>;
	function rawListeners<E:(Events)>(event:E):Array<haxe.Constraints.Function>;
	function listeners<E:(Events)>(event:E):Array<haxe.Constraints.Function>;
	function listenerCount<E:(Events)>(event:E):Float;
	function getMaxListeners():Float;
	function setMaxListeners(maxListeners:Float):TypedEventEmitter<Events>;
}
typedef ChangeStreamEvents<TSchema> = {
	var change : Dynamic -> Void;
	var close : Void -> Void;
	var end : Void -> Void;
	var error : MongoError -> Void;
	var resumeTokenChanged : ResumeToken -> Void;
};
extern class ChangeStream<TSchema> extends TypedEventEmitter<ChangeStreamEvents<TSchema>> {
	var resumeToken : ResumeToken;
	function new(parent:haxe.extern.EitherType<MongoClient, haxe.extern.EitherType<Db, Collection<TSchema>>>, pipeline:Array<Dynamic>, ?options:ChangeStreamOptions):Void;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function close():Promise<Dynamic>;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function hasNext():Promise<Dynamic>;
	function isClosed():Bool;
	@:overload(function(callback:MongoCallback<Dynamic>):Void { })
	function next():Promise<Dynamic>;
	function stream(?options:{ @:optional
	var transform : haxe.Constraints.Function; }):Cursor<TSchema>;
}
extern class ResumeToken {

}
typedef ChangeEventBase<TSchema> = {
	var _id : ResumeToken;
	var ns : { var db : String; var coll : String; };
	var clusterTime : Timestamp;
	@:optional
	var txnNumber : Float;
	@:optional
	var lsid : { var id : Dynamic; var uid : Dynamic; };
};
typedef ChangeEventCR<TSchema> = {
	>ChangeEventBase<TSchema>,
	var operationType : haxe.extern.EitherType<String, String>;
	@:optional
	var fullDocument : TSchema;
	var documentKey : { var _id : Dynamic; };
};
typedef ChangeEventUpdate<TSchema> = {
	>ChangeEventBase<TSchema>,
	var operationType : String;
	var updateDescription : { var updatedFields : Dynamic; var removedFields : Array<haxe.extern.EitherType<TSchema, String>>; };
	@:optional
	var fullDocument : TSchema;
	var documentKey : { var _id : Dynamic; };
};
typedef ChangeEventDelete<TSchema> = {
	>ChangeEventBase<TSchema>,
	var operationType : String;
	var documentKey : { var _id : Dynamic; };
};
typedef ChangeEventRename<TSchema> = {
	>ChangeEventBase<TSchema>,
	var operationType : String;
	var to : { var db : String; var coll : String; };
};
typedef ChangeEventOther<TSchema> = {
	>ChangeEventBase<TSchema>,
	var operationType : haxe.extern.EitherType<String, String>;
};
typedef ChangeEventInvalidate<TSchema> = {
	var _id : ResumeToken;
	var operationType : String;
	var clusterTime : Timestamp;
};
typedef ChangeStreamOptions = {
	@:optional
	var fullDocument : haxe.extern.EitherType<String, String>;
	@:optional
	var maxAwaitTimeMS : Float;
	@:optional
	var resumeAfter : ResumeToken;
	@:optional
	var startAfter : ResumeToken;
	@:optional
	var startAtOperationTime : Timestamp;
	@:optional
	var batchSize : Float;
	@:optional
	var collation : CollationDocument;
	@:optional
	var readPreference : Dynamic;
};
typedef LoggerOptions = {
	@:optional
	var loggerLevel : String;
	@:optional
	var logger : Dynamic;
};
typedef LoggerState = {
	var type : String;
	var message : String;
	var className : String;
	var pid : Float;
	var date : Float;
};
extern class Logger {
	function new(className:String, ?options:LoggerOptions):Void;
	function debug(message:String, state:LoggerState):Void;
	function warn(message:String, state:LoggerState):Void;
	function info(message:String, state:LoggerState):Void;
	function error(message:String, state:LoggerState):Void;
	function isInfo():Bool;
	function isError():Bool;
	function isWarn():Bool;
	function isDebug():Bool;
	static function reset():Void;
	static function currentLogger():Dynamic;
	static function setCurrentLogger(log:Dynamic):Void;
	static function filter(type:String, values:Array<String>):Void;
	static function setLevel(level:String):Void;
}
typedef CollationDocument = {
	var locale : String;
	@:optional
	var strength : Float;
	@:optional
	var caseLevel : Bool;
	@:optional
	var caseFirst : String;
	@:optional
	var numericOrdering : Bool;
	@:optional
	var alternate : String;
	@:optional
	var maxVariable : String;
	@:optional
	var backwards : Bool;
	@:optional
	var normalization : Bool;
};
typedef IndexSpecification = {
	var key : Dynamic;
	@:optional
	var name : String;
	@:optional
	var background : Bool;
	@:optional
	var unique : Bool;
	@:optional
	var partialFilterExpression : Dynamic;
	@:optional
	var sparse : Bool;
	@:optional
	var expireAfterSeconds : Float;
	@:optional
	var storageEngine : Dynamic;
	@:optional
	var weights : Dynamic;
	@:optional
	var default_language : String;
	@:optional
	var language_override : String;
	@:optional
	var textIndexVersion : Float;
    @:optional
    @:native("2dsphereIndexVersion")
	var _2dsphereIndexVersion : Float;
	@:optional
	var bits : Float;
	@:optional
	var min : Float;
	@:optional
	var max : Float;
	@:optional
	var bucketSize : Float;
	@:optional
	var collation : CollationDocument;
};
@:jsRequire('mongodb')
extern class Mongo {
	// @:override(function(uri:String, callback:MongoCallback<MongoClient>) {})
	// @:override(function(uri:String, options:MongoClientOptions, callback:MongoCallback<MongoClient>) {})
	static function connect(uri:String, ?options:Dynamic):Promise<MongoClient>;
}
