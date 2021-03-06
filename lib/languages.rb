require 'yaml'

class Languages
	def self.import
		available_languages = YAML.load_file('lib/languages.yml')
		available_languages.each do |available_language|
			self.store_language(available_language[0])
			puts "Stored #{available_language[0]}"
		end
	end

	def self.store_language(language_title)
		category = Category.find_by_name(language_title) || Category.create(:name => language_title, :github_short => language_title)
	end
end