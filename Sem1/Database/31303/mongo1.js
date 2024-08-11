db.createCollection("mobile");

db.mobile.insert({name:"Realme 2 Pro",brand:"Real Me",version:2,specification:{RAM:4,ROM:64,processor:"SD 666",Camera:16,color:["Blue","Black"]},price:15000,offer:true,warranty:1});

db.mobile.insert({name:"Nord 2",brand:"One Plus",Version:1,specification:{RAM:8,ROM:128,processor:"Mediatek Dimensity 1200",Camera:48,Color:["Blue","Grey","Green"]},price:28000,offer:false,warranty:2})

db.mobile.insert({name:"Iphone 13",brand:"Apple",Version:2,specification:{RAM:6,ROM:128,processor:"A12 Bionic",Camera:18,Color:["Red","Space Grey","Midnight Black"]},price:80000,offer:false,warranty:0})

db.mobile.insert({name:"Iphone 14",brand:"Apple",Version:2,specification:{RAM:6,ROM:128,processor:"A12 Bionic",Camera:18,Color:["Red","Space Grey","Midnight Black"]},price:80000,offer:false,warranty:1})

db.mobile.insert({name:"Nokia 3310",brand:"Nokia",Version:1,specification:{RAM:1,ROM:0,processor:"NA",Camera:"NA",Color:["Grey","Black"]},price:1600,offer:true,warranty:10})

db.mobile.insert({name:"Pixel 6a",brand:"Google",Version:1,specification:{RAM:6,ROM:128,processor:"Google Tensor",Camera:12,Color:["Charcoal","Grey"]},price:35000,offer:true,warranty:10})

db.mobile.insert({name:"Edge 30",brand:"Motorola",Version:1,specification:{RAM:6,ROM:128,processor:"Qualcomm Snapdragon 778G",Camera:50,Color:["Aurora Green","Meteor Grey"]},price:27000,offer:true,warranty:1})

db.mobile.insert({name:"Narzo 30",brand:"Real Me",Version:1,specification:{RAM:6,ROM:128,processor:"Snapdragon 880",Camera:50,Color:["Aurora Green","Meteor Grey"]},price:17000,offer:true,warranty:1})

db.mobile.insert({name:"J7 6",brand:"Samsung",Version:1,specification:{RAM:2,ROM:16,processor:"Octacore",Camera:18,Color:["Golden","Grey"]},price:17000,offer:true,warranty:1})

db.mobile.insert({name:"Fold 4",brand:"Samsung",Version:1,specification:{RAM:16,ROM:1024,processor:"Snapdragon 8th Gen",Camera:108,Color:["Black","Grey"]},price:10007,offer:false,warranty:1})

db.mobile.insert({name:"Nothing Phone 1",brand:"Nothing",Version:1,specification:{RAM:8,ROM:256,processor:"Snapdragon 778",Camera:50,Color:["Black","White"]},price:33000,offer:true,warranty:1})

db.mobile.find().pretty()

db.mobile.find().pretty().count()

db.mobile.find().sort({price:-1}).pretty();

db.mobile.find().sort({price:1}).pretty();

db.mobile.find({price:{$gte:15000}}).sort({price:1}).pretty();

db.mobile.find({price:{$lt:15000}}).sort({price:1}).pretty();

db.mobile.find({"specification.Color":"Black"}).pretty();

db.mobile.find({$or:[{"brand":"Real Me"},{"brand":"Google"}]}).pretty();

db.mobile.find({$and:[{"brand":"Real Me"},{"brand":"Google"}]}).pretty();

db.mobile.find({offer:{$ne:true}}).pretty();

db.mobile.find({},{"specification.Color":{$slice:2}}).pretty();

db.mobile.find({},{"specification.Color":{$slice:1}}).pretty();

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

