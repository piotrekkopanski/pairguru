
### Task 4 - brackets validation
Our moderators are adding parentheses and brackets to the titles.

For example `The Fellowship of the Ring [Lord of The Rings {Peter Jackson}] (2012)`.

This is ok, but we need to make sure that all brackets are closed and not empty. They can be nested as in the example above.

Uncomment tests in `spec/validators/title_brackets_validator_spec.rb` and add validations for movie title that match all the criteria.
With all those tests passing you will know that solution is correct.

Hint: It can't be solved via regular expressions.

### Task 5 - comments
Our users want to comment on movies. Let's add feature that allows them to do that.

We should have new comment form under the movie description and all the comments listed below that.

Additionally - one user should be allowed to leave only one comment to the movie. He can create another only if he deletes previous one.

### Task 6 - sql query (dependent on 5)
We want to reward our users for commenting movies. The idea is to create page with top commenters this week.

It should have 10 users that have the most comments in last week (from 7 days ago to now).

This page will be very popular. We don't want to spam database with many queries in one pageview.

Hint: It can be solved by using ActiveRecord.
