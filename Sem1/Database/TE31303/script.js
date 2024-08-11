const fs = require("fs")

function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() *
 charactersLength));
   }
   return result;
}

let str = ''
for(let i = 0; i < 10; i++) {
        str += `insert into n_emp(emp_id,emp_name) values(${i},"${makeid(5)}");\n`
}
for(let i = 0; i < 100; i++) {
        str += `insert into o_emp(emp_id,emp_name) values(${i},"${makeid(5)}");\n`
}
fs.writeFile("data.sql", str, (err) => {
if(err) {
console.error(err)
}
console.log("DONE!...")
})

