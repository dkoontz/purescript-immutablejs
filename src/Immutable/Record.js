// module Immutable.Record

var Record = require('immutable').Record;

exports.create = function (keysAndDefaultValues) { return Record(keysAndDefaultValues)(); };
exports.get = function (key, record) { return record.get(key); };
exports.set = function (key, value, record) { return record.set(key, value); };

exports._unsafeGetProperty = function (key, record) { return record.get(key); };
exports._unsafeSetProperty = function (key, value, record) { return record.set(key, value); };

// function errorIfUndefined(key, value)
// {
//   if (value === undefined)
//   {
//     throw new Error('property ' + key + ' is not valid for this record');
//   }
//
//   return value;
// }
