require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
    @admin = FactoryBot.build(:admin)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      @admin.name = ''
      @admin.valid?
      expect(@admin.errors.full_messages).to include("Name can't be blank")
    end

    it 'employee_idが空では登録できない' do
      @admin.employee_id = ''
      @admin.valid?
      expect(@admin.errors.full_messages).to include("Employee can't be blank")
    end

    it 'employee_idが数字でなければ登録できない' do
      @admin.employee_id = '123qwe'
      @admin.valid?
      expect(@admin.errors.full_messages).to include("Employee is not a number")
    end

    it 'passwordが空では登録できない' do
      @admin.password = ''
      @admin.valid?
      expect(@admin.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @admin.password = '00aaa'
      @admin.password_confirmation = @admin.password
      @admin.valid?
      expect(@admin.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @admin.password_confirmation = '000aaa'
      @admin.valid?
      expect(@admin.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
