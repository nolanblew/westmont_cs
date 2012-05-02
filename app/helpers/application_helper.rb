module ApplicationHelper

  #Returns the largest position
  def largest_position(list)
    largest = 0
    list.each do |itm|
      largest = itm.position if itm.position > largest
    end

    return largest
  end

end
