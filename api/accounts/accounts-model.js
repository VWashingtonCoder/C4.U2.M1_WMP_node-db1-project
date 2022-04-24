const db = require('../../data/db-config')

const getAll = () => {
  // query: SELECT * FROM accounts 
  return db('accounts')
}

const getById = id => {
  // query: SELECT * FROM accounts WHERE id = ?
  return db('accounts')
    .where('id', id)
}

async function create (account) {
  // query: INSERT INTO accounts (name, budget) values(?, ?)
  let [id] = await db('accounts').insert(account)
  return getById(id)
}

async function updateById(id, account) {
  // query: update accounts set name = ?, budget = ? where id = ?
  await db('accounts')
    .where('id', id)
    .update(account)
  return getById(id)
}

async function deleteById (id) {
  // query: delete from accounts where id = ?
  let result = await getById(id)
  await db('accounts')
    .where('id', id)
    .del()
  return result
}

module.exports = {
  getAll,
  getById,
  create,
  updateById,
  deleteById,
}
