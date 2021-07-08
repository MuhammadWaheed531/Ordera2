const connection = require('../model/database')
const { end } = require('../model/database')
const router = require('express').Router()
const bodyParser = require('body-parser');

router.post("/libraries", bodyParser.json(), function(res,req){
    console.log(req.body)
    var library_name = req.body.name;
    if(library_name)
    {
        var sql = "SELECT * FROM `library` WHERE name=?";
        connection.query(sql, library_name, function(err, result){
            if(err)
            {throw err}
            res.statusCode(200).json({
                result: result
            })
        })
    }
    else
    {
        var sql = "SELECT * FROM `library`";
        connection.query(sql, function(err,result){
            if(err)
            {throw err}
            res.status(200).json({
                result: result
            })
        })
    }
})

router.post("/tools", bodyParser.json(), function(req, res){
    console.log(req.body)

    var library_id = req.body.id;
    if (library_id)
    {
        var sql = "SELECT * FROM `tools` WHERE id='"+ library_id +"'";
        connection.query(sql, function(err, result){
            if(err)
            {throw err}
            var sql = "SELECT * FROM `library` WHERE id=?";
            connection.query(sql, library_id, function(err, result){
                if(err)
                {throw err}
            })
            res.status(200).json({
                result: result,
                menu: menu,
            })
        })
    }
})
module.exports = router;