// Import the express library
const express = require('express');
const {webhookStrapi} = require("./controllers/webhookStrapi");
const {webhookWebservice} = require("./controllers/webhookWebservice");
const {webhookWebsite} = require("./controllers/webhookWebsite");

// Create an express application
const app = express();

// Define a port number
const PORT = 3010;

// Create a route handler for GET requests to the root URL '/'
app.get('/healthcheck', (req, res) => {
    console.log('/healthcheck')
    res.send('<h1>healthcheck - ОК</h1>');
});

app.get('/website_webhook', (req, res) => {
    console.log('/website_webhook')
    webhookWebsite()
    res.send('<h1>website_webhook - ОК</h1>');
});

app.get('/strapi_webhook', (req, res) => {
    console.log('/strapi_webhook')
    webhookStrapi()
    res.send('<h1>strapi_webhook - ОК</h1>');
});

app.post('/strapi_webhook', (req, res) => {
    console.log('/strapi_webhook')
    webhookStrapi()
    res.send('<h1>strapi_webhook - ОК</h1>');
});

app.get('/webservice_webhook', (req, res) => {
    console.log('/webservice_webhook')
    webhookWebservice()
    res.send('<h1>webservice_webhook - ОК</h1>');
});

app.post('/webservice_webhook', (req, res) => {
    console.log('/webservice_webhook')
    webhookWebservice()
    res.send('<h1>webservice_webhook - ОК</h1>');
});


// Start the server on the specified port
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
