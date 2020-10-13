class User < ApplicationRecord
    has_many :recipes

    validates :name, :age, presence: true
    validates :age, numericality: {greater_than: 13, less_than: 99}

end
