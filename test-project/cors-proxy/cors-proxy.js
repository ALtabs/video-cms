const express = require('express');
const request = require('request');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000; // Use environment variable for production

// Allow CORS for specific domains in production
const allowedOrigins = ['http://localhost:4200', 'https://your-production-domain.com'];
app.use((req, res, next) => {
    const origin = req.headers.origin;
    if (allowedOrigins.includes(origin)) {
        res.setHeader('Access-Control-Allow-Origin', origin);
    }
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

// Proxy endpoint
app.get('/proxy', (req, res) => {
    const url = req.query.url;
    if (!url) {
        return res.status(400).send('No URL provided');
    }

    // Forward the request and pipe the response
    request(url)
        .on('error', (err) => {
            console.error('Error fetching URL:', err);
            res.status(500).send('Error fetching the requested URL');
        })
        .pipe(res);
});

// Start the server
app.listen(PORT, () => {
    console.log(`CORS proxy running at http://localhost:${PORT}`);
});
