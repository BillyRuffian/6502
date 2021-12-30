module MOS6502
  module Memory
    
    def memory_reset
      @memory ||= []
    end
    
    def read_byte(addr)
      @memory.fetch(addr, 0)
    end
    
    def write_byte(addr, value)
      # store max 255
      @memory[addr] = value & 0xff 
    end
    
    def read_word(addr)
      read_byte(addr) + (read_byte(addr + 1) << 8)
    end
  
  end
end