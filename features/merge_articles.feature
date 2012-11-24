Feature: Merge articles
	In order to make it less confusing for readers to find information in our blog
	As a blog administrator
	I want to combine two similar articles into one article, preserving the comments from each

	Background:
		Given I am logged in as admin
		And I am on the edit page

	Scenario: Handle invalid merge ID
		Given the text in the "Article ID" field is not a valid article ID
		When I click the "Merge" button
		Then I should see an error message
		And I should not see a merge success message
		And I should still be on the edit page

	Scenario: Merge articles
		Given the text in the "Article ID" field is a valid article ID
		When I click the "Merge" button
		Then I should see a merge success message
		And I should not see an error message
		And I should see the text of the combined article
		And exactly one of the article titles should be listed as the title
		And exactly one of the article authors should be listed as the author
		And the text should include all the text from both articles
		And the comments should include all the comments from both articles