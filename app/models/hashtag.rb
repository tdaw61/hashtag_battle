class Hashtag < ActiveRecord::Base
  #has_many :battles_hashtags
  #has_many :battles , :through => :battles_hashtags
  has_and_belongs_to_many :battles

  validates :content, format: {with: /#[\w+]/, message: "Must have a # attached"}


end
