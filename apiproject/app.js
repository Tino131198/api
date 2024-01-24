const express = require('express');
const path = require('path');
const https = require('https');
const mysql = require('mysql2/promise');
const ejs = require('ejs');

const app = express();
app.set('views', path.join(__dirname, "public"));
app.set('view engine', 'ejs');

const dbConfig = {
  host: 'localhost',
  user: 'root',
  port: 4306,
  password: '',
  database: 'jokesdb'
};

const options = {
	method: 'GET',
	hostname: 'dad-jokes.p.rapidapi.com',
	port: null,
	path: '/random/joke',
	headers: {
		'X-RapidAPI-Key': 'f5c7eaf3b8mshf07f8c6a7c16e29p1aeb91jsnd09f2dcd85f2',
		'X-RapidAPI-Host': 'dad-jokes.p.rapidapi.com'
	}
};
async function updateJoke(jokeId, setup, punchline) {
    const connection = await mysql.createConnection(dbConfig);
  
    try {
      const [rows] = await connection.execute('UPDATE jokes SET setup = ?, punchline = ? WHERE id = ?', [setup, punchline, jokeId]);
      console.log(`Updated joke with ID ${jokeId}`);
    } catch (error) {
      console.error('Error updating joke:', error);
    } finally {
      await connection.end();
    }
  }
  
  function fetchAndUpdateJokes() {
    for (let i = 1; i <= 5; i++) {
      const reqAPI = https.request(options, (response) => {
        let data = '';
  
        response.on('data', (chunk) => {
          data += chunk;
        });
  
        response.on('end', () => {
          try {
            const joke = JSON.parse(data);
            if (joke.body && joke.body.length > 0) {
              updateJoke(i, joke.body[0].setup, joke.body[0].punchline);
            } else {
              console.error('No joke data received or empty body.');
            }
          } catch (error) {
            console.error('Error parsing joke data:', error);
          }
        });
      });
  
      reqAPI.on('error', (error) => {
        console.error('Error fetching joke:', error);
      });
  
      reqAPI.end();
    }
  }
  
  // setInterval(fetchAndUpdateJokes, 5000);
  

app.get("/opvragen", async function(req, res) {

  const connection = await mysql.createConnection(dbConfig);
    try{
      const results = await connection.execute("SELECT * FROM jokes");
      res.status(200).json(results[0]);
    }
    catch(error){
      console.error(`opvragen mislukt: ${error}`)
    }
    finally{
      await connection.end();
    }
  
});
  


app.get('/', async function(req, res) {
  res.render('index');
});

app.listen(3000, function() {
  console.log('Server running on port 3000');
});
