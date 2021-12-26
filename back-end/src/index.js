const express = require('express')
const bodyParser = require('body-parser')
const { queryMailList, addMail } = require('./db')
const Response = require('./response')

const app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

app.post('/mail/add', async (req, res) => {
  const addForm = req.body
  try {
    await addMail(addForm)
    res.send(Response.success())
  } catch (e) {
    res.send(Response.fail(500, {}, e))
  }
})

app.post('/mail/query', async (req, res) => {
  try {
    const rows = await queryMailList(req.body)
    // console.log(rows)
    res.send(Response.success(rows))
  } catch(e) {
    res.send(Response.fail(500, {}, e))
  }
  
  res.end()

})


app.listen(8090, () => {
  console.log('server start in 8090 port')
})