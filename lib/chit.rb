require 'pg'

class Chit

attr_reader :content, :handle, :timestamp

  def initialize(content:, handle:)
    @content = content
    @handle = handle
    @timestamp = Time.new.strftime "%H:%M:%S %d-%m-%Y"
  end


  def self.all
    # research self
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM chits')
    result.map do |chit|
      Chit.new(content: chit['content'], handle: chit['handle'])
    end
  end

  def self.post(handle:, content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec_params("INSERT INTO chits (handle, content) VALUES ($1, $2) RETURNING handle, content;", [handle, content])
      #is the above safe? it uses interpolation but timestamp isn't accessible to the web user...
      #I do not understand why this isn't sending timestamp to the timestamp column . Instead, when I calls timestamp, it seems to initialize time
      # then and there, so it's not saving the time a post was made
      #I've tried generating the timestamp in the table, as well as generating it here and inserting it into the table, but whenever I've got either
      #of those to work it's broken rackup, even though it works in irb
      Chit.new(content: result[0]['content'], handle: result[0]['handle'])
  end
end
