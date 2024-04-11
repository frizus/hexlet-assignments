# frozen_string_literal: true

# BEGIN
module Model
  def initialize(initial_attributes = {})
    @attributes = {}
    self.class.attribute_options.each_pair do |name, options|
      value = initial_attributes.fetch(name, options.fetch(:default, nil))
      method("#{name}=").call(value)
    end
  end

  module ClassModel
    def attribute_options
      @attribute_options || {}
    end

    def attribute(name, options = {})
      @attribute_options ||= {}
      attribute_options[name] = options

      define_method :"#{name}" do
        @attributes[name]
      end
      define_method :"#{name}=" do |value|
        @attributes[name] = cast(value, self.class.attribute_options[name])
      end
    end
  end

  def self.included(base)
    base.attr_reader :attributes
    base.extend ClassModel
  end

  private

  def cast(value, options)
    return value if value.nil?

    case options[:type]
    when :integer
      value.to_i
    when :string
      value.to_s
    when :datetime
      DateTime.parse value
    when :boolean
      value ? true : false
    else
      value
    end
  end
end
# END
