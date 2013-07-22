# process_kill
#
# Selects a process at random and kills it.
def random_process
  raise NotImplementedError unless os == :macosx

  `ps -e`.scan(/\n[\s|\d]*\d*\s/).collect do |pid|
    pid.gsub("\\n", "").strip
  end.sample
end

def process_kill
  raise NotImplementedError unless os == :macosx

  `kill #{random_process}`
end
