// module Immutable.IRecord

var Record = require('immutable').Record;

exports.makeRecord = function (keysAndDefaultValues) { return Record(keysAndDefaultValues)(); };
// exports._merge = function (object, record) { return record.merge(object); };

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
