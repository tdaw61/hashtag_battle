class Battle < ActiveRecord::Base
  #set up habtm
  has_and_belongs_to_many :hashtags

  accepts_nested_attributes_for :hashtags , :allow_destroy => true

  #validation
  validates_presence_of  :name

  #nested form attributes
  def hashtags_for_form
    collection = hashtags.where(battle_id: id)
    collection.any? ? collection : hashtags.build
  end
end
