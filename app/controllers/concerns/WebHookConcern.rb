module WebHookConcern
  extend ActiveSupport::Concern

  included do

    after_action :run_after_create_hooks, only: [:create]
    after_action :run_after_update_hooks, only: [:update]
    after_action :run_after_delete_hooks, only: [:destroy]

  end

  def current_model
    @model
  end

  def run_after_create_hooks
    run_hooks(:create, @model) if @model&.changed
  end

  def run_after_update_hooks
    run_hooks(:update, @model) if @model&.changed
  end

  def run_after_destroy_hooks
    run_hooks(:destroy, @model) if @model&.changed
  end

  def run_hooks(model, event_type)
    WebHook.where(model_type: model.class.name, event_type: model.class.name).each do |webhook|
      WebHookJob.perform_later(webhook.id, model.as_json)
    end
  end
end
