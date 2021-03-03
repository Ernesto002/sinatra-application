class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    has_many :reviewed_shows, through: :reviews, source: :show
end
