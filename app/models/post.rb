class Post < ActiveRecord::Base
  validates :title, :presence => true,  :length => { :minimum => 5 }
  validates :content, :presence => true, :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy

  belongs_to :user
end
