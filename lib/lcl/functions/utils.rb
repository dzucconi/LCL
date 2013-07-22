require "rbconfig"

BYTES         = ["*"].pack("p").size
BITS          = BYTES * 8
MAX_SIGNED    = 2**(BITS-1) - 1
MAX_UNSIGNED  = 2**BITS - 1

def os
  @os ||= (
    host_os = RbConfig::CONFIG["host_os"]

    case host_os
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      :macosx
    when /linux/
      :linux
    when /solaris|bsd/
      :unix
    else
      raise Exception, "Unknown OS: #{host_os.inspect}"
    end
  )
end
