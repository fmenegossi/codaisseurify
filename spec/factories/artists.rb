FactoryBot.define do
	factory :artist do
		name  { Faker::RockBand.name }
		style { Faker::Hipster.word }
	end
end
