require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    # 全てのarticleのデータが@articlesに入れること
    it "assigns all articles to @articles" do
      articles_array = Array.new
      3.times { articles_array << FactoryGirl.create(:article) }
      get :index
      expect(assigns(:articles)).to match_array(articles_array)
    end

    # admin/articles#indexテンプレートをrenderすること
    it "renders the admin/index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    # @articleに要求されたarticleをassignすること
    it "assigns the requested article to @article" do
      article = FactoryGirl.create(:article)
      get :show, id: article.id
      expect(assigns(:article)).to eq article
    end

    # admin/articles#showテンプレートを表示すること
    it "renders the admin/show template" do
      article = FactoryGirl.create(:article)
      get :show, id: article.id
      expect(response).to render_template :show
    end
  end
end
