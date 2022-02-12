# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  AdminUser.create!(email: "khalid.hamdaan@gmail.com", password: "adminpassword",
                    password_confirmation: ENV["ADMIN_PASSWORD"])
end
Article.create!(
  title: "How to choose between opinionated vs un-opinionated frameworks as a beginner!",
  body: "One of the worst things about starting your journey as a software engineer is not even knowing what you don't know. We all start with the absolute fear of choosing the \"best language\", and eventually graduate to \"choosing the best framework\". Although eventually they all equal out, I do believe the latter question has some weight to it.
    The right answer is almost always found in \"what are you the most productive in\" and \"what is the best tool for the job\". However, when you're a noob it's slightly more complicated. I started my journey with Django, I knew it was used by big tech companies, and Python was my go to language back then.
    
    If you have used Django before you would know that Django is what is considered a \"batteries-included\" framework. It has tons of functionalities built in, and you can take an idea and just code away with it. This sounds great, but for me personally this sucked. I hated the fact that I had gone from learning about SOLID to building web applications in a week with so many layers of abstraction aka magic in between. The imposter syndrome kicked in and I knew it was time to level up...or level down in a sense.

    I knew I had skipped a lot of steps between barebones python CLI and Django, a stride too big for me to comprehend. So I switched to flask, flask is a lightweight framework. If I wanted to do something I either wrote it in scratch or I used an external library I had to configure into my application. This was great because now I had the ability to understand almost every file, and every line of codebase in my application. Eventually I graduated from making entire applications in 1 single \"app.py\" file to writing more maintainable code. I realized that there was a pattern, certain directory structures, and certain patterns were needed as my application codebase grew. I had to deal with and figure out circular dependencies when the issue came up, ORM's had to be picked and configured, and directory structures had to adapt. I eventually realized what was happening, my flask monolith looked pretty close to what Django had looked like. This is when I decided to go back to Django, and suddenly it made a whole lot more sense. After having an understanding of doing something from scratch I appreciated the cli tools that removed the burden of repeated tasks that I had to do with flask.

    Another really cool lesson from this was that I understood the point and value of design patterns, and how they add to code extensibility. Had I never been given the freedom that un-opinionated frameworks like Express.js, Flask, or Sinatra give, I would have never seen the value of opinions and how they help build codebases that will make sense for a long time.

    So my advice for anyone starting out would be to choose the un-opinionated framework in the language of your choice, set to build out something big and long term so that it is guaranteed that you will make design mistakes and see code flexibility decline over time. Then when you feel that you are doing repeated tasks to configure things, learn the more opinionated framework. It is bound to make more sense.",
  status: "public",
)
