#The monitoring web hook provide the unified way for apps to connect to Daxiang api to send messages

##User manual
###Developement, Run, Deployment
1. System Dependencies
- Ruby2.x, RVM or Rbenv, bundler, Capistrano.

    How to install the project dependencies
        Change directory to project root
        bundler install

    How to deploy in production env
        Edit the target server in `monitoring_webhook/config/deploy/production.rb`
        cap production deploy

    How to create app
        POST /apps/
        {"url": "url",
                         "pub_id": 1,
                         "xxx_id": "xxx",
                         "xxx_secret": "xxx"}
     
    How to create notification
        POST /apps/:app_pub_id/notifications
        {"title": "test title", "body": {"text": "text message"}, "receivers": ["zhiwen.liu"], "messageType": "text"}                
