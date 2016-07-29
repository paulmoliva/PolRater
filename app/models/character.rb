class Character < ActiveRecord::Base
  validates :character_name, presence: true, uniqueness: true

  has_many :losses,
    primary_key: :id,
    foreign_key: :loser_id,
    class_name: :Rating

  has_many :wins,
    primary_key: :id,
    foreign_key: :winner_id,
    class_name: :Rating

  def total_ratings
    wins.count + losses.count
  end

  def total_score
    win_score = wins.count * 100
    win_score.fdiv(total_ratings)
  end

  def category_wins(category_id)
    wins.where("ratings.category_id = ?", category_id).count
  end

  def category_losses(category_id)
    losses.where("ratings.category_id = ?", category_id).count
  end

  def category_score(category_id)
    w = category_wins(category_id)
    l = category_losses(category_id)
    total = l + w
    (w * 100).fdiv(total)
  end

  def self.random_character
    rand(self.all.length)
  end

  def self.random_pair
    character1 = self.random_character
    character2 = self.random_character
    [character1, character2]
  end
end
