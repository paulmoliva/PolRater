class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :ratings

  def record_rating!(category_id, winner_id, loser_id)
    raise 'cannot have same winner and loser' if winnner_id == loser_id
    Rating.create!(category_id: category_id,
                   winner_id: winner_id,
                   loser_id: loser_id,
                   user_id: id)
  end

  def already_rated?(character1, character2, category_id)
    combo1 = category_ratings(category_id)
      .where("winner_id = ?", character1)
      .where("loser_id = ?", character2)
      .count

    combo2 = category_ratings(category_id)
      .where("winner_id = ?", character2)
      .where("loser_id = ?", character1)
      .count

    combo1 + combo2 == 1
  end

  def category_ratings(category_id)
    ratings.where("category_id = ?", category_id)
  end

  def get_new_pair_to_rate(category_id)
    character1, character2 = Character.random_pair
    until valid_pair?(character1, character2, category_id)
      character1, character2 = Character.random_pair
    end
    [character1, character2]
  end

  def valid_pair?(character1, character2, category_id)
    character1 != character2 && !already_rated?(character1, character2, category_id)
  end
end
