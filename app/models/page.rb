# == Schema Information
#
# Table name: pages
#
#  id          :integer         not null, primary key
#  section_id  :integer
#  alias       :string(255)
#  name        :string(255)
#  description :string(255)
#  content     :text
#  position    :integer
#  visible     :boolean         default(TRUE)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Page < ActiveRecord::Base
  has_one :sections

  validates :name, :presence => true
  validates :alias, :presence => true
  validates :position, :presence => true
end
