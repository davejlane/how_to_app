class List < ActiveRecord::Base
  has_many :steps, dependent: :destroy, foreign_key: "list_id"
end
