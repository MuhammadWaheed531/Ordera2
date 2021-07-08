const connection = require('../model/database')
const { end } = require('../model/database')
const router = require('express').Router()
const bodyParser = require('body-parser');

module.exports = router;

router.post("/transportation", bodyParser.json(), function(req, res){
    console.log(req,body)
    var id = req.body.delvary_id
    var sql = "SELECT * FROM `captain_trans` Where delevry = '"+ id +"'" ;
    connection.query(sql, function (err, result){
        if(err)
        {throw err}
        res.status(200).json({
            result: result
        })
    })
})

router.post("/approve", bodyParser.json(), function(req,res){
    console.log(req.body)
    var id = req.body.delvary_id
    var sql = "DELETE FROM `captain_trans` WHERE delevry='"+ id +"'";
    connection.query(sql, function(err, result){
        if(err)
        {throw err}
        res.status(200).json({
            result: "deleted"
        })
    })
})