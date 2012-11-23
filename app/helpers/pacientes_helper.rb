module PacientesHelper
def search_field_tag(nombre, value = nil, options = {})
  text_field_tag(nombre, value, options.stringify_keys.update("type" => "search"))
end


end
