# narcolepsis HOST
#
# Unexpected initiation of "sleep" mode in a given organic or inorganic HOST (see also Refusal).
def narcolepsis(host=:self)
  raise NotImplementedError unless host == :self

  case os
  when :macosx  then `osascript -e 'tell application "System Events" to sleep'`
  when :linux   then `pmi action suspend`
  when :windows then `rundll32.exe PowrProf.dll,SetSuspendState`
  else
    raise NotImplementedError
  end
end
