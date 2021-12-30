module MOS6502
  module Registers
  
    attr_accessor :register_x, :register_y, :accumulator
    
    def registers_reset
      @register_x = 0
      @register_y = 0
      @accumulator = 0
    end
  
  end
end