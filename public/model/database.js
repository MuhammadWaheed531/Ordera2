const { createPool } = require('mysql')

const connection = createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "ordera2",
    connectionLimit: 10

});
module.exports = connection
// connection.query("select * from admin", (err,result, fields)=>{
//     if(err)
//     {throw err}
//     else
//     {
//         console.log(result);
//     }
// });
