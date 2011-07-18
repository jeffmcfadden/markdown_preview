Rails.application.routes.draw do |map|
  post "markdown_preview/convert" => "markdown_preview#convert"
end
