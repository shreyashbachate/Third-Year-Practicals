db.mobile.createIndex({"Version":1}).explain("executionStats").pretty();

db.mobile.getIndexes();

db.mobile.count({price:{$gt:15000}});

db.mobile.aggregate({$group:{_id:"$name",price:{$min:"$price"}}},{$sort:{price:1}});

db.mobile.aggregate({$group:{_id:"$name",price:{$min:"$price"}}},{$sort:{price:1}},{$limit:5});

db.mobile.aggregate({$group:{_id:"$name",price:{$min:"$price"}}},{$sort:{price:1}},{$skip:5});

db.mobile.aggregate({$group:{_id:"$brand",price:{$sum:"$price"}}},{$sort:{price:1}});

db.mobile.aggregate([{$group:{_id:"$brand",price:{$first:"$price"}}},{$sort:{price:-1}},{$limit:10}]).pretty()

db.mobile.aggregate([{$group:{_id:"$specification.RAM",price:{$first:"$price"}}},{$sort:{price:-1}},{$limit:10}]).pretty()

db.mobile.aggregate([{$group:{_id:"$specification.RAM",price:{$max:"$price"}}},{$sort:{price:-1}},{$limit:10}]).pretty()

db.mobile.aggregate([{$group:{_id:"$specification.RAM",price:{$first:"$price"}}},{$sort:{price:-1}},{$limit:10},{$skip:3}]).pretty()

db.mobile.aggregate([{$unwind:"$specification.Color"}]).pretty()

db.mobile.aggregate([{$match:{"brand":"Real Me"}}]).pretty();


//
db.student.aggregate([{$match:{name:"Bye"}}])

db.student.aggregate([{$skip:2}])

db.student.aggregate([{$limit:2}])

db.student.aggregate([{$match:{"address.city":"Mumbai"}}])

db.student.aggregate([{$match:{"address.country":"India"}}])

db.student.aggregate([{$match:{name:"Bye"}}])

db.student.aggregate([{$avg:{age}}])

db.student.aggregate({$sort:{age:-1}})

db.student.aggregate({$group:{_id:null, avgval: {$avg:"$age"}}})