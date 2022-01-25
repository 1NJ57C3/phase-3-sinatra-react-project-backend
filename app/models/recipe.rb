class Recipe < ActiveRecord::Base
    has_many :drinks
    has_many :ingredients, through: :drinks
end