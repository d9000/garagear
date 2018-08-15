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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140314202500) do

  create_table "aniovs", force: true do |t|
    t.integer  "modelo_id"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "profile_id"
  end

  create_table "marcas", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modelos", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marca_id"
  end

  create_table "profiles", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "fname"
    t.string   "lname"
  end

  add_index "profiles", ["email"], name: "index_profiles_on_email", unique: true
  add_index "profiles", ["reset_password_token"], name: "index_profiles_on_reset_password_token", unique: true

  create_table "profiles_roles", id: false, force: true do |t|
    t.integer "profile_id"
    t.integer "role_id"
  end

  add_index "profiles_roles", ["profile_id", "role_id"], name: "index_profiles_roles_on_profile_id_and_role_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "servs", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "veh_id"
    t.integer  "kilometros"
    t.decimal  "costo",          precision: 8, scale: 3
    t.integer  "tiposerv_id"
    t.datetime "fecha"
    t.decimal  "costorepuestos"
  end

  create_table "tiposervs", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehs", force: true do |t|
    t.string   "dominio"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version_id"
    t.string   "picname"
    t.binary   "picdata"
    t.string   "mime_type"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "marca_id"
    t.integer  "modelo_id"
    t.integer  "aniov_id"
    t.string   "privstatus"
  end

  create_table "versions", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aniov_id"
  end

end
