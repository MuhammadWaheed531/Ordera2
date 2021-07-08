const connection = require('../model/database')
const { end } = require('../model/database')
const router = require('express').Router()
const bodyParser = require('body-parser');
const { query } = require('express');

router.post("/listcarts", bodyParser.json(), function(req, res){
    console.log(req.body)
    var user_id = req.body.user_id
    var sql = "SELECT * FROM `carts` WHERE `user_id`=?";
    connection.query(sql, user_id, function (err, result){
        if(err)
        {
            throw err;
        }
        res.status(200).json({
            result: result
        })
    })
})

router.post("/addcart", bodyParser.json(), function(req,res){
    console.log(req.body)
    var user_id = req.body.user_id
    var product_name = req.body.product_name
    var image = req.body.image
    var qty = req.body.qty
    var price = req.body.price
    var user = req.body.user_location
    var product = req.body.product_location
    var total = qty + price
    var date = new Date();
    var time = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();

    var sql = "SELECT * FROM `carts` WHERE `user_id`= '" + user_id + "' and `product_name`='" + product_name + "'";
    connection.query(sql, function ( err, result){
        if(result.length > 0)
        {
            var sql = "UPDATE `carts` SET `qty`='" + qty + "' `total`='" + total + "' WHERE `user_id`= '"+ user_id + "' and `product_name`='"+product_name +"'";
            connection.query(sql, function (err, result){
                if(err)
                {throw err;}
                res.status(200).json({
                    result: "changed"
                })
            })
        }
        else 
        {
            var sql = "INSERT INTO `carts`(`user_id`, `product_name`, `image`, `qty`, `price`, `total`, `time`, `user_location`, `product_location`, ``) VALUES ('"+ id +"', '"+ product_name +"', '"+ image +"', '"+ qty +"','"+ price +"','"+ total +"','"+ time +"','"+ user +"','"+ product +"') ";
            connection.query(sql, function(err, result){
                if(err)
                {
                    throw err;
                }
                var sql = "SELECT * FROM `carts` WHERE `user-id`=?";
                connection.query(sql, user_id, function (err, result){
                    if(err)
                    {throw err;}
                    res.status(200).json({
                        result: result
                    })
                })
            })
        }
        if(err)
        {throw err;}
    })
})

module.exports = router;