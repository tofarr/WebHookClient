require "net/http"

class WebHook < ApplicationRecord

  validates :url, presence: true
  validates :method, presence: true, inclusion: { in: %w(get post put patch delete) }
  validates :model_type, presence: true
  validates :event_type, presence: true, inclusion: { in: %w(create update destroy) }
  validates :auth_type, presence: true, inclusion: { in: %w(none basic jwt) }


  def run(model)
    Rails.logger.info "Executing WebHook #{id}"
    uri = create_uri(model)
    http_request = create_http_request(uri, model)
    http = create_http(uri)
    http_response = http.request(http_request)
    Rails.logger.info "Webhook #{id} ran with result #{http_response.code}"
    http_response
  end

  private

    def create_uri(model)
      uri = URI(url)
      if method == "get" || method == "delete"
        uri.query = model.to_query
      end
      uri
    end

    def create_http_request(uri, model)
      http_request = case method
        when "get"
          Net::HTTP::Get.new(uri)
        when "post"
          Net::HTTP::Post.new(uri)
        when "put"
          Net::HTTP::Put.new(uri)
        when "patch"
          Net::HTTP::Patch.new(uri)
        when "delete"
          Net::HTTP::Delete.new(uri)
      end
      if http_request.request_body_permitted?
        http_request.content_type = "application/json"
        http_request.body = model.to_json
      end
      http_request
    end

    def create_http(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE #TODO: Change for production
      end
      http
    end
end
