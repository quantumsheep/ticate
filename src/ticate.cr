require "http/server"
require "sqlite3"
require "./view"
require "./session.cr"

PORT = 3000
SESSION_COOKIE = "ticate__s";

DB.open "sqlite3://./ticate.db" do |db|
  server = HTTP::Server.new do |context|
    # if !context.request.cookies[SESSION_COOKIE].value
    #   cookie = HTTP::Cookie.new SESSION_COOKIE, Session.generate_id() 
    #   context.request.cookies[SESSION_COOKIE] = cookie
    #   context.response.cookies = cookie
    # end

    if context.request.path === "/"
      db.query "SELECT id, title, created FROM tickets ORDER BY created" do |rs|
        tickets = Array(Hash(String, Int32 | String | Nil)).new

        i = 0
        rs.each do
          tickets.push({
            "id" => rs.read(Int32),
            "title" => rs.read(String),
            "created" => rs.read(String),
          })
        end

        context.response.print view("views/index.html", "views/layout.html", "Ticate", {
          "tickets" => tickets
        })
      end
    else
      context.response.print "404 - Not found"
    end
  end

  puts "Listening on http://127.0.0.1:#{PORT}"
  server.listen PORT
end