# Implementation of Struct class
class Factory
  def self.new(*args, &block)
    Class.new do
      attr_accessor(*args)

      define_method :initialize do |*values|
        args.each_with_index do |item, index|
          raise NameError, "key #{item} isn't constant" unless item.is_a? Symbol
          public_send("#{item}=", values[index])
        end
      end

      def [](key)
        if key.is_a?(Numeric)
          instance_variable_get(instance_variables[key])
        else
          public_send(key.to_sym)
        end
      end

      class_eval(&block) if block_given?
    end
  end
end
