class Drink < ActiveRecord::Base
    belings_to :recipe
    belongs_to :ingredient
end