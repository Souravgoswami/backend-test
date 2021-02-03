FactoryBot.define do
	factory :user, class: 'User' do
		email { 'user@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
	end

	factory :user2, class: 'User' do
		email { 'otheruser@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
	end
end
