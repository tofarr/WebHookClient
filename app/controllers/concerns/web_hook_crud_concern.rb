module WebHookCrudConcern
  extend ActiveSupport::Concern

  include WebHookConcern

  included do
    add_web_hook(:create)
    add_web_hook(:update)
    add_web_hook(:destroy)
  end

end
