# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110922164610) do

  create_table "responsables", :force => true do |t|
    t.string   "nombre"
    t.string   "correo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clave_cifrada"
    t.string   "salt"
  end

  add_index "responsables", ["correo"], :name => "index_responsables_on_correo"

  create_table "tareas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "detalles"
    t.date     "fecha"
    t.integer  "responsable_id"
    t.boolean  "completa",       :default => false, :null => false
  end

  add_index "tareas", ["fecha"], :name => "index_tareas_on_fecha"
  add_index "tareas", ["responsable_id"], :name => "index_tareas_on_responsable_id"

end
