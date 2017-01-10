# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
app = App.create(url: 'url',
                 pub_id: 1,
                 client_id: 'xxx',
                 client_secret: 'xxx')

notification = Notification.create(title: 'test title', body: {"text": "text message"}, receivers: ["zhiwen.liu"])

app.notifications << notification
