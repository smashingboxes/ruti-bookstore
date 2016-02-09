Given(/^there are 100 books in the database$/) do
  @book = FactoryGirl.create(:book, published_date: Date.today - 2.days, order_count: 2)
  @book1 = FactoryGirl.create(:book, published_date: Date.today, order_count: 1)
  FactoryGirl.create_list(:book, 98)
end

Then(/^I see a list of books in the database$/) do
  expect(Book.all.ids).to include (1...100)
end

Then(/^the books are ordered by published date$/) do
  expect(Book.first).to eq @book1
  expect(Book.last).to eq Book.order(published_date: :desc).last
end

Then(/^the list of 100 books are paginated in pages of 25 books per page$/) do
  expect(page).to have_link("View Book", count: 25)
  find("//*[@class='pagination']//a[text()='2']").click
  expect(page).to have_link("View Book", count: 25)
  find("//*[@class='pagination']//a[text()='3']").click
  expect(page).to have_link("View Book", count: 25)
  find("//*[@class='pagination']//a[text()='4']").click
  expect(page).to have_link("View Book", count: 25)
end

When(/^I enter a book's title into the book search field$/) do
  fill_in 'Title contains', with: Book.find(1).title
end

Then(/^I am shown a list of books with that title$/) do
  expect(page).to have_content(Book.find(1).title)
end

Given(/^some books have been ordered$/) do
  @books = Book.order("published_date DESC")
end

When(/^I sort by "([^"]*)"$/) do |sort|
  click_on sort
end

Then(/^the books are re\-sorted based on the amount of times they are purchased$/) do
  Book.order("order_count DESC")
  expect(Book.first).to eq @book
  expect(Book.last).to eq Book.order(order_count: :desc).last
end
