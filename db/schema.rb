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

ActiveRecord::Schema.define(version: 20160917040036) do

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_comments_on_project_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_likes_on_project_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notices", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_notices_on_project_id"
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "프로젝트명"
    t.text     "일정"
    t.text     "목표"
    t.string   "시작일자"
    t.string   "종료일자"
    t.integer  "인원"
    t.string   "photo"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "remarks", force: :cascade do |t|
    t.text     "body"
    t.integer  "result_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_remarks_on_result_id"
    t.index ["user_id"], name: "index_remarks_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.string   "프로젝트명"
    t.text     "소개"
    t.text     "소감"
    t.string   "시작일자"
    t.string   "종료일자"
    t.string   "attachment"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_results_on_project_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "thumbsups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_thumbsups_on_result_id"
    t.index ["user_id"], name: "index_thumbsups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "image"
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.string   "avatar"
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
