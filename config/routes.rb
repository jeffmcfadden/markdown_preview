Rails.application.routes.draw do
  post "markdown_preview/convert" => "markdown_preview#convert"
end
