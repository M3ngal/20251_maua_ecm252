require('dotenv').config()
const axios = require('axios')
const express = require('express')
const cors = require('cors')
const app = express()
app.use(cors())
app.use(express.json())

const pexelsClient = axios.create({
    baseURL: 'https://api.pexels.com/v1/',
    headers: {
        Authorization: process.env.PEXELS_KEY
    }
})

//localhost/exemplo/hippo
//localhost:exemplo?query=hippo
app.get('/search', async (req, res) => {
    try {
        const result = await pexelsClient.get('/search', {
            params: {
                query: req.query.query,
                per_page: req.query.per_page || 15
            }  
        })
        res.status(200).json(result.data)
    }
    catch(e) {
        res.status(500).end()
    }
})

const port = 3000
app.listen(port, console.log(`Back Ok. Porta: ${port}`))