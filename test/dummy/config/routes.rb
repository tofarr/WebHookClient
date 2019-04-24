Rails.application.routes.draw do
  mount WebHookClient::Engine => "/web_hook_client"
end
