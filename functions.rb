require "rbconfig"

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
      raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
    end
  )
end

# narcolepsis HOST
#
# Unexpected initiation of "sleep" mode in a given organic or inorganic HOST (see also Refusal).
def narcolepsis(host=:self)
  raise ArgumentError unless host == :self

  case os
  when :macosx  then `osascript -e 'tell application "System Events" to sleep'`
  when :linux   then `pmi action suspend`
  when :windows then `rundll32.exe PowrProf.dll,SetSuspendState`
  else
    raise ArgumentError
  end
end
