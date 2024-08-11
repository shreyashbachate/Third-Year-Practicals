var mapfun = function(){emit(this.roll,this.age)}

var reducefun = function(key,values){return Array.sum(values)}

db.MapReduce.mapReduce(mapfun,reduccefun,{'out':'res_mapreduce'})

db.res_mapreduce.find()

var map = function() {
    emit('age', this.age);
}

var reduce_min = function(key, values) {
    var min = values[0];
    values.forEach(function(val) {
        if (val < min) min = val;
    })
    return min;
};

var reduce_max = function(key, values) {
    var max = values[0];
    values.forEach(function(val){
        if (val > max) max = val;
    })
    return max;
}

var min = db.Map.mapReduce(map, reduce_min, {out:{inline:1}}).results[0].value;
var max = db.Map.mapReduce(map, reduce_max, {out:{inline:1}}).results[0].value;
print("Min: " + min + ", max: " + max);


db.createCollection("MapReduce");

db.MapReduce.insert({roll:100,name:'ABC',age:'20'});

db.MapReduce.insert({roll:100,name:'PQR',age:'25'});

db.MapReduce.insert({roll:101,name:'JKL',age:'30'});

db.MapReduce.insert({roll:100,name:'XYZ',age:'35'});

db.MapReduce.insert({roll:102,name:'EFG',age:'35'});

db.MapReduce.find().pretty()

db.createCollection("Map")

db.Map.insert({roll:101,name:'ABC',age:20})

db.Map.insert({roll:101,name:'EFG',age:25})

db.Map.insert({roll:102,name:'PQR',age:30})

db.Map.insert({roll:101,name:'JKL',age:30})

db.Map.insert({roll:103,name:'XYZ',age:35})

db.map.find.pretty()




















