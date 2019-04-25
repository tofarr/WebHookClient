module WebHookHelper

  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    def run_hooks(action_name, model_name, run_later)
      model = instance_variable_get("@#{model_name}")
      if run_later
        WebHook.run_all_later(model.class.name, action_name, model)
      else
        WebHook.run_all(model.class.name, action_name, model)
      end
    end
  end

  module ClassMethods
    def add_web_hook(action_name, model_name=:model, run_later=true)
      after_action Proc.new {|n|
        run_hooks(action_name, model_name, run_later)
      }, only: [action_name]
    end
  end

end
