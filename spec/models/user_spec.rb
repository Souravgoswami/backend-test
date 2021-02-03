require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'creation' do
		before do
			@user = FactoryBot.create(:user)
		end

		it('can be created') do
			expect(@user).to be_valid
		end
	end

	describe 'validations' do
		before do
			@user = FactoryBot.create(:user)
		end

		it 'cannot be created without email' do
			@user.email = nil
			expect(@user).to_not be_valid
		end

		it 'cannot be created without password' do
			@user.password = nil
			expect(@user).to_not be_valid
		end

		it 'can only be created unless password.length >= 6' do
			@user.password = 'abcd'
			@user.password_confirmation = 'abcd'
			expect(@user).to_not be_valid

			@user.password = 'abcdefg'
			@user.password_confirmation = 'abcdefg'
			expect(@user).to be_valid
		end

		it 'cannot be created unless password_confirmation is matched' do
			@user.password = 'abcdefg'
			@user.password_confirmation = 'abcdefg'
			expect(@user).to be_valid

			@user.password = 'abcdef'
			@user.password_confirmation = 'abcdefg'
			expect(@user).to_not be_valid
		end
	end
end
