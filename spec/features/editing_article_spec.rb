require "rails_helper"

RSpec.feature "Editing an articles" do

  before do 
    @article = Article.create(title: "Title One", body: "Body of article one")
  end
  
  scenario "A user updates an article" do
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: "Update Title"
    fill_in "Body", with: "Update Body of Article"
    click_button "Update Article"
    
    expect(page).to have_content("Article has been update")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "A user fails to updates an article" do
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: "Update Body of Article"
    click_button "Update Article"
    
    expect(page).to have_content("Article has not been update")
    expect(page.current_path).to eq(article_path(@article))
  end

end