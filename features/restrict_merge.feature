Feature: Only display merge option to admin user
	In order to assure blog contributors that others cannot take credit for their work
	As a blog administrator
	I want to restrict the merge option to admins only

	Scenario: Attempt to merge articles when not an admin
		Given I am not logged in as admin
		And I am on the edit page
		Then I should not see the "Merge Articles" heading
		And I should not see the "Article ID" field
		And I should not see the "Merge" button

	Scenario: Attempt to merge articles as an admin
		Given I am logged in as admin
		And I am on the edit page
		Then I should see the "Merge Articles" heading
		And I should see the "Article ID" field
		And the "Article ID" field should have "name" set to "merge_with"
		And I should see the "Merge" button