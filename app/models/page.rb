# == Schema Information
#
# Table name: pages
#
#  id          :integer         not null, primary key
#  section_id  :integer
#  name        :string(255)
#  description :string(255)
#  content     :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Page < ActiveRecord::Base
  has_one :section
end
