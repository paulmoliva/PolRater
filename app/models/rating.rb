class Rating < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :winner,
    primary_key: :id,
    foreign_key: :winnner_id,
    class_name: :Character

  belongs_to :loser,
    primary_key: :id,
    foreign_key: :loser_id,
    class_name: :Character
end
