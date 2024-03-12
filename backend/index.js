const express = require("express")
const cookieSession = require('cookie-session');
const path = require("path");

const app = express();
const cors = require('cors')
app.use(cors())

// Statics
app.use('/static', express.static(path.join(__dirname, 'static')));
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded


app.use(cookieSession({
  name: 'session',
  keys: ['key1', 'key2'],
  maxAge:  3600 * 1000 // 1hr
}));

// routers
const indexRouter = require('./routes/index')
const userRouter = require('./routes/user')
const tableRouter = require('./routes/table')
const orderRouter = require('./routes/order')


app.use(indexRouter.router)
app.use(userRouter.router)
app.use(tableRouter.router)
app.use(orderRouter.router)



app.listen(3000, () => {
  console.log(`Example app listening at http://44.206.165.83:3000`)
})