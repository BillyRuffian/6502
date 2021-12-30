require_relative 'flags'
require_relative 'memory'
require_relative 'registers'

module MOS6502
  class CPU
    include Registers
    include Flags
    include Memory
    
    def initialize
      reset
    end
    
    def reset
      memory_reset
      registers_reset
      flags_reset
    end
    
  end
end