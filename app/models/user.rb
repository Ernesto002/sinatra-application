class User < ActiveRecord::Base
    has_many :reviews
    has_many :reviewed_shows, through: :reviews, source: :show
    has_secure_password
end
