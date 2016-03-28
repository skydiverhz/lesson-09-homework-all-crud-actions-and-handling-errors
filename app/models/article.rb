class Article < ActiveRecord::Base
	validates :title, uniqueness: { case_sensitive: false }
	validates :title, presence: true
end
