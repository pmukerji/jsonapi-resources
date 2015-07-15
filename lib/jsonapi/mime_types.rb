module JSONAPI
  MEDIA_TYPE = 'application/vnd.api+json'
end

Mime::Type.register JSONAPI::MEDIA_TYPE, :api_json

ActionDispatch::ParamsParser::DEFAULT_PARSERS[
  Mime::Type.lookup(JSONAPI::MEDIA_TYPE)
] = lambda do |body|
  JSON.parse(body)
end
