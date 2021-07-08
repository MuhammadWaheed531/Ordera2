const connection = require('../model/database')
//const { end } = require('../model/database')
const router = require('express').Router()
const bodyParser = require('body-parser');

router.post("/restaurants", bodyParser.json(), function(req, res){
    var restaurants_name = req.body.name;
    console.log(req.body.name);
    console.log("qw");
    if(restaurants_name)
    {
        console.log("wa");
        var sql = `SELECT * FROM restaurants WHERE name='${restaurants_name}'`;
        connection.query(sql, function(err, result){
            if(err)
            {throw err}
            res.statusCode(200).json({
                result: result
            })
        })
    }
    else
    {
        console.log(req.body.name);

        var sql = "SELECT * FROM `restaurants`";
        connection.query(sql, function(err,result){
            if(err)
            {throw err}
            res.status(200).json({
                result: result
            })
        })
    }
    res.end();
})

router.post("/foods", bodyParser.json(), function(req, res){
    console.log(req.body)

    var restaurants_id = req.body.restaurants_id;
    if (restaurants_id)
    {
        // var sql = "SELECT * FROM `foods` WHERE restaurants_id='"+ restaurants_id +"'";
        var sql = `SELECT * FROM foods WHERE restaurants_id = '${restaurants_id}';`;
        console.log("w");

        connection.query(sql, function(err, result){
            if(err)
            {throw err}

            // var sql = "SELECT * FROM `restaurants` WHERE restaurants_id=?";
            var sql = `SELECT * FROM restaurants WHERE restaurants_id=?`;

            connection.query(sql, restaurants_id, function(err, result){
                if(err)
                {throw err}
            })
            res.status(200).json({
                result: result,
                menu: menu,
            })
        })
    }
    res.end();

})
module.exports = router;