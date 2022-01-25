class Ingredient < ActiveRecord::Base
    has_many :drinks
    has_many :recipes, through: :drinks
end