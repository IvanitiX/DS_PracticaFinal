# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_18_150755) do

  create_table "clientes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "apellidos", null: false
    t.string "domicilio", null: false
    t.string "correo", null: false
    t.string "contrasena", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["correo"], name: "correo", unique: true
  end

  create_table "tecnicos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "apellidos", null: false
    t.decimal "valoracion", precision: 10, default: "5", null: false
    t.string "tipo_tecnico", limit: 256, null: false
    t.integer "num_trabajos", default: 0, null: false
    t.string "contrasena", null: false
    t.string "email", null: false
    t.index ["email"], name: "email", unique: true
    t.index ["tipo_tecnico"], name: "Foreign_TipoTrabajo"
  end

  create_table "tipo_trabajos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "Tipo", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Tipo"], name: "Tipo", unique: true
  end

  create_table "trabajos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descripcion", null: false
    t.string "localizacion", null: false
    t.float "presupuesto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tipotrabajo"
    t.bigint "Id_tecnico", null: false
    t.bigint "Id_cliente", null: false
    t.index ["Id_cliente"], name: "IDClienteInClientes"
    t.index ["tipotrabajo"], name: "TipoTrabajoInTrabajos"
  end

  add_foreign_key "tecnicos", "tipo_trabajos", column: "tipo_tecnico", primary_key: "Tipo", name: "Foreign_TipoTrabajo"
  add_foreign_key "trabajos", "clientes", column: "Id_cliente", name: "IDClienteInClientes"
  add_foreign_key "trabajos", "tipo_trabajos", column: "tipotrabajo", primary_key: "Tipo", name: "TipoTrabajoInTrabajos"
end
