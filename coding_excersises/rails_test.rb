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

  has_many(:blog_posts,
           foreign_key: :user_id,
           class_name: 'Post')

  before_save :verify_valid_age

  def verify_valid_age
    if age < 12 || age > 120
      self.errors.add('Age in invalid!')
    end
  end

  def is_teenager
    self.age < 18 ? true : false
  end

  def full_name
    if self.first_name && self.last_name
      "#{first_name} #{last_name}"
    else
      nil
    end
  end

  def self.total_logins
    Person.all.inject(0) do |sum, person|
      sum += person.number_of_logins
    end
  end

  def set_nickname
    # new_nickname = ''
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
    # save
  end

end
