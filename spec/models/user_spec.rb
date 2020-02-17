require 'rails_helper'

describe User do
  describe '#create' do

# 各データが空だと登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a family_name" do
        user = build(:user, family_name: "")
        user.valid?
        expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a kana_family_name" do
        user = build(:user, kana_family_name: "")
        user.valid?
        expect(user.errors[:kana_family_name]).to include("can't be blank")
    end

    it "is invalid without a kana_first_name" do
        user = build(:user, kana_first_name: "")
        user.valid?
        expect(user.errors[:kana_first_name]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
        user = build(:user, birthday: "")
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid without a telnumber" do
        user = build(:user, telnumber: "")
        user.valid?
        expect(user.errors[:telnumber]).to include("can't be blank")
    end

# 全てのデータがあれば、登録できること
    it "is valid with all" do
        user = build(:user)
        expect(user).to be_valid
    end

# パスワードが7字以上であれば、登録できること
    it "is valid with a password that has more than 7 characters " do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        user.valid?
        expect(user).to be_valid
    end

# パスワードが6字以下では登録できないこと
    it "is invalid with a password that has less than 6 characters " do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end


  end
end