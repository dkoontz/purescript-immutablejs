// module Immutable.OrderedMap

var OrderedMap = require('immutable').OrderedMap;
var Maybe = require('Data.Maybe');

exports.fromRecord = function (object) { return OrderedMap(object); };

exports.size = function (om) { return om.size(); };

exports._set = function (key, value, om) { return om.set(key, value); };

exports._delete = function (key, om) { return om.delete(key); };

exports._clear = function (om) { return om.clear(); };

exports._get = function (key, om) {
  var result = om.get(key, null);
  return result === null ? Maybe.Nothing.value : Maybe.Just.create(result);
};

exports._withMutations = function(om, mutationFunc){
  return om.withMutations(function(map){
    mutationFunc(map)();
  });
};

exports._setmut = function (key, value, om) {
  return function(){
    return om.set(key, value);
  };
};
