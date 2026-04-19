# HACKING

- HackerCouch uses [Jekyll](http://jekyllrb.com/) Collections heavily
- Hosted on Github Pages, duh.
- Builds use GitHub Actions, and make sure that the site has proper html before its deployed
- `html-proofer` for html linting + link checks
- Every commit triggers a local build on GitHub Actions.
- Every commit merged to `master` triggers a specific action that commits the site back to `gh-pages` branch.
