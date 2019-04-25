WebHookClient::Engine.load_seed
WebHook.create(url: "http://localhost:3000/web_hook_client/dummy", method: "post", model_type: 'WebHook', event_type: "create")
WebHook.create(url: "http://localhost:3000/web_hook_client/dummy", method: "put", model_type: 'WebHook', event_type: "update")
WebHook.create(url: "http://localhost:3000/web_hook_client/dummy", method: "delete", model_type: 'WebHook', event_type: "destroy")
