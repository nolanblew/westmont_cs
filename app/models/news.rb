# == Schema Information
#
# Table name: news
#
#  id                :integer         not null, primary key
#  title             :string(255)
#  short_description :string(255)
#  long_description  :string(255)
#  alias             :string(255)
#  category          :integer
#  created_by        :integer
#  front_page        :boolean
#  tags              :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class News < ActiveRecord::Base
end
