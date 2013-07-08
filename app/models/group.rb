class Group < ActiveRecord::Base
  has_many :links, :dependent => :destroy
  belongs_to :color

  validates :color_id, :presence => true
  validates :title, :presence => true, :uniqueness => true
end
