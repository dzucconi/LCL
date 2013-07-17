# process_kill
#
# Selects a process at random and kills it.
def process_kill
  raise NotImplementedError unless os == :macosx

  pids = `ps -e`.scan(/\n[\s|\d]*\d*\s/).collect do |pid|
    pid.gsub("\\n", "").strip
  end

  `kill #{pids.sample}`
end
