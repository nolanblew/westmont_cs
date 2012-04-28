# == Schema Information
#
# Table name: sections
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  alias       :string(255)
#  description :string(255)
#  home        :string(255)
#  position    :integer
#  visible     :string(255)     default("t")
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Section < ActiveRecord::Base
  has_many :pages, :order => "position"

  validates :name, :presence => true
  validates :alias, :presence => true
  validates :home, :presence => true
  validates :position, :presence => true
end
