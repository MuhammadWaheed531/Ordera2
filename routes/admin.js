const connection = require('../model/database')
const { end } = require('../model/database')
const router = require('express').Router()
const bodyParser = require('body-parser');

router.get("/waitlist", bodyParser.json(), function(req, res){
    var sql = "SELECT * FROM `waiting_list`";
    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        res.status(200).json({
            result : result
        })
    })
})

router.get("/deliverylist", bodyParser.json(), function (req, res){
    var sql = "SELECT * FROM `captain`";
    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        res.status(200).json({
            result : result
        })
    })
})

router.post("/delete_delivery", bodyParser.json(), function (req, res){
    var id = req.body.id
    // var sql = "DELETE FROM `captain` WHERE `delvary_id`=?";
    var sql = `DELETE FROM captain WHERE delivery_id = ${id};`;
    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        res.status(200).json({
            record : "Captain deleted"
        })
    })
})

router.post("/approve", bodyParser.json(), function(req, res){
    // console.log(req.body)
    var id = req.body.id;
    var approve = req.body.approve; // approve 1 reject 0

    if (approve == 0)
    {
        // var sql = "DELETE FROM `waiting_list` WHERE `id`=?";
        var sql = `DELETE FROM waiting_list WHERE id =?;`;
        connection.query(sql, id , function (err, result){
            if(err)
            {
                throw err
            }
            res.status(200).json({
                record: "Captain deleted"
            })
            console.log("captain deleted from waiting list");
        })
    }
    else 
    {
        // var sql= "SELECT * FROM `waiting_list` WHERE `id`=?";
        var sql = `SELECT * FROM waiting_list WHERE id =?;`;

        connection.query(sql, id, function ( err, result){
            if(err)
            {
                throw err;
            }

            // var sql = "INSERT INTO `captain`(`First_name`, `last_name`, `password`, `Email`, `Scooter`) VALUES('"+ result[0].First_name +"', '"+ result[0].last_name +"', '"+ result[0].password +"', '"+ result[0].Email +"', '"+ result[0].Scooter +"')";
            var sql = `INSERT INTO captain (First_name, last_name, password, Email, Scooter, PhoneNumber) VALUES ('${result[0].First_name}', '${result[0].lastname}', '${result[0].password}', '${result[0].Email}', '${result[0].Scooter}', ${result[0].PhoneNumber});`;
            console.log("captain inserted to the captain table");
            connection.query(sql, function (err, result){
                if (err)
                {
                    throw err;
                }
                // var sql = "DELETE FROM `waiting_list` WHERE `id`=?";
                var sql = `DELETE FROM waiting_list WHERE id =?;`;

                connection.query(sql, id, function (err, result){
                    if(err)
                    {
                        throw err
                    }
                })
                res.status(200).json({
                    record: "Captain added"
                })
            })
        })
    }
})

/*=========================================================================================================================================*/

router.post("/AddRest", bodyParser.json(), function(req, res){
    console.log(req.body)
    //var user_id = req.body.user_id
    var name = req.body.name
    var description = req.body.description
    var location = req.body.location
    var image = req.body.image

    if(name)   // user existes
    {
        var sql = `SELECT * FROM restaurants WHERE name=?`;
        connection.query(sql, name, function(err, result){
            if(result.length > 0)
            {
                //console.log(email);

                console.log("Restaurant already existes.");
                res.status(404).json({
                    error: "Restaurant already existes."
                })
                if(err)
                {throw err}
            }
            else    // create new customer
            {

                // var sql = "INSERT INTO `_user`(`First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`) VALUES ('"+ 
                // first_name +"','"+ last_name +"','"+ pw +"','"+ email +"','"+ location +"',"+ PhoneNumber +"";

                var SQL = `INSERT INTO restaurants(name, description, Location, image) VALUES ('${name}', '${description}', '${location}', '${image}');`;
                connection.query(SQL, function(err, result){
                     if(err)
                     {
                        //console.log(first_name);
                         throw err;
                     }

                     //console.log("WA");
                     else
                     {
                    console.log("Restaurant inserted");
                    res.status(200).json({
                        record: "Restaurant inserted"
                        })
                    }
                    res.end();

                })
            }
        });
    }
})

router.post("/AddSuperMarket", bodyParser.json(), function(req, res){
    console.log(req.body)
    //var user_id = req.body.user_id
    var name = req.body.name
    var description = req.body.description
    var location = req.body.location
    var image = req.body.image

    if(name)   // user existes
    {
        var sql = `SELECT * FROM supermarket WHERE name=?`;
        connection.query(sql, name, function(err, result){
            if(result.length > 0)
            {
                //console.log(email);

                console.log("Supermarket already existes.");
                res.status(404).json({
                    error: "Supermarket already existes."
                })
                if(err)
                {throw err}
            }
            else    // create new customer
            {

                // var sql = "INSERT INTO `_user`(`First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`) VALUES ('"+ 
                // first_name +"','"+ last_name +"','"+ pw +"','"+ email +"','"+ location +"',"+ PhoneNumber +"";

                var SQL = `INSERT INTO supermarket(name, description, Location, image) VALUES ('${name}', '${description}', '${location}', '${image}');`;
                connection.query(SQL, function(err, result){
                     if(err)
                     {
                        //console.log(first_name);
                         throw err;
                     }

                     //console.log("WA");
                     else
                     {
                    console.log("Supermarket inserted");
                    res.status(200).json({
                        record: "Supermarket inserted"
                        })
                    }
                    res.end();

                })
            }
        });
    }
})

router.post("/AddLib", bodyParser.json(), function(req, res){
    console.log(req.body)
    //var user_id = req.body.user_id
    var name = req.body.name
    var description = req.body.description
    var location = req.body.location
    var image = req.body.image

    if(name)   // user existes
    {
        var sql = `SELECT * FROM library WHERE name=?`;
        connection.query(sql, name, function(err, result){
            if(result.length > 0)
            {
                //console.log(email);

                console.log("Library already existes.");
                res.status(404).json({
                    error: "Library already existes."
                })
                if(err)
                {throw err}
            }
            else    // create new customer
            {

                // var sql = "INSERT INTO `_user`(`First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`) VALUES ('"+ 
                // first_name +"','"+ last_name +"','"+ pw +"','"+ email +"','"+ location +"',"+ PhoneNumber +"";

                var SQL = `INSERT INTO library(name, description, Location, image) VALUES ('${name}', '${description}', '${location}', '${image}');`;
                connection.query(SQL, function(err, result){
                     if(err)
                     {
                        //console.log(first_name);
                         throw err;
                     }

                     //console.log("WA");
                     else
                     {
                    console.log("Library inserted");
                    res.status(200).json({
                        record: "Library inserted"
                        })
                    }
                    res.end();

                })
            }
        });
    }
})

/*=========================================================================================================================================*/

router.post("/AddFood", bodyParser.json(), function(req, res){
    console.log(req.body)
    //var user_id = req.body.user_id
    var restaurants_id = req.body.restaurants_id
    var name = req.body.name
    var description = req.body.description
    var price = req.body.price
    var image = req.body.image

    if(name)   // user existes
    {
        var sql = `SELECT * FROM foods WHERE name=?`;
        connection.query(sql, name, function(err, result){
            if(result.length > 0)
            {
                //console.log(email);

                //console.log("Wa");
                console.log("food already existes.");
                res.status(404).json({
                    error: "food already existes."
                })
                if(err)
                {throw err}

            }
            else    // create new customer
            {

                console.log("Wah");
                // var sql = "INSERT INTO `_user`(`First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`) VALUES ('"+ 
                // first_name +"','"+ last_name +"','"+ pw +"','"+ email +"','"+ location +"',"+ PhoneNumber +"";

                //var SQL = `INSERT INTO foods(restaurants_id, name, description, price, image) VALUES (${restaurants_id}, '${name}', '${description}', ${price}, '${image}');`;
                var sql = `INSERT INTO foods (restaurants_id, name, description, price, image) VALUES (${restaurants_id}, '${name}', '${description}', ${price}, '${image}')`;
                connection.query(sql, function(err, result){
                     if(err)
                     {
                         throw err;
                     }

                     //console.log("WA");
                     else
                     {
                    console.log("Food inserted");
                    res.status(200).json({
                        record: "Food inserted"
                        })

                    }
                    res.end();

                })
            }
        });
    }

})

router.post("/AddTool", bodyParser.json(), function(req, res){
    console.log(req.body)
    //var user_id = req.body.user_id
    var library_id = req.body.library_id
    var name = req.body.name
    var description = req.body.description
    var price = req.body.price
    var image = req.body.image

    if(name)   // user existes
    {
        var sql = `SELECT * FROM tools WHERE name=?`;
        connection.query(sql, name, function(err, result){
            if(result.length > 0)
            {
                //console.log(email);

                //console.log("Wa");
                console.log("Tool already existes.");
                res.status(404).json({
                    error: "Tool already existes."
                })
                if(err)
                {throw err}

            }
            else    // create new customer
            {

                console.log("Wah");
                // var sql = "INSERT INTO `_user`(`First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`) VALUES ('"+ 
                // first_name +"','"+ last_name +"','"+ pw +"','"+ email +"','"+ location +"',"+ PhoneNumber +"";

                //var SQL = `INSERT INTO foods(restaurants_id, name, description, price, image) VALUES (${restaurants_id}, '${name}', '${description}', ${price}, '${image}');`;
                var sql = `INSERT INTO tools (library_id, name, description, price, image) VALUES (${library_id}, '${name}', '${description}', ${price}, '${image}')`;
                connection.query(sql, function(err, result){
                     if(err)
                     {
                         throw err;
                     }

                     //console.log("WA");
                     else
                     {
                    console.log("Tool inserted");
                    res.status(200).json({
                        record: "Tool inserted"
                        })

                    }
                    res.end();

                })
            }
        });
    }

})

router.post("/AddGrocery", bodyParser.json(), function(req, res){
    console.log(req.body)
    //var user_id = req.body.user_id
    var supermarket_id = req.body.supermarket_id
    var name = req.body.name
    var description = req.body.description
    var price = req.body.price
    var image = req.body.image

    if(name)   // user existes
    {
        var sql = `SELECT * FROM groceries WHERE name=?`;
        connection.query(sql, name, function(err, result){
            if(result.length > 0)
            {
                //console.log(email);

                //console.log("Wa");
                console.log("Grocery already existes.");
                res.status(404).json({
                    error: "Grocery already existes."
                })
                if(err)
                {throw err}

            }
            else    // create new customer
            {

                console.log("Wah");
                // var sql = "INSERT INTO `_user`(`First_name`, `last_name`, `password`, `Email`, `Location`, `PhoneNumber`) VALUES ('"+ 
                // first_name +"','"+ last_name +"','"+ pw +"','"+ email +"','"+ location +"',"+ PhoneNumber +"";

                //var SQL = `INSERT INTO foods(restaurants_id, name, description, price, image) VALUES (${restaurants_id}, '${name}', '${description}', ${price}, '${image}');`;
                var sql = `INSERT INTO groceries (supermarket_id, name, description, price, image) VALUES (${supermarket_id}, '${name}', '${description}', ${price}, '${image}')`;
                connection.query(sql, function(err, result){
                     if(err)
                     {
                         throw err;
                     }

                     //console.log("WA");
                     else
                     {
                    console.log("Grocery inserted");
                    res.status(200).json({
                        record: "Grocery inserted"
                        })

                    }
                    res.end();

                })
            }
        });
    }

})

/*=========================================================================================================================================*/

router.post("/deleteCaptain", bodyParser.json(), function (req, res){
    var id = req.body.id
    var sql = `DELETE FROM captain WHERE delivery_id=?`;
    connection.query(sql, id, function (err, result){
        if(err)
        {
            throw err
        }
        else
        {
            console.log("Captain deleted");
            res.status(200).json({
                record: "Captain deleted"
            })
        }
        res.end();
    })
})


router.post("/deleteCustomer", bodyParser.json(), function (req, res){
    var id = req.body.id
    var sql = `DELETE FROM _user WHERE user_id=?`;
    connection.query(sql, id, function (err, result){
        if(err)
        {
            throw err
        }
        else
        {
            console.log("Customer deleted");
            res.status(200).json({
                record: "Customer deleted"
            })
        }
        res.end();
    })
})

/*=========================================================================================================================================*/

router.post("/deleteGrocery", bodyParser.json(), function (req, res){
    var id = req.body.id
    var sql = `DELETE FROM groceries WHERE item_id = ${id}`;
    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        else
        {
            console.log("Grocery deleted");
            res.status(200).json({
                record: "Grocery deleted"
            })
        }
        res.end();
    })
})

router.post("/deleteFood", bodyParser.json(), function (req, res){
    var id = req.body.id
    var sql = `DELETE FROM foods WHERE item_id = ${id}`;
    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        else
        {
            console.log("Food deleted");
            res.status(200).json({
                record: "Food deleted"
            })
        }
        res.end();
    })
})

router.post("/deleteTool", bodyParser.json(), function (req, res){
    var id = req.body.id
    var sql = `DELETE FROM tools WHERE item_id = ${id}`;
    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        else
        {
            console.log("Tool deleted");
            res.status(200).json({
                record: "Tool deleted"
            })
        }
        res.end();
    })
})

/*=========================================================================================================================================*/


router.post("/BannLib", bodyParser.json(), function (req, res){
    var status = req.body.status
    var library_id = req.body.id
    var sql = `SELECT * FROM library;`
    connection.query(sql, function(err, result){
        if (result.length <= 0 )
        {
            res.status(200).json({ record: "There are no libraries in the DB." })
        }

        else if(status == 0) // 0 for Ban 1 for active
            {

            var sql = `UPDATE library SET status = 'Banned' WHERE library_id = ${library_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Library banned");
                    res.status(200).json({
                        record: "Library banned"
                    })
                }
            })
        }

        else if(status == 1) // 0 for Ban 1 for active
        {
            var sql = `UPDATE library SET status = 'Active' WHERE library_id = ${library_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Library Active");
                    res.status(200).json({
                        record: "Library Active"
                    })
                }
            })
        }


    })
    

    // else if(status == 1) // 0 for Ban 1 for active
    // {
    //     var sql = `UPDATE library SET status = 'Active' WHERE ${status} = 1;`;
    //     connection.query(sql, function (err, result){
    //         if(err)
    //         {
    //             throw err
    //         }
    //         else
    //         {
    //             console.log("Library Active");
    //             res.status(200).json({
    //                 record: "Library Active"
    //             })
    //         }
    //     })
    //     //res.end();
    // }
})

router.post("/BannRest", bodyParser.json(), function (req, res){
    var status = req.body.status
    var restaurant_id = req.body.id
    var sql = `SELECT * FROM restaurants;`
    connection.query(sql, function(err, result){
        if (result.length <= 0 )
        {
            res.status(200).json({ record: "There are no restaurants in the DB." })
        }

        else if(status == 0) // 0 for Ban 1 for active
            {

            var sql = `UPDATE restaurants SET status = 'Banned' WHERE restaurants_id = ${restaurant_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Restaurant banned");
                    res.status(200).json({
                        record: "Restaurant banned"
                    })
                }
            })
        }

        else if(status == 1) // 0 for Ban 1 for active
        {
            var sql = `UPDATE restaurants SET status = 'Active' WHERE restaurants_id = ${restaurant_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Restaurant Active");
                    res.status(200).json({
                        record: "Restaurant Active"
                    })
                }
            })
        }
    })
})

router.post("/BannSuperMarket", bodyParser.json(), function (req, res){
    var status = req.body.status
    var supermarket_id = req.body.id
    var sql = `SELECT * FROM supermarket;`
    connection.query(sql, function(err, result){
        if (result.length <= 0 )
        {
            res.status(200).json({ record: "There are no supermarkets in the DB." })
        }

        else if(status == 0) // 0 for Ban 1 for active
            {

            var sql = `UPDATE supermarket SET status = 'Banned' WHERE supermarket_id = ${supermarket_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Supermarket banned");
                    res.status(200).json({
                        record: "Supermarket banned"
                    })
                }
            })
        }

        else if(status == 1) // 0 for Ban 1 for active
        {
            var sql = `UPDATE supermarket SET status = 'Active' WHERE supermarket_id = ${supermarket_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Supermarket Active");
                    res.status(200).json({
                        record: "Supermarket Active"
                    })
                }
            })
        }


    })
    
})

/*=========================================================================================================================================*/

router.post("/BannCaptain", bodyParser.json(), function (req, res){
    var status = req.body.status
    var delivery_id = req.body.id
    var sql = `SELECT * FROM captain;`
    connection.query(sql, function(err, result){
        if (result.length <= 0 )
        {
            res.status(200).json({ record: "There are no captains in the DB." })
        }

        else if(status == 0) // 0 for Ban 1 for active
            {

            var sql = `UPDATE captain SET online_status = 'Banned' WHERE delivery_id = ${delivery_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Captain banned");
                    res.status(200).json({
                        record: "Captain banned"
                    })
                }
            })
        }

        else if(status == 1) // 0 for Ban 1 for active
        {
            var sql = `UPDATE captain SET online_status = 'Active' WHERE delivery_id = ${delivery_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Captain Active");
                    res.status(200).json({
                        record: "Captain Active"
                    })
                }
            })
        }
        else if(status == 2) // 0 for Ban 1 for active 2 for unactive
        {
            var sql = `UPDATE captain SET online_status = 'Unactive' WHERE delivery_id = ${delivery_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Captain Unactive");
                    res.status(200).json({
                        record: "Captain Unactive"
                    })
                }
            })
        }

    })
    
})

/*=========================================================================================================================================*/

router.post("/BannFood", bodyParser.json(), function (req, res){
    var status = req.body.status
    var item_id = req.body.id
    var sql = `SELECT * FROM foods;`
    connection.query(sql, function(err, result){
        if (result.length <= 0 )
        {
            res.status(200).json({ record: "There are no foods in the DB." })
        }

        else if(status == 0) // 0 for Ban 1 for active
            {

            var sql = `UPDATE foods SET description = 'Unavailable' WHERE item_id = ${item_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Food unavailable");
                    res.status(200).json({
                        record: "Food unavailable"
                    })
                }
            })
        }

        else if(status == 1) // 0 for Ban 1 for active
        {
            var sql = `UPDATE foods SET description = 'Available' WHERE item_id = ${item_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Food available");
                    res.status(200).json({
                        record: "Food available"
                    })
                }
            })
        }


    })
    
})

router.post("/BannTool", bodyParser.json(), function (req, res){
    var status = req.body.status
    var item_id = req.body.id
    var sql = `SELECT * FROM tools;`
    connection.query(sql, function(err, result){
        if (result.length <= 0 )
        {
            res.status(200).json({ record: "There are no tools in the DB." })
        }

        else if(status == 0) // 0 for Ban 1 for active
            {

            var sql = `UPDATE tools SET description = 'Unavailable' WHERE item_id = ${item_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Tool unavailable");
                    res.status(200).json({
                        record: "Tool unavailable"
                    })
                }
            })
        }

        else if(status == 1) // 0 for Ban 1 for active
        {
            var sql = `UPDATE tools SET description = 'Available' WHERE item_id = ${item_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Tool available");
                    res.status(200).json({
                        record: "Tool available"
                    })
                }
            })
        }


    })
    
})

router.post("/BannGrocery", bodyParser.json(), function (req, res){
    var status = req.body.status
    var item_id = req.body.id
    var sql = `SELECT * FROM groceries;`
    connection.query(sql, function(err, result){
        if (result.length <= 0 )
        {
            res.status(200).json({ record: "There are no groceries in the DB." })
        }

        else if(status == 0) // 0 for Ban 1 for active
            {

            var sql = `UPDATE groceries SET description = 'Unavailable' WHERE item_id = ${item_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Grocery unavailable");
                    res.status(200).json({
                        record: "Grocery unavailable"
                    })
                }
            })
        }

        else if(status == 1) // 0 for Ban 1 for active
        {
            var sql = `UPDATE groceries SET description = 'Available' WHERE item_id = ${item_id};`;
            connection.query(sql, function (err, result){
                if(err)
                {
                    throw err
                }
                else
                {
                    console.log("Grocery available");
                    res.status(200).json({
                        record: "Grocery available"
                    })
                }
            })
        }


    })
    
})

/*=========================================================================================================================================*/


router.post("/Get_Res_Food", bodyParser.json(), function(req, res){
    var restaurant_id = req.body.id;

    var sql = `SELECT * FROM foods WHERE restaurants_id = ${restaurant_id};`;

    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        res.status(200).json({
            result : result
        })
    })
})

router.post("/Get_Lib_Tool", bodyParser.json(), function(req, res){
    var library_id = req.body.id;

    var sql = `SELECT * FROM tools WHERE library_id = ${library_id};`;

    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        res.status(200).json({
            result : result
        })
    })
})

router.post("/Get_SM_Grocery", bodyParser.json(), function(req, res){
    var supermarket_id = req.body.id;

    var sql = `SELECT * FROM groceries WHERE supermarket_id = ${supermarket_id};`;

    connection.query(sql, function (err, result){
        if(err)
        {
            throw err
        }
        res.status(200).json({
            result : result
        })
    })
})

/*=========================================================================================================================================*/


router.post("/AddCart", bodyParser.json(), function(req, res){
    console.log(req.body);
     var user_id = req.body.user_id;
     var product_name = req.body.product_name;
     var image = req.body.image;
     var qty = req.body.qty;
     var price = req.body.price;
     var user = req.body.user_location;
     var product = req.body.product_location;
     var total = qty * price;
     var date = new Date();
     var time = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();

    console.log(time);
     var sql = `SELECT * FROM carts WHERE user_id=${user_id} AND product_name='${product_name}';`;
     connection.query(sql, function(err, result){

        console.log("w3");
        if( result.length > 0 )   // product exists in user's cart
        {
            console.log("w1");

            var sql = `UPDATE carts SET qty = ${qty}, total = ${total} WHERE user_id = ${user_id} AND product_name = '${product_name}'; `;
            connection.query(sql, function(err, result){
                
                    if(err)
                    {throw err}
                    
                    else{
                        console.log("Cart Updated");
                        res.status(200).json({
                        record: result
                        })
                    }

                });
                return

        }
        else if(result.length < 1)    // // product does not exist in user's cart
                {
                    console.log("w2");

                    console.log("Wah");
                    
                    
                    var sql = `INSERT INTO carts (user_id, product_name, image, qty, price, total, time,user_location, product_location) VALUES (${
                        user_id}, '${product_name}', '${image}', ${qty}, ${price}, ${total}, '${time}', '${user}', '${product}')`;
                    connection.query(sql, function(err, result){
                        if(err)
                        {
                            throw err;
                        }

                        //console.log("WA");
                        else
                        {
                        console.log("Cart inserted");
                        res.status(200).json({
                            record: "Record inserted"
                            })

                        }

                    })
                    return
                }
                res.end();

            });
})


module.exports = router;