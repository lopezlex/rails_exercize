class Event < ApplicationRecord

  before_save :set_slug

  has_many :registrations, dependent: :destroy # for accessing registrations from specific event
  # through associations
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true

  validates :description, length: {minimum: 25 }

  validates :price, numericality: { greater_than_or_equal_to: 0}

  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  validates :image_file_name, format: { with: /\w+\.(jpg|png)\z/i, message: "must be a JPG or PNG image"}

  scope :past, -> {where("starts_at < ?", Time.now).order("starts_at")}
  scope :upcoming, -> {where("starts_at > ?", Time.now).order("starts_at")}
  scope :free, -> { upcoming.where(price: 0.0).order(:name)}
  scope :recent, ->(max=3) { past.limit(max) }

  # def self.upcoming
  #   where("starts_at > ?", Time.now).order("starts_at") #desc
  # end

  def free?
    price.blank? || price.zero?
  end

  def sould_out?
    (capacity - registrations.size).zero?
  end

  def to_param
    name.parameterize
  end

private
  def set_slug
    self.slug = name.parameterize
  end

end

# bundler-ralated issue

# I can create rails projects but there's a missing files and it says An error occurred while installing sqlite3 (1.5.3), and Bundler cannot
# continue. And when i run bundler install to install missing gems it still has error says An error occurred while installing sqlite3 (1.5.3), and Bundler cannot
# continue, results in the same error. how can i resolve this?

# rendering the data in the browser with the mvc architecture
# creating new database migration file and migrate it to database to add new column to the database table
# inserting data to new added column and rendering it in the browser
# using helper module to create 
# dropping the database apply migration and load the seed data
# designing the web app with sass




# linking pages with linking_to method and method helper path method
# fetching data from database, edit it in the form component and update the existing data
# inserting new data in the database with form
# resources entity that defines autmatic routes
# removing duplication codes with partial files

# performed rails CRUD and custom queries
# adding new database migration file that can store image file name
# form validation, displaying error and success messages in the browser


# model associations
# resources nesting
# rendering data from a 
# user password encryption
# sign up, sign in, sign out, update an account, and delete an account
# user credentials authentication
# sessions and authorizations

# non-users and users authorization
# admin authorizations

# join table which is addressing associations between different models to be able to fetched data associated with another data which is on another table
#through associations

# rails g migration AddAdminToUsers admin:boolean
# rails g resource like event:references user:references
# rails g resource category name:string
# rails g model categorization event:references cataegory:references
# rails g migration AddSlugToEvents slug

# checkboxes
# scopes
# collable object lambda{} or ->
# - return pro object and defines custom queries
# slug
# model callback


