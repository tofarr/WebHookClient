Rails.application.routes.draw do
  mount WebHookClient::Engine => "/web_hook_client"
  match "dummy", to: "dummy#index", via: :all
end
