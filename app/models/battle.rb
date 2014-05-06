class Battle < ActiveRecord::Base
  #set up habtm
  #has_many :battles_hashtags
  #has_many :hashtags, :through => :battles_hashtags
  has_and_belongs_to_many :hashtags


  accepts_nested_attributes_for :hashtags , :allow_destroy => true

  #validation
  validates :tag_one, format: {with: /#[\w+]/, message: "Must have a # attached"}
  validates :tag_two, format: {with: /#[\w+]/, message: "Must have a # attached"}
  validates_presence_of :tag_one, :tag_two, :name

  #nested form attributes
  def hashtags_for_form
    collection = hashtags.where(battle_id: id)
    collection.any? ? collection : hashtags.build
  end
end
