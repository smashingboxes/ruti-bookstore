Feature: Book index store page
  Scenario: Book pagination
    Given there are 100 books in the database
    And I am logged into the site
    When I visit the site root path
    Then I see a list of books in the database
    And the books are ordered by published date
    And the list of 100 books are paginated in pages of 25 books per page

  Scenario: Book searching
    Given there are 100 books in the database
    And I am logged into the site
    When I visit the site root path
    And I enter a book's title into the book search field
    Then I am shown a list of books with that title