class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :gossip, dependent: :destroy
end
