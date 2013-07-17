# zap_memory
#
# Clears all (inactive) RAM on local machine.
def zap_memory
  raise NotImplementedError unless os == :macosx

  `purge`
end
