# The following is a model written with Ruby on Rails 2, which interacts with a table,
# called "people". This code can definitely be cleaned up and improved
# If you were tasked with refactoring this model to better take advantage
# of best practices, what would you change? Please make your edits and send back!
#
# model attributes:
# first_name
# last_name
# nickname
# age
# number_of_logins

class Person < ActiveRecord::Base

  # would have below validations if in rails 4 or 5
  # validates :first_name, :last_name, :age, null: false

  # flushed out the has many relation
  has_many(:blog_posts,
           foreign_key: :user_id,
           class_name: 'Post')

  before_save :verify_valid_age

  # changed 'or' to || and fixed the added error syntax
  # added 'self' to age for easy reading
  def verify_valid_age
    if self.age < 12 || self.age > 120
      self.errors.add(:age, message:'Age in invalid!')
    end
  end

  # added "?" to emphasize it being a boolean method
  # added 'self' to age for easy reading
  def is_teenager?
    self.age < 18 ? true : false
  end

  # alternative method to check if user is an actual teenager
  # def is_teenager?
  #   (self.age < 20 && self.age > 12 ) ? true : false
  # end


  # added "self" for easy reading
  # returns 'no x name' dependent on missing name
  def full_name
    if self.first_name && self.last_name
      "#{first_name} #{last_name}"
    elsif self.last_name
      'no first name'
    elsif self.first_name
      'no last name'
    end
  end
  # added "Person" for easy reading
  # changed to sum
  def self.total_logins
    Person.all.sum(:number_of_logins)
  end

  # split up some of the logic
  # kept the 'puts' statements for logging in the console.
  def set_nickname

    # instead of querying db for posts matching to this person,
    # we utilize their has_many blog_posts relation to find the blog post
    # count instead

    blog_post_count = self.blog_posts.count
    puts blog_post_count

    if blog_post_count < 10
      new_nickname = 'Beginner Writer'
    elsif blog_post_count < 20
      new_nickname = 'Apprentice Writer'
    elsif blog_post_count < 30
      new_nickname = 'Expert Writer'
    else
      new_nickname = 'Guru Writer'
    end
    # new_nickname = experience_level + ' Writer'
    if !self.number_of_logins.nil? && self.number_of_logins == 42
      new_nickname = 'Special ' + new_nickname
    end

    puts new_nickname[0..-7]

    self.nickname = new_nickname

    # didn't see a need for this save below, would leave it if
    # the person was retrieved from the db and filed under a variable.

    # save
  end

end
