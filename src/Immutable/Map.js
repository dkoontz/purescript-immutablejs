// module Immutable.Map

var Map = require('immutable').Map;
var Maybe = require('Data.Maybe');

// foreign import create :: forall k v r. Object r -> Map k v
exports.create = function (object) { return Map(object); };

// foreign import size :: forall k v. Map k v -> Number
exports.size = function (map) { return map.size(); };

// set :: forall k v. k -> v -> Map k v -> Map k v
exports._set = function (key, value, map) { return map.set(key, value); };

// delete :: forall k v. k -> Map k v -> Map k v
exports._delete = function (key, map) { return map.delete(key); };

// clear :: forall k v. Map k v -> Map k v
exports._clear = function (map) { return map.clear(); };

// update :: forall k v. k -> (v -> v) -> Map k v -> Map k v
exports._update = function (key, updateFn, map) { return map.update(key, updateFn); };

// merge :: forall k v. Map k v -> Map k v -> Map k v
exports._merge = function (newValues, originalValues) { return originalValues.merge(newValues); };

// get :: forall k v. k -> Map k v -> Maybe v
exports._get = function (key, map) {
  var result = map.get(key, null);
  return result === null ? Maybe.Nothing.value : Maybe.Just.create(result);
};

// has :: forall k v. k -> Map k v -> Boolean
exports._has = function (key, map) { return map.has(key); };

// includes :: forall k v. v -> Map k v -> Boolean
exports._includes = function (value, map) { return map.includes(value); };

// map :: forall k v. (v -> v) -> Map k v -> Map k v
exports._map = function (mapFn, map) { return map.map(mapFn); };

// filter :: forall k v. (v -> Boolean) -> Map k v -> Map k v
exports._filter = function (predicateFn, map) { return map.filter(predicateFn); };

// filterNot :: forall k v. (v -> Boolean) -> Map k v -> Map k v
exports._filterNot = function (predicateFn, map) { return map.filterNot(predicateFn); };
