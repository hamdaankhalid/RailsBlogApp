# frozen_string_literal: true

class RandomQuestionLanguageGen
  def initialize
    @languages = [
      'C',
      'C++',
      'C#',
      'F#',
      'Java',
      'Scala',
      'Kotlin',
      'Go',
      'Rust',
      'Python',
      'Ruby',
      'Haskell',
      'OCaml',
      'Javascript',
      'Typescript'
    ]
    @aoc_tpl_link = "https://adventofcode.com/%{year}/day/%{day}"
    @proj_euler_tpl_link = "https://projecteuler.net/problem=%{problem_number}"
  end

  def language
    @languages[rand[0..@languages.length - 1]]
  end

  def question_link
    choice = rand[0..1] == 1 ? @aoc_tpl_link : @proj_euler_tpl_link
    case choice
    when @aoc_tpl_link
      format(@aoc_tpl_link, { year: rand[2015..2022], day: rand[1..25] })
    when @proj_euler_tpl_link
      format(@proj_euler_tpl_link, { problem_number: rand[1..829] })
    end
  end
end
