const axios = require('axios')
const connection = require('../model/database')
const { end } = require('../model/database')
const router = require('express').Router()
const bodyParser = require('body-parser');

module.exports =router

const key = "#API key";

router.put("/status", bodyParser.json(), function(req, res){
    var id = req.body.delvary_id
    var online = req.body.status
    var type = req.body.type
    var location = req.body.location

    var sql = "UPDATE `captain` set `online_status`='"+ online +"', `translation_status`='"+ type +"',`location`='"+ location +"' WHERE delvary_id "
    connection.query(sql, id, function(err, result){
        if(err)
        {
            throw err;
        }
        res.status(200).json({
            record: "status updated"
        })
    })

})

function distance_api(user_location, key, captains_location)
{
    var s = `https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=`
    var e = `&destinations=${user_location}$key=${key}`
    for (var i = 0; i < captains_location.length; i++)
    {
        if(i == captains_location.length - 1)
        {
            s = s.concat(captains_location[i])
        }
        else
        {
            s = s.concat(captains_location[i] + '|')
        }
    }
    var user_location = s.concat(e);
    return user_location
}

function get_index(data)
{
    var distance = []
    var temp, index, x;

    for(var i = 0; i < data.rows.length; i++)
    {
        temp = data.rows[i].elements[0].distance.text.split(' ')
        if(temp[i, 1] == 'ft')
        {
            temp[i, 0] = (parseFloat(temp[i, 0]) / 5280). toFixed(5)
        }
        temp[i, 0]= temp[i, 0].toString()
        if(temp[0].indexOf(',') == 1)
        {
            temp = temp[0].split(',')
            x = temp[0] + temp[1]
            temp[0] = x
        }
        distance.push(parseFloat(temp[0]))
    }
    temp = distance[0]
    for(var i = 0; i < distance.length; i++)
    {
        if(distance[i]<temp)
        {
            temp = distance[i]
            index = i
        }
    }
    return index
}

router.post("/transportation", bodyParser.json(), async(req, res, next)=>{
    try{
        var location= req.body.user_location
        var captains_location = []
        var captains_id = []
        const key = "#API key"
        var sql = "SELECT * FROM `captain` WHERE `online_status`=1 and `translation_status`=1";
        connection.query(sql, async(err, result)=>{
            if(err)
            {throw err}
            for(var i = 0; i < result.length; i++)
            {
                captains_location.push(result[i].location)
                captains_id.push(result[i].delvary_id)
            }
            const { data } = await axios.get(distance_api(location,key, captains_location))
            console.log(captains_location)
            res.status(200).json({
                "delvary_id":result[get_index(data)].delvary_id,
                "first_name":result[get_index(data)].First_name,
                "last_name":result[get_index(data)].last_name,
                "Scooter":result[get_index(data)].Scooter,
                "location":result[get_index(data)].location,
                "Email":result[get_index(data)].Email,
                "distance:":data.rows[get_index(data)].elements[0].distance.text,
                "duration:":data.rows[get_index(data)].elements[0].duration.text,

            })
        })
    }
    catch(err)
    {
        next(err)
    }

})

router.post("/go_location", bodyParser.json(), async(req, res, next)=>{
    try
    {
        var id = req.body.delvary_id
        var s_location = req.body.user_location
        var e_location = req.body.end_location
        var salary
        const key = "#API key";
        const { data } = await axios.get(`https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=${s_location}&destination=${e_location}`);
        salary = parseFloat(data.rows[0].elements[0].distance.text) * 6.5
        console.log(salary)
        var distance = data.rows[0].elements[0].distance.text
        var duration = data.rows[0].elements[0].duration.text
        var sql = "INSERT INTO `captain_trans` (`delevry`, `From_location`, `to_location`, `distance`, `duration`) VALUES ('"
        + id +"','"+ s_location +"','"+ e_location +"','"+ distance +"','"+ duration +"')";
        connection.query(sql,function(err, result){
            if(err)
            {throw err}
            res.status(200).json({
                "distance": distance,
                "duration": duration,
                "salary": salary
            })
        })
    }
    catch(err)
    {next(err)}
})