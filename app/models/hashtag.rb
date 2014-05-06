class Hashtag < ActiveRecord::Base
  has_and_belongs_to_many :battles

  validates :content, format: {with: /#[\w+]/, message: "Must have a # attached"}
  validates_presence_of :content
end
