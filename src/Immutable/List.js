// module Immutable.List

var List = require('immutable').List;
var Maybe = require('Data.Maybe');

exports.create = function (array) { return List(array); };
exports.size = function (list) { return list.size; };

exports._set = function (index, value, list) { return list.set(index, value); };
exports._delete = function (index, list) { return list.delete(index); };
exports.clear = function (list) { return list.clear(); };
exports._push = function (value, list) { return list.push(value); };
exports.pop = function (list) { return list.pop(); };
exports._unshift = function (array, list) { return list.unshift(array); };
exports._get = function (index, list) { return toNothingIf(list.get(index, undefined)); };
exports.first = function (list) { return toNothingIf(list.first(), undefined); };
exports.last = function (list) { return toNothingIf(list.last(), undefined); };
exports.toArray = function (list) { return list.toArray(); };
exports._filterNot = function (filterFn, list) { return list.filterNot(filterFn); };

function toNothingIf(value, shouldBeNothingIf)
{
  return value === shouldBeNothingIf ? Maybe.Nothing.value : Maybe.Just.create(value);
}
