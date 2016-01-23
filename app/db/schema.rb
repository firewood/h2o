ActiveRecord::Schema.define(version: 20160115125649) do
  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
