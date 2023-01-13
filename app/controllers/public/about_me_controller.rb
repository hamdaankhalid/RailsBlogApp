# frozen_string_literal: true

module Public
  class AboutMeController < Public::BaseController
    def index
      my_birthday = Time.new(1999, 1, 13)
      today = Time.now
      @age = today.year - my_birthday.year
      if (my_birthday.month >  today.month or (my_birthday.month >= today.month and my_birthday.day > today.day))
        @age -= 1
      end
    end
  end
end
