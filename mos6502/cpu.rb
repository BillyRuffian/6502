require_relative 'flags'
require_relative 'memory'
require_relative 'registers'

module MOS6502
  class CPU
    include Registers
    include Flags
    include Memory
    
    attr_reader :stack_pointer, :program_counter
    
    def initialize
      reset
    end
    
    private
    
    def reset
      @stack_pointer = 0xff
      @program_counter = 0x600
      memory_reset
      registers_reset
      flags_reset
    end
    
  end
end