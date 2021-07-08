 const express = require("express");
 const path = require("path");
 const cors = require("cors");
 //const app = express.Router();
// const server = require('http').createServer(app);


const Http = require("http");
const Https = require("https");
//const express = require("express");

const app = express();

//const port = 8110;
port = 8080;

const server = app.listen(port, ()=>{
    console.log("server is working on port " + port + " .");

    app.use('/', require('./auth/Login'));

});

// app.use(require(`${servers}/www.${domain}`)());

// const HttpServer = Http.createServer(App);
// const HttpsServer = Https.createServer(opts, App);

// HttpServer.listen(80, () => console.log(":80"));
// HttpsServer.listen(443, () => console.log(":443"));


const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());



//server.listen(port);

console.log ("server is running");

var corsOptions = {
    credentials: true,
    origin: "*",
    optionsSuccessStatus: 200,
}

const io = require('socket.io')(server,{
    cors: {
        origin: '*',
        methods: ["GET", "POST"]
    }
});//web socket

app.use(cors(corsOptions));

//const login = require('./auth/Login')

app.use('/', require('./auth/Login'))

//app.use('/', login);

app.use('/cart', require('./routes/carts'))
app.use('/admin', require('./routes/admin'));
app.use('/home', require('./routes/home'))
//app.use('/', require('./routes/distance'))
app.use('/register', require('./routes/register'))
app.use('/user', require('./user/captain'))
app.use('/delvary', require('./delvary/restaurants'))
app.use('/delvary', require('./delvary/status'))
app.use('/delvary', require('./delvary/library'))
app.use('/delvary', require('./delvary/supermarket'))

app.use(cors());

//  app.get('/', (req, res)=>{
//      res.sendFile(path.join(__dirname, 'api.html'));
//  });

//  app.get("/", (req, res) => {
//      res.end("waheed");

//  })

//  app.use('/admin', require('./routes/admin'))

/**
app.post("/login", bodyParser.json(), function(req, res){
    console.log("Body: ", req.body)
    var email = req.body.email
    var password = req.body.password
    var type = req.body.type;

    //If user select type user send 1

    if(type == 1) // type 1 is customer
    {
        conole.log("TYpe: ", type)
        //Check if user existes
        connection.query("SELECT * FROM `_user` WHERE Email=?",email, function (err,result) {
            if(result.length > 0)   //if user existes, convert string password to hash code
            {
                if(bcrypt.compareSync(password, result[0].password))
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
 */