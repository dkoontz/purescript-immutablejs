// module Immutable.Map

var Map = require('immutable').Map;
var Maybe = require('Data.Maybe');

// foreign import create :: forall k v r. Record r -> Map k v
exports.create = function (object) { return Map(object); };

// foreign import size :: forall k v. Map k v -> Number
exports.size = function (map) { return map.size(); };

// set :: forall k v. k -> v -> Map k v -> Map k v
exports._set = function (key, value, map) { return map.set(key, value); };

// delete :: forall k v. k -> Map k v -> Map k v
exports._delete = function (key, map) { return map.delete(key); };

// clear :: forall k v. Map k v -> Map k v
exports._clear = function (map) { return map.clear(); };

// get :: forall k v. k -> Map k v -> Maybe v
exports._get = function (key, map) {
  var result = map.get(key, null);
  return result === null ? Maybe.Nothing.value : Maybe.Just.create(result);
};
