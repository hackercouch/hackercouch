---
title: How to manage your couch
layout: page
---

### Add your couch

1. Fork [this repo][fork]
2. Create a file in the `_couches` directory called NICKNAME.md. Use the basic template provided below
3. Commit
4. File a Pull Request

### Marking unavailability

When you are unavailable, just delete your NICK.md and send a new Pull
Request. Later, you can `git revert` to make yourself available again.

### Template

```md
---
name: Your Name #optional
city: your_city #required
country: ISO 3166-1 alpha-2 country code (2 characters, uppercase) #required
region: region in your city #optional
email: email_address #required
github: github_username
twitter: twitter_username
website: http://your-website.com
facebook: your_facebook_username
reddit: reddit_handle
couchsurfing: couchsurfing_username
bewelcome: bewelcome_username
trustroots: trustroots_username
warmshowers: warmshowers_user_id
---

Extra info you might want to provide about your couch.
Whether you have internet connectivity, and so on.

**Note**: This accepts markdown
```

Note that only these fields are required:

- country
- city
- email

If you do not provide a `name`, the filename will be used as one.

We pull your avatar from [Gravatar.com](https://gravatar.com/)

### Build

The CI build runs `html-proofer` which checks the validity of all http links,
so they need to be working fine. The country code must also be correct as per
the [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) list.
It should be a 2 character country code.

Once a build passes (and the branch is master), our CI scripts will auto-commit
and push the compiled site to the `gh-pages` branch, publishing the result to `hackercouch.com`
in a few minutes.

#### Merge

Once you have filed a Pull-Request, I will merge your commit and your
listing will be live on hackercouch.com. `master` contains the latest
source for the website, and your pull requests must use `master` as the base.
`gh-pages` is automatically pushed every time a new commit is made on master.

[fork]: https://github.com/hackercouch/hackercouch "Click the Fork button"
