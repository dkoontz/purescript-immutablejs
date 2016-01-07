// module Immutable.List

var List = require('immutable').List;

exports.makeList = function (array) { return List(array); };
exports.size = function (list) { return list.size; };

exports._push = function (value, list) { return list.push(value); };
exports._set = function (index, value, list) { return list.set(index, value); };
exports._filterNot = function (filterFn, list) { return list.filterNot(filterFn); };
