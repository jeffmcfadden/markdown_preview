Rails.application.routes.draw do
  scope :module => "markdown_preview" do
    post "markdown_preview/convert" => "markdown_preview#convert"
  end
end
