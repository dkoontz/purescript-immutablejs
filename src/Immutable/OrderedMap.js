// module Immutable.OrderedMap

var OrderedMap = require('immutable').OrderedMap;
var Maybe = require('Data.Maybe');

// foreign import create :: forall k v r. Object r -> OrderedMap k v
exports.create = function (object) { return OrderedMap(object); };

// foreign import size :: forall k v. OrderedMap k v -> Number
exports.size = function (om) { return om.size(); };

// set :: forall k v. k -> v -> OrderedMap k v -> OrderedMap k v
exports._set = function (key, value, om) { return om.set(key, value); };

// delete :: forall k v. k -> OrderedMap k v -> OrderedMap k v
exports._delete = function (key, om) { return om.delete(key); };

// clear :: forall k v. OrderedMap k v -> OrderedMap k v
exports._clear = function (om) { return om.clear(); };

// get :: forall k v. k -> OrderedMap k v -> Maybe v
exports._get = function (key, om) {
  var result = om.get(key, null);
  return result === null ? Maybe.Nothing.value : Maybe.Just.create(result);
};
