const router = require('express').Router()
const Accounts = require('./accounts-model')
const { checkAccountId, checkAccountPayload, checkAccountNameUnique } = require('./accounts-middleware')

router.get('/', async (req, res, next) => {
  // DO YOUR MAGIC
  try{
    const data = await Accounts.getAll()
    res.status(200).json(data)
  } catch(err) {
    next(err)
  }
})

router.get('/:id', checkAccountId, async (req, res, next) => {
  // DO YOUR MAGIC
  try{
    const data = await Accounts.getById(req.liveAccountID)
    res.status(200).json(data[0])
  } catch(err) {
    next(err)
  }
})

router.post('/', checkAccountPayload, checkAccountNameUnique, async (req, res, next) => {
  // DO YOUR MAGIC
  try{
    const data = await Accounts.create(req.validPayload)
    res.status(201).json(data[0])
  } catch(err){
    next(err)
  }
})

router.put('/:id', checkAccountId, checkAccountPayload, checkAccountNameUnique, async (req, res, next) => {
  // DO YOUR MAGIC
  try{
    const data = await Accounts.updateById(req.liveAccountID, req.validPayload)
    res.status(200).json(data[0])
  } catch(err){
    next(err)
  }
});

router.delete('/:id', checkAccountId, async (req, res, next) => {
  // DO YOUR MAGIC
  try{
    const data = await Accounts.deleteById(req.liveAccountID)
    res.status(200).json(data[0])
  } catch(err) {
    next(err)
  }
})

router.use((err, req, res, next) => { // eslint-disable-line
  // DO YOUR MAGIC
  res.status(err.status || 500).json({
    message: err.message,
    stack: err.stack
  })
})

module.exports = router;
