db.student.explain("executionStats").find({name:"Lion"})

db.student.createIndex({name:-1})

db.student.getIndexes()

db.student.aggregate([{$match:{name:"Bye"}}])

db.student.aggregate([{$skip:2}])

db.student.aggregate([{$limit:2}])

db.student.aggregate([{$match:{"address.city":"Mumbai"}}])

db.student.aggregate([{$match:{"address.country":"India"}}])

db.student.aggregate([{$match:{name:"Bye"}}])

db.student.aggregate([{$avg:{age}}])

db.student.aggregate({$sort:{age:-1}})

db.student.aggregate({$group:{_id:null, avgval: {$avg:"$age"}}})
