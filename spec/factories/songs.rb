FactoryBot.define do
	factory :song do
		title { Faker::Hipster.words(2) }
	end
end
