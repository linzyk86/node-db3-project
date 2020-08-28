const db = require("../data/config")


function find(){
    return db('schemes')
}

function findById(id){
    return db('schemes')
    .where({id}).first()
}

function findSteps(id){
    return db('steps as s')
    .join("schemes", "schemes.id", "s.scheme_id")
    .where("s.scheme_id", id)
    .select("s.scheme_id", "s.step_number", "s.instructions")
}
function add(scheme) {
  return db("schemes")
    .insert(scheme, "id")
}

function update(changes, id){
    return db("schemes")
    .where("id", id)
    .update(changes)
}

function remove(id){
    return db('schemes')
    .where("id", id)
    .del()
}

module.exports= {
    find, findById, findSteps, add, update, remove
}