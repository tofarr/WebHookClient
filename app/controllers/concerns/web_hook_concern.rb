module WebHookConcern
  extend ActiveSupport::Concern

  def self.add_web_hook(action_name, model_name=:model, run_later=true)
    after_action Proc.new {|n| run_hooks(action_name, model_name, run_later) }, only: [action_name]
  end

  private

    def self.run_hooks(action_name, model_name, run_later)
      model = self.read_attribute(model_name)
      return if model.is_a?(ActiveRecord::Base) && webhook.previous_changes.blank?
      if run_later
        WebHook.run_all_later(model.class.name, action_name, model)
      else
        WebHook.run_all(model.class.name, action_name, model)
      end
    end
end
