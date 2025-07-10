# Dangerfile

# Warn when there is a big PR
warn("This PR is pretty big. Consider breaking it into smaller pieces.") if git.lines_of_code > 500

# Fail if no PR description
fail("Please add a description to your PR.") if github.pr_body.empty?

# Warn if no changelog was updated
changelog_files = git.modified_files.grep(/changelog/i)
warn("No changelog updates found.") if changelog_files.empty?

# Warn if no tests were modified or added
test_files = git.modified_files.grep(/Tests?\/.*\.swift$/)
warn("This PR doesn't modify any test files.") if test_files.empty?

# Show a message if the PR is targeting `main`
if github.branch_for_base == "main"
  message("You're merging into `main`. Double-check if that's intentional.")
end

# Lint commit messages
git.commits.each do |commit|
  fail("Commit '#{commit.message}' is not properly formatted. Use imperative mood and max 50 chars.") if commit.message.length > 50
end
