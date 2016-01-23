module ActiveRecord
  class Base
    def self.establish_connection(options = {})
      @connection ||= MySQL::Database.new(ENV['MYSQL_HOSTNAME'] || 'localhost', ENV['MYSQL_USERNAME'], ENV['MYSQL_PASSWORD'], 'sample')
    end
  end
end
