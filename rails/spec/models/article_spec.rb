require "rails_helper"

RSpec.describe Article, type: :model do
  describe "factories" do
    it "has a valid default factory" do
      expect(build(:article)).to be_valid
    end
  end

  describe "database operations" do
    it "increments the count when a record is created" do
      expect { create(:article) }.to change { Article.count }.by(1)
    end
  end

  describe "validations" do
    let(:article) { build(:article, title: title, content: content, status: status, user: user) }
    let(:title) { Faker::Lorem.sentence }
    let(:content) { Faker::Lorem.paragraph }
    let(:status) { :published }
    let(:user) { create(:user) }

    context "when all attributes are valid" do
      it "is valid" do
        expect(article).to be_valid
      end
    end

    context "when title is empty and status is published" do
      let(:title) { "" }

      it "is invalid with an appropriate error message" do
        expect(article).to_not be_valid
        expect(article.errors.full_messages).to include("タイトルを入力してください")
      end
    end

    context "when content is empty and status is published" do
      let(:content) { "" }

      it "is invalid with an appropriate error message" do
        expect(article).to_not be_valid
        expect(article.errors.full_messages).to include("本文を入力してください")
      end
    end

    context "when status is unsaved and a user already has an unsaved article" do
      let(:status) { :unsaved }

      before do
        create(:article, status: :unsaved, user: user)
      end

      it "raises an error" do
        expect { article.valid? }.to raise_error(StandardError)
      end
    end
  end
end
