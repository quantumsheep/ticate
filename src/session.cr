require "sqlite3"

class Session
  def initialize(db)
    @db = db
  end

  def get(id : String)
    puts db.scalar "SELECT data FROM sessions WHERE id=#{id}"
  end

  def set(id : String, data : Hash | Nil)
    db.exec "INSERT OR IGNORE INTO my_table (id, data) VALUES ('#{id}', '#{data}') UPDATE sessions SET data=34 WHERE name='Karen'"
  end

  def self.generate_id()
    Random::Secure.urlsafe_base64(256)
  end
end