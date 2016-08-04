class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :user_name, :email, presence: true, uniqueness: true
  validates_confirmation_of :password, message: "should match confirmation", if: :password
  has_many :ratings
  attr_accessor :flash_notice

  def record_rating!(category_id, winner_id, loser_id)
    raise 'cannot have same winner and loser' if winner_id == loser_id
    # byebug
    Rating.create!(category_id: category_id,
                   winner_id: winner_id,
                   loser_id: loser_id,
                   user_id: id)
    self.flash_notice = "You think #{Character.find(winner_id).character_name} is #{Category.find(category_id).category_name} than #{Character.find(loser_id).character_name}!"

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
