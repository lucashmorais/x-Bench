/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

var {assert, expect, Expect} = require("../assertions");

// exception used for testing throws()
function Err() { }

const TEST_DATA = [
  { fun: "pass", params: ["has to pass"], result: true},
  { fun: "fail", params: ["has to fail"], result: false},

  { fun: "ok", params: [true, "true has to pass"], result: true},
  { fun: "ok", params: [false, "false has to fail"], result: false},
  { fun: "ok", params: [0, "0 has to fail"], result: false},
  { fun: "ok", params: [1, "1 has to pass"], result: true},
  { fun: "ok", params: [2, "2 has to pass"], result: true},
  { fun: "ok", params: ["", "empty string has to fail"], result: false},
  { fun: "ok", params: ["test", "non-empty string has to pass"], result: true},
  { fun: "ok", params: [null, "null has to fail"], result: false},
  { fun: "ok", params: [undefined, "undefined has to fail"], result: false},

  { fun: "equal", params: [true, true, "Values are equal"], result: true},
  { fun: "equal", params: [true, false, "Values are not equal"], result: false},
  { fun: "equal", params: [null, undefined, "Types are not equal"], result: false},
  { fun: "equal", params: [undefined, false, "Types are not equal"], result: false},
  { fun: "equal", params: ["str", "str", "Strings are equal"], result: true},

  { fun: "deepEqual", params: [{a: 1, b: ["y", "z"]}, {a: 1, b: ["y", "z"]}, "Objects are equal"], result: true},
  { fun: "deepEqual", params: [[3, 4], [3, 4], "Arrays are equal"], result: true},
  { fun: "deepEqual", params: [[5, 4], [4, 5], "Arrays are not equal"], result: false},
  { fun: "deepEqual", params: ["str", "str", "Strings are equal"], result: true},
  { fun: "deepEqual", params: [undefined, false, "Objects are not equal"], result: false},

  { fun: "notEqual", params: [true, true, "Values are equal"], result: false},
  { fun: "notEqual", params: [true, false, "Values are not equal"], result: true},
  { fun: "notEqual", params: [undefined, null, "Types are not equal"], result: true},

  { fun: "notDeepEqual", params: [{}, {a: 4}, "Objects are not equal"], result: true},
  { fun: "notDeepEqual", params: [{}, {}, "Objects are equal"], result: false},

  { fun: "match", params: ["Mozilla", /Mozilla/, "regex matches string"], result: true},
  { fun: "match", params: ["Mozilla", /mozilla/, "regex does not match string"], result: false},
  { fun: "match", params: ["Mozilla", /mozilla/i, "regex matches string"], result: true},

  { fun: "notMatch", params: ["Mozilla", /firefox/, "regex does not match string"], result: true},
  { fun: "notMatch", params: ["Mozilla", /Mozilla/, "regex matches string"], result: false},

  { fun: "waitFor", params: [function () { return true; }, "Evaluation pass"], result: true},
  { fun: "waitFor", params: [function () { return false; }, "Evaluation fail"], result: false},

  { fun: "throws", params: [function () { throw new Error(); }, undefined, "Throws an error"], result: true},
  { fun: "throws", params: [function () { throw new Error(); }, Error, "Throws a specific error"], result: true},
  { fun: "throws", params: [function () { throw new Error(); }, Err, "Catches the wrong error"], result: false, throws: Error},
  { fun: "throws", params: [function () { }, undefined, "Throws no error"], result: false},

  { fun: "doesNotThrow", params: [function () { }, undefined, "Throws no error"], result: true},
  { fun: "doesNotThrow", params: [function () { }, Error, "Throws no specific error"], result: true},
  { fun: "doesNotThrow", params: [function () { throw new Error(); }, Error, "Doesn't throw on named exception"], result: false},
  { fun: "doesNotThrow", params: [function () { throw new Error(); }, Err, "Catches wrong error"], result: false, throws: Error},
  { fun: "doesNotThrow", params: [function () { throw new Error(); }, undefined, "Throws error"], result: false, throws: Error}
];


/**
 * Soft expect class for assertions which should not add failing and passing frames
 */
function SoftExpect() { }

SoftExpect.prototype = new Expect();
SoftExpect.prototype.constructor = SoftExpect;


SoftExpect.prototype._logPass = function SoftExpect__logPass(aResult) {
  // We do not want to add a passing frame but only take care of the
  // return values of the _test method
}

SoftExpect.prototype._logFail = function SoftExpect__logFail(aResult) {
  // We do not want to add a failing frame but only take care of the
  // return values of the _test function
}


function setupModule(aModule) {
  softExpect = new SoftExpect();
}

function teardownModule(aModule) {
}

/**
 * Tests for supported expect methods
 */
function testExpect() {
  for each (var test in TEST_DATA) {
    let message = "except." + test.fun + " for [" +
                  test.params.join(", ") + "]";

    if (test.throws) {
      assert.throws(function () {
        expect[test.fun].apply(softExpect, test.params);
      }, test.throws, message);
    }
    else {
      expect.equal(expect[test.fun].apply(softExpect, test.params),
                   test.result, message);
    }
  }
}

/**
 * Tests for supported assert methods
 */
function testAssert() {
  for each (var test in TEST_DATA) {
    let message = "assert." + test.fun + " for [" +
                  test.params.join(", ") + "]";

    if (test.result === true) {
      expect.doesNotThrow(function () {
        assert[test.fun].apply(assert, test.params);
      }, Error, message);
    }
    else {
      assert.throws(function () {
        assert[test.fun].apply(assert, test.params);
      }, test.throws, message);
    }
  }
}
