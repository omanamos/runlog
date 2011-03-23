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

ActiveRecord::Schema.define(:version => 20110323225448) do

  create_table "aerobic_workouts", :force => true do |t|
    t.decimal  "distance",   :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.date     "date",          :null => false
    t.integer  "loggable_id"
    t.string   "loggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "splits", :force => true do |t|
    t.decimal  "distance",           :precision => 10, :scale => 0
    t.integer  "distance_units"
    t.decimal  "duration",           :precision => 10, :scale => 0
    t.text     "notes"
    t.integer  "position"
    t.integer  "aerobic_workout_id",                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strength_workouts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_workouts", :force => true do |t|
    t.decimal  "duration",         :precision => 10, :scale => 0, :null => false
    t.decimal  "distance",         :precision => 10, :scale => 0
    t.integer  "distance_units"
    t.integer  "avr_hr"
    t.integer  "max_hr"
    t.text     "notes"
    t.integer  "workout_id",                                      :null => false
    t.integer  "workoutable_id",                                  :null => false
    t.string   "workoutable_type",                                :null => false
    t.integer  "workout_name_id",                                 :null => false
    t.integer  "workout_type_id",                                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "content",       :null => false
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_tags", :force => true do |t|
    t.string   "color",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.string   "role",                               :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weather_tags", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workout_names", :force => true do |t|
    t.string   "content",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workout_types", :force => true do |t|
    t.string   "content",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", :force => true do |t|
    t.time     "time_of_day"
    t.text     "description"
    t.integer  "effort"
    t.integer  "quality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
