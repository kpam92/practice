require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
      return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
      0
    SQL

    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |name|

      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    class_name = self.to_s.split /(?=[A-Z])/
    class_name = class_name.map(&:downcase).join("_") + "s"
    @table_name ||= class_name
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
                SELECT
                  #{table_name}.*
                FROM
                  #{table_name}
              SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |key,value|
      attribute = key.to_sym
      if self.class.columns.include?(attribute)
        self.send("#{attribute}=", value)
      else
        raise "unknown attribute '#{attribute}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
