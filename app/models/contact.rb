class Contact < ApplicationRecord

  def full_name
    full_name = "#{first_name} #{last_name}"
  end

  def friendly_updated_at
    friendly_updated_at = updated_at.strftime("%m-%e-%y %H:%M")
  end

  def friendly_created_at
    friendly_created_at = created_at.strftime("%m-%e-%y %H:%M")
  end


end
