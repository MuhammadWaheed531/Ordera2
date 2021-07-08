const connection = require('../model/database')
const { end } = require('../model/database')
const router = require('express').Router()
const bodyParser = require('body-parser');
const { Types } = require('mysql');

router.get("/quick", bodyParser.json(), function (req, res){
    var menu = []
    var sql = "SELECT * FROM `foods`";
    connection.query(sql, function (err, result){
        if(err)
        {throw err}
        for(var i = 0; i < 8; i++)
        {
            menu.push(result[Math.floor(Math.random() * result.length)])
        }
        res.status(200).json({
            result: menu
        })
    })
})

router.post("/getlocation", bodyParser.json(), function(req, res){
    var id = req.body.id
    var sql = "SELECT * FROM `Restaurants` WHERE `id`=?";
    connection.query(sql, id, function(err, result){
        if(err)
        {throw err;}
        res.status(200).json({
            location: result[0].location
        })
    })
})

router.post("/category", bodyParser.json(), function(req, res){
    var id_items = req.body.id_items
    var category = req.body.category;

    if(category == "foods")
    {
        var sql = "SELECT * FROM `foods` WHERE `item_id`=?";
        connection.query(sql, id_items, function(err, result){
            if(err)
            {throw err;}
            res.status(200).json({
                result: result
            })
        })
    }
    else if(category == "groceries")
    {
        var sql = "SELECT * FROM `groceries` WHERE `item_id`=?";
        connection.query(sql, id_item, function(err, result){
            if(err)
            {
                throw err
            }
            res.status(200).json({
                result: result
            })
        })
    }
    else if(category == "tools")
    {
        var sql = "SELECT * FROM `tools` WHERE `item_id`=?";
        connection.query(sql, id_item, function(err, result){
            if(err)
            {
                throw err
            }
            res.status(200).json({
                result: result
            })
        })
    }
})
module.exports = router;
