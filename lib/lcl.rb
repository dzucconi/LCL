def reload!
  Dir["#{File.dirname(__FILE__)}/lcl/**/*.rb"].each { |f| load(f) }
end

reload!
