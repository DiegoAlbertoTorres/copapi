class HitSerializer < ActiveModel::Serializer
  attributes :timestamp, :lat, :long, :report, :id, :phone, :firstname, :lastname
  def firstname
   object.name
  end

  def lastname
    object.last
  end

  def timestamp
    object.created_at
  end

  def id
    object.id
  end

  def phone
   object.phone
  end

  def lat
    object.latitude
  end

  def long
    object.longitud
  end

  #def emergency_contact
  # {
   #   name: object.user.emergency_contact_name,
    #  phone: object.user.emergency_contact_phone,
     # aleternate_phone: object.user.emergency_contact_alternate_phone,
      #relation: object.user.emergency_contact_relation
    #}
  #end

  #def address
   # {
    #  line_1: object.user.address_1,
     # line_2: object.user.address_2,
      #zip_code: object.user.address_zip_code,
      #state: object.user.address_state,
      #country:object.user.address_country
    #}
  #end
end
