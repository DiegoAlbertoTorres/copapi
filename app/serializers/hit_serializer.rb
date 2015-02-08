class HitSerializer < ActiveModel::Serializer
  attributes :name, :timestamp, :phone, :lat, :long, :report, :emergency_contact, :address

  def name
    self.user.name
  end

  def timestamp
    self.created_at
  end

  def phone
    self.user.phone
  end

  def lat
    self.latitude
  end

  def long
    self.longitude
  end

  def emergency_contact
    {
      name: self.user.emergency_contact_name,
      phone: self.user.emergency_contact_phone,
      aleternate_phone: self.user.emergency_contact_alternate_phone,
      relation: self.user.emergency_contact_relation
    }
  end

  def address
    {
      line_1: self.user.address_1,
      line_2: self.user.address_2,
      zip_code: self.user.address_zip_code,
      state: self.user.address_state,
      country:self.user.address_country
    }
  end
end
