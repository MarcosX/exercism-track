class Acronym
  def self.abbreviate(title)
    title.split(/\s|-/).reject(&:empty?).inject("") do |acc, word|
      "#{acc}#{word[0].upcase}"
    end
  end
end
