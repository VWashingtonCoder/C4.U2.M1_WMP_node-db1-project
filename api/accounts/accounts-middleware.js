const Accounts = require("./accounts-model")
const db = require('../../data/db-config')

exports.checkAccountId = (req, res, next) => {
  Accounts.getById(req.params.id)
    .then(account => {
      if(!account[0]){
        res.status(404).json({
          message: 'account not found'
        });
        return;
      } else {
        req.liveAccountID = account[0].id
        next();
      }
    })
}

exports.checkAccountPayload = (req, res, next) => {
  let errMessage = ''
  const { name, budget } = req.body

  if (name === undefined || budget === undefined){
    errMessage = 'name and budget are required'
  } else if(name.trim().length < 3 || name.trim().length > 100) {
    errMessage = 'name of account must be between 3 and 100';
  } else if(typeof budget !== "number" || isNaN(budget) === true) {
    errMessage = 'budget of account must be a number';
  } else if(budget < 0 || budget > 1000000) {
    errMessage = 'budget of account is too large or too small';
  } 

  if(errMessage !== '') {
    res.status(400).json({  message: errMessage })
    return;
  } else {
    req.validPayload = {name: name.trim(), budget: budget}
    next();
  }
}

exports.checkAccountNameUnique = (req, res, next) => {
  const givenName = req.body.name.trim()
  
  Accounts.getAll()
    .then(accounts => {
      accounts.forEach(account => {
        if(account.name === givenName){
          res.status(404).json({ message: "that name is taken" })
          return;
        }
      })
      next();
    })
    .catch(err => {
      console.log(err)
      res.status(500).json({ message: "accounts could not be retrieved" })
    })
}


