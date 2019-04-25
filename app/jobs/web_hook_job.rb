require 'net/http'

class WebHookJob < ApplicationJob
  queue_as :default

  def perform(web_hook_id, model)
    webhook = WebHook.find_by_id(web_hook_id)
    return unless webhook #maybe deleted...
    webhook.run(model)
  end

end
