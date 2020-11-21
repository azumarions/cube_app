require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { create(:user) }
  let(:article) { user.articles.build(title: 'test', content: 'test article', user_id: user.id) }

  describe 'title' do
    it 'should be valid' do
      expect(article).to be_valid
    end

    it 'should not be valid' do
      article.update_attributes(title: '', content: 'test', user_id: user.id)
      expect(article).to be_invalid
    end

    it 'should not be at most 100' do
      article.title = "a" * 100
      expect(article).to be_valid
      article.title = "a" * 101
      expect(article).to be_invalid
    end
  end

  describe 'content' do
    it 'should not be valid' do
      article.update_attributes(title: 'test', content: '', user_id: user.id)
      expect(article).to be_invalid
    end

    it 'should not be at most 2000' do
      article.content = "a" * 2000
      expect(article).to be_valid
      article.content = "a" * 2001
      expect(article).to be_invalid
    end
  end

  describe 'user_id' do
    it 'should not be present' do
      article.user_id = nil
      expect(article).to be_invalid
    end
  end
end
