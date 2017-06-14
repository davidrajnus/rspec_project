class Status < ActiveRecord::Base

  validates :title, presence: true, length: { :minimum => 8, :too_short => "title is too short"}
  validates :content, presence: true, length: { :minimum => 10, :too_short => "content is too short"}

  belongs_to :user
  has_many :likes, :dependent => :destroy

  #makes the defaule ordering of status by created_at
  default_scope { order(created_at: :desc) }


end
