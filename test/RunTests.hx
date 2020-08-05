package;

import tink.unit.*;
import tink.testrunner.*;
import tink.CoreApi;

using Lambda;
using bp.test.Utils;
import tink.testrunner.Reporter;
import bp.Mongo;
class RunTests {
	static function main() {
		ANSI.stripIfUnavailable = false;
		var reporter = new BasicReporter(new AnsiFormatter());
		Runner.run(TestBatch.make([new Test(),]), reporter).handle(Runner.exit);
	}
}
@:asserts
class Test {
	public function new() {

	}

	public function connect() {
		bp.Mongo.connect(js.node.Fs.readFileSync('./secrets/cnxStr.txt').toString(), (err, client) -> {
			if(err != null) asserts.assert(false, '$err');
			else asserts.assert(true, 'Connected');
			asserts.done();
		});
		return asserts;
	}


}