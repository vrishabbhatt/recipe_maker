class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients , dependent: :destroy
		accepts_nested_attributes_for :ingredients,allow_destroy: true
	has_many :ratings

	def avg_rating
		avg_score = 0
		if self.ratings.count != 0
			self.ratings.each do |rating|
				avg_score = avg_score + rating.score
			end
			avg_score = avg_score/self.ratings.count
		else
			avg_score = 0
		end
		avg_score
	end

	def get_user
		user = User.find(self.user_id)
		user
	end
end
