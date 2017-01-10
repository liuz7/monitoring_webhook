class NotificationJob < ApplicationJob
  queue_as :notification
  self.logger = Sidekiq::Logging.logger

  def perform(notification_json)
    notification = JSON.parse(notification_json)
    app = App.find(notification['app_id'])
    headers = gen_headers(app.client_id, app.client_secret, URI(app.url).path, 'PUT')
    data = {
        'fromName': notification['title'],
        'fromUid': app.pub_id,
        'receivers': notification['receivers'],
        'messageType': notification['messageType'],
        'body': notification['body']
    }
    puts data
    response = HTTParty.put(app.url, headers: headers, body: data.to_json)
    if (response.code == 200)
      logger.info "Notification #{notification['body']} sent to #{notification['receivers']} for app #{app.id}"
    else
      logger.info "Notification #{notification['body']} failure"
      logger.info response.body
    end
  end

  private

  def gen_headers(client_id, client_secret, url_path, http_method)
    timestamp = Time.now.gmtime.strftime('%a, %d %b %Y %H:%M:%S GMT')
    string_to_sign = "%s %s\n%s" % [http_method, url_path, timestamp]
    auth = Base64.encode64 OpenSSL::HMAC.digest('sha1', client_secret, string_to_sign)
    auth_string = 'MWS %s:%s' % [client_id, auth]
    return {
        'Date': timestamp,
        'Authorization': auth_string,
        'Content-Type': 'application/json;charset=utf-8'
    }
  end
end
