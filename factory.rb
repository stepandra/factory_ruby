# Implementation of Struct class
class Factory
  def self.new(*args, &block)
    Class.new do
      attr_accessor(*args)

      define_method :initialize do |*values|
        @values = values
        args.each_with_index do |item, index|
          public_send("#{item}=", values[index])
        end
      end

      def [](key)
        key.is_a?(Numeric) ? @values[key] : public_send(key.to_sym)
      end
      class_eval(&block) if block_given?
    end
  end
end
