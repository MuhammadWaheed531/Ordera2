const bcrypt = require('bcrypt')
const bodyParser = require('body-parser');
const connection = require('../model/database')
const router = require('express').Router()
const jwt = require('jsonwebtoken')

//Login

router.post("/login", bodyParser.json(), function(req, res){
    // console.log("Body: ", req.body)
    var email = req.body.email
    var password = req.body.password
    var type = req.body.type;

    //If user select type user send 1

    if(type == 1) // type 1 is customer
    {
        //console.log("TYpe: ", type)
        //Check if user existes
        connection.query("SELECT * FROM `_user` WHERE Email=?",email, function (err,result) {
            // console.log(result)
            if(result.length > 0)   //if user existes, convert string password to hash code
            {
                //console.log(result[0].password)
                //console.log(password)
                //console.log(bcrypt.compareSync(password, result[0].password))
                //if(bcrypt.compareSync(password, result[0].password))
                if(password== result[0].password)
                {
                    console.log("This is a Customer")

                    //send user info to front end

                    res.status(200).json({
                        result:{
                            "user": result[0].user_id,
                            "First_name": result[0].First_name,
                            "last_name": result[0].last_name,
                            "Email": result[0].Email,
                            "Location": result[0].Location,



                        }
                    })
                }
                else
                {
                    // send wrong password to front end
                    console.log("Password don't match")
                    res.status(405).json({
                        error: "Wrong Password"
                    })
                }
                if(err)
                {
                    throw err;
                }
            }
            else
            {
                //send user dont exist to front end
                console.log("User doesn't exist")
                res.status(400).json({
                    error : "User doesn't exist"
                })
            }
        });
    }

    else if (type == 2) // type 2 is delivary 
    {
        connection.query("SELECT * FROM `captain` WHERE Email=?",email, function (err,result) {
            if(result.length > 0)   //if user existes, convert string password to hash code
            {
                if(bcrypt.compareSync(password, result[0].password))
                {
                    console.log("This is a Captain")

                    //send user info to front end

                    res.status(200).json({
                        result:{
                            "delvary": result[0].delvary_id,
                            "First_name": result[0].First_name,
                            "last_name": result[0].last_name,
                            "Email": result[0].Email,
                            "Location": result[0].Location,



                        }
                    })
                }
                else
                {
                    // send wrong password to front end
                    console.log("Password don't match")
                    res.status(405).json({
                        error: "Wrong Password"
                    })
                }
                if(err)
                {
                    throw err;
                }
            }
            else
            {
                //send user dont exist to front end
                console.log("Captain doesn't exist")
                res.status(400).json({
                    error : "Captain doesn't exist"
                })
            }
        });    
    }

});

module.exports = router;