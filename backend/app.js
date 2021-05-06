const express = require('express')
const database = require('./db')
const cors = require('cors')

const app = express()
app.use(express.json())
var corsOptions = {
  origin: "http://localhost:8080"
}

app.use(cors(corsOptions))

// app.use((req, res) => {
//     res.status(200);
//     res.json({
//        message: "Premier message"
//     });
// });


// GET ALL CATEGORIES
app.get('/home', (req, res) => {
   database.query('SELECT * FROM categorie', (err, result) => {
       if (err) throw err;
       const categories = JSON.stringify(result)
       return res.end(categories, function (err){
          if (err) throw err;
       })
   })
})

// GET ALL SUBCATEGORIES By ID Categories
app.get('/sous_categories/:id', (req, res) => {
    const id = req.params.id;
    database.query('SELECT * FROM sous_categorie WHERE id_categorie =' + id, (err, result) => {
        if (err) throw err;
        const categories = JSON.stringify(result);
        return res.end(categories, function (err){
            if (err) throw err;
        })
    })
})

// GET NAME CAT By ID Categories
app.get('/Namecategorie/:id', (req, res) => {
    const id = req.params.id;
    database.query('SELECT titre_systeme FROM categorie WHERE id =' + id, (err, result) => {
        if (err) throw err;
        const categories = JSON.stringify(result);
        return res.end(categories, function (err){
            if (err) throw err;
        })
    })
})

// GET ALL Products By Id SubCategories
app.get('/all_products/:id', (req, res) => {
    const id = req.params.id;
    database.query('SELECT * FROM produit WHERE id_sous_categorie =' + id, (err, result) => {
        if (err) throw err;
        const categories = JSON.stringify(result);
        return res.end(categories, function (err){
            if (err) throw err;
        })
    })
})

// GET ALL Products By Id SubCategories
app.get('/nomSousCategorie/:id', (req, res) => {
    const id = req.params.id;
    database.query('SELECT titreSysteme FROM sous_categorie WHERE id =' + id , (err, result) => {
        if (err) throw err;
        const nomSousCategorie = JSON.stringify(result);
        return res.end(nomSousCategorie, function (err){
            if (err) throw err;
        })
    })
})

// GET Product By Id
app.get('/product/:id', (req, res) => {
    const id = req.params.id;
    database.query('SELECT * FROM produit WHERE id =' + id, (err, result) => {
        if (err) throw err;
        const categories = JSON.stringify(result);
        return res.end(categories, function (err){
            if (err) throw err;
        })
    })
})

// PUT Product By Id
app.get('/addProduct/:id', (req, res) => {
    const id = req.params.id;
    database.query('INSERT INTO panier(idProduit,titre) SELECT id,titre FROM produit WHERE id =' + id, (err, result) => {
        if (err) throw err;
        const categories = JSON.stringify(result);
        return res.end(categories, function (err){
            if (err) throw err;
        })
    })
})

// PUT Product By Id
app.post('/inscription/', (req, res) => {
    console.log("recu");
    console.log(req.body);

    // const id = req.params.id;
    database.query('INSERT into user SET ?' , req.body , (err, result) => {
        if (err) throw err;
        const categories = JSON.stringify(result);
        return res.end(categories, function (err){
            if (err) throw err;
        })
    })
})

module.exports = app
