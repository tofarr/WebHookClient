WebHookClient::Engine.load_seed
WebHook.create(url: "http://localhost:3000/dummy", method: "post", model_type: 'Doohickey', event_type: "create")
WebHook.create(url: "http://localhost:3000/dummy", method: "put", model_type: 'Doohickey', event_type: "update")
WebHook.create(url: "http://localhost:3000/dummy", method: "delete", model_type: 'Doohickey', event_type: "destroy")
WebHook.create(url: "http://localhost:3000/dummy", method: "post", model_type: 'Doohickey', event_type: "show")
