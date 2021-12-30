module MOS6502
  module Flags
    FLAGS = %w(negative overflow high break decimal interrupt zero carry).freeze
  
    def flags_reset
      FLAGS.each { |flag_name| instance_variable_set("@#{flag_name}", false) }
    end
  
    def self.included(base)
      FLAGS.each do |flag_name|
        next if flag_name == 'high'
        
        base.define_method(:"#{flag_name}?") { instance_variable_get("@#{flag_name}") }
        base.define_method(:"#{flag_name}=") { |value| instance_variable_set("@#{flag_name}", value) }
      end
    end
    
    def flags_encode
      FLAGS.reduce(0) do |memo, flag_name|
        bit = if %w(high break).include?(flag_name)
                1
              else
                bit_value(instance_variable_get("@#{flag_name}"))
              end
        (memo << 1) + bit
      end
    end
    
    def flags_decode(value)
      @negative  = (value & 128).positive?
      @overflow  = (value & 64).positive?
      @decimal   = (value & 8).positive?
      @interrupt = (value & 4).positive?
      @zero      = (value & 2).positive?
      @carry     = (value & 1).positive?
    end
    
    def bit_value(bool)
      bool ? 1 : 0
    end
  end
end