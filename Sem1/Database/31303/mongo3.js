var mapFun = function(){emit(this.roll,this.age)};
var reduceFun = function(key,values){
    return Array.sum(values);
}

var reduceAvg = function(key,values){
    return Array.avg(values);
}

var mincal = function(key,values){
    return Math.min(...values);
}

db.Map.mapReduce(mapFun,mincal,{'out':'outmin'});

db.outmin.find().pretty();

db.Map.mapReduce(mapFun,reduceFun,{'out':'output'});

db.Map.mapReduce(mapFun,reduceAvg,{'out':'outputAvg'});



db.Map.insert({roll:101,age:25})

db.Map.insert({roll:102,age:30})

db.Map.insert({roll:101,age:35})

db.Map.insert({roll:101,age:40})

db.Map.insert({roll:104,age:45})

for(var i=10;i<=60;i+=10){db.Map.insert({roll:104,age:i})}