db.createCollection('Student');

show collections;

db.student.insert({roll_no:31303,name:'Shreyash',age:20,address:{city:'Pune',state:'MH',country:'India'}});

db.student.insert({roll_no:101,name:'Hello',age:15,address:{city:'Mumbai',state:'MH',country:'India'}});

db.student.insert({_id:1,roll_no:101,name:'Hi',age:15,address:{city:'Mumbai',state:'MH',country:'India'}});

db.student.insert({roll_no:102,name:'Bye',age:16,address:{city:'Sangali',state:'MH',country:'India'}});

db.student.insert({roll_no:103,name:'Walter',age:20,address:{city:'Satara',state:'MH',country:'India'}});

db.student.insert({roll_no:104,name:'Thor',age:20,address:{city:'Kolhapur',state:'MH',country:'India'}});

db.student.find().pretty();

db.student.update({name:'Hi'},{$set:{roll_no:105}});

db.student.update({name:'Hi'},{$set:{address:{city:'Bombay',state:'MH',country:'India'}}});

db.student.update({age:20},{$set:{age:22}},{multi:true});

db.student.remove({age:16});

db.student.update({age:16},{$set:{name:'Bye'}},{upsert:true});

db.student.find().sort({age:1});

db.student.find().sort({age:-1});

db.student.find().sort({address:1}).limit(4);

db.student.insert([{name:'Lion'},{name:'Jaguar'}]);

db.student.find({$and:[{age:16},{name:'Bye'}]});


