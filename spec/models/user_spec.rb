require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00aaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = '000aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'grade_idに「---」が選択されている場合は登録できない' do
      @user.grade_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Grade can't be blank")
    end

    it 'class_num_idに「---」が選択されている場合は登録できない' do
      @user.class_num_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Class num can't be blank")
    end

    it 'number_idに「---」が選択されている場合は登録できない' do
      @user.number_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Number can't be blank")
    end
  end
end
