class User < ActiveRecord::Base
  has_many :ratings
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def record_rating!(category_id, winner_id, loser_id)
    raise 'cannot have same winner and loser' if winner_id == loser_id
    # byebug
    Rating.create!(category_id: category_id,
                   winner_id: winner_id,
                   loser_id: loser_id,
                   user_id: id)
    # self.flash_notice = "You think #{Character.find(winner_id).character_name} is #{Category.find(category_id).category_name} than #{Character.find(loser_id).character_name}!"

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
