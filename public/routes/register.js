const bcrypt = require('bcrypt')
const bodyParser = require('body-parser');
const connection = require('../model/database')
const router = require('express').Router()

// create new user

router.post("/signupuser", bodyParser.json(), function(req, res){
    console.log(req.body)
    //var user_id = req.body.user_id
    var first_name = req.body.first_name
    var last_name = req.body.last_name
    var password = req.body.password
    var email = req.body.email
    var location = req.body.location
    var PhoneNumber = req.body.PhoneNumber

    //let pw = bcrypt.hashSync(password, 10);
    let pw = password;
    if(email)   // user existes
    {
        var sql = "SELECT * FROM `_user` WHERE `Email`=?";
        connection.query(sql, email, function(err, result){
            if(result.length > 0)
            {
                //console.log(email);

                console.log("User already existes.");
                res.status(404).json({
                    error: "User already existes."
                })
                if(err)
                {throw err}
            }
            else    // create new customer
            {

                // var sql = "INSERT INTO `_user`(`First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`) VALUES ('"+ 
                // first_name +"','"+ last_name +"','"+ pw +"','"+ email +"','"+ location +"',"+ PhoneNumber +"";

                var SQL = `INSERT INTO _user(First_name, last_name, password, Email, Location, PhoneNumber) VALUES ('${first_name}', '${last_name}', '${password}', '${email}', '${location}', ${PhoneNumber});`;
                connection.query(SQL, function(err, result){
                     if(err)
                     {
                        //console.log(first_name);
                         throw err;
                     }

                     else
                     {
                    console.log("Customer inserted");
                    res.status(200).json({
                        record: "Customer inserted"
                        })
                    }
                    res.end();

                })
            }
        });
    }


})

router.post("/signupdelivery", bodyParser.json(), function(req, res){
    console.log(req.body)
    var first_name = req.body.first_name
    var last_name = req.body.last_name
    var password = req.body.password
    var email = req.body.email
    var Scooter = req.body.Scooter
    var PhoneNumber = req.body.PhoneNumber


    // let pw = bcrypt.hashSync(password, 10);
    let pw = password;
    if(email)   // user existes
    {
        var sql = `SELECT * FROM captain WHERE Email =?`;
        connection.query(sql, email, function(err, result){
            if(result.length > 0)
            {
                console.log("Captain already existes.");
                res.status(404).json({
                    error: "Captain already existes."
                })
                if(err)
                {return err}
            }
            
            else    // create new customer
            {
                // var sql = "INSERT INTO captain (First_name, last_name, password, Email, Scooter) VALUES ('"+
                // first_name +"','"+ last_name +"','"+ password +"','"+ email +"','"+ Scooter +"'";
                var SQL = `INSERT INTO waiting_list (First_name, lastname, password, Email, Scooter, PhoneNumber) VALUES ('${first_name}', '${last_name}', '${password}', '${email}', '${Scooter}', '${PhoneNumber}');`;
                connection.query(SQL, function(err, result){
                    if(err)
                    {throw err;}
                    else
                    {
                    console.log("Captain inserted into waiting list");
                    res.status(200).json
                        ({
                            record: "Captain inserted into waiting list"
                        })
                    }  
                    res.end();
 
                })
            }
        });
    }
})

module.exports = router;
