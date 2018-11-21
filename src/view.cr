require "crustache"

def view(view : String, layout : String, title : String, model : Hash | Nil)
  if !File.file? layout
    return "404 - Not found"
  else
    template = Crustache.parse File.read(layout)

    if !File.file? view
      return Crustache.render template, {
        "title" => "404 - Not found", 
        "body" => "404 - Not found"
      }
    end

    body = Crustache.parse File.read(view)

    return Crustache.render template, {
      "title" => title,
      "body" => Crustache.render(body, model)
    }
  end
end