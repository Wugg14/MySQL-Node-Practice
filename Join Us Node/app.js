let express = require('express');
let mysql = require('mysql');
let bodyParser = require("body-parser");
let app = express();

//Configuration
app.set("view engine", "ejs")
app.use(express.static(__dirname + "/assets"))
app.use(bodyParser.urlencoded({extended: true}));

let connection = mysql.createConnection({
	 host     : 'localhost',
  	 user     : 'root',
  	 database : 'join_us'
});

app.get('/', function(req, res){
	let q = "SELECT COUNT(*)AS count FROM users"
	connection.query(q, function(error, results){
		if(error) throw error;
		let count = results[0].count;
		res.render("home", {data: count})
	});
});

app.post("/register", function(req, res){
	let person = {email: req.body.email};
	
	connection.query('INSERT INTO users SET ?', person, function(err, result){
		if(err) throw err;
		console.log(result);
		res.redirect("/")
	})
})

app.listen(3000, function(){
	console.log('App Listening on port 3000')
});