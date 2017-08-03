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
  has_many :blog_posts

  before_save :verify_valid_age

  def verify_valid_age
    if age < 12 || age > 120
      self.errors.add('Age in invalid!')
    end
  end

  def is_teenager
    age < 18 ? true : false
  end

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      nil
    end
  end

  def self.total_logins
    all.inject(0) do |sum, person|
      sum += person.number_of_logins
    end
  end

  def set_nickname
    new_nickname = ''
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
    # experience_level = if blog_post_count < 10
    #   'Beginner'
    # elsif blog_post_count < 20
    #   'Apprentice'
    # elsif blog_post_count < 30
    #   'Expert'
    # else
    #   'Guru'
    # end
    puts experience_level
    new_nickname = experience_level + ' Writer'
    if !number_of_logins.nil?
      if number_of_logins == 42
        new_nickname = 'Special ' + new_nickname
      end
    end
    nickname = new_nickname
    save
  end
end
