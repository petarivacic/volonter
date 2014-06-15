class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  before_create :create_slug

  field :name, type: String
  field :date, type: String

  field :adresa, type: String
  field :grad, type: String
  field :telefon

  field :lat
  field :lon

  field :location, type: String
  field :description, type: String
  field :category, type: String
  field :priority, type: String
  field :registrations, type: Integer, default: 0
  field :tag, type: String
  field :slug, type: String

  def register
    self.registrations += 1
    self.save
  end

  def create_slug
    self.slug = self.name.parameterize
  end


end
