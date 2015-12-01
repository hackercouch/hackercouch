---
title: How to add your couch
layout: page
---

1. Fork [this repo][fork]
2. Switch to a different branch (not `gh-pages`).
2. Create a file in the `_couches` directory called NICK.md. Use the basic template provided below
3. Commit
4. File a Pull Request

### Template

```md
---
name: Your Name #optional
city: your_city #required
country: ISO-3166 2 character country code #required
region: region in your city #optional
email: email_address #required
github: github_username
twitter: twitter_username
website: https://your-website.com
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

### Build

Travis build runs html-proofer which checks the validity of all http links,
so they need to be working fine. The country code must also be correct as per
the [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) list.
It should be a 2 character country code.

#### Merge

Once you have filed a Pull-Request, I will merge your commit and your
listing will be live on hackercouch.com.

[fork]: https://github.com/captn3m0/hackercouch "Click the Fork button"
