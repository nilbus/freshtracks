# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091130200950) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "number"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credits"
  end

  create_table "degree_requirements", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "required_id"
    t.string   "required_type"
    t.integer  "course_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "passed_courses", :force => true do |t|
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prerequisites", :force => true do |t|
    t.integer  "course_id"
    t.integer  "needs_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registered_sections", :force => true do |t|
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.integer  "semester_id"
    t.string   "room"
    t.string   "professor"
    t.string   "number"
    t.time     "begin_time"
    t.time     "end_time"
    t.string   "days"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  create_table "semesters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishlist_sections", :force => true do |t|
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
