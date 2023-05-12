const express = require("express")

const app = express();
const cors = require('cors')
app.use(cors())

// Statics
app.use(express.static('static'))
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

// routers
const indexRouter = require('./routes/index')
const userRouter = require('./routes/user')

app.use(indexRouter.router)
app.use(userRouter.router)

app.listen(3000, () => {
  console.log(`Example app listening at http://localhost:3000`)
})