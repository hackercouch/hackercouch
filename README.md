# hackercouch [![Build Status](https://travis-ci.org/hackercouch/hackercouch.svg?branch=master)](https://travis-ci.org/hackercouch/hackercouch)

HackerCouch is "Hospitality for Hackers". Here's how it goes:

- Fork this repo
- Add your own markdown file with your nick (perhaps twitter/github handle?) in the `_couches` directory
- You file a Pull Request on [github][gh]
- Make sure the build passes
- Go check [hackercouch.com](https://hackercouch.com) the next time you are travelling.

See [add.md](add.md) for more detailed instructions.

The idea isn't new, it has been [tried before][original] as well. The reason we are trying this again is:

- The idea of a Fork->PR->Merge->Publish flow with almost zero effort
- Filing a pull request is a great filter for hackers
- hackercouch.com was available
- [This comment][comment] by @sirupsen on HN

# Development

- HackerCouch uses [Jekyll](http://jekyllrb.com/) Collections heavily
- Hosted on Github Pages, duh.
- Builds use Travis, and make sure that the site has proper html before its deployed
- `html-proofer` for html linting + link checks

### Quickstart

```bash
. ./_script/setup-env.sh
gem install bundler
bundle install
jekyll serve --watch
```

And open <http://localhost:4000> in your browser.

### Troubleshooting

- If your bundle fails due Nokogiri and you're on OSX, try running this first: `xcode-select --install`

# Credits

- The original hackercouch project: [jancborchardt/hackercouch][original]
- [remy/mit-license](https://github.com/remy/mit-license) for the fork-PR-publish workflow.

### Disclaimer

Our disclaimer policy is [here][disclaimer].

# LICENSE

This uses Jekyll collections and the base Jekyll theme. The very little code here
is licensed under the MIT License. However, everything under the `_couches` directory
is licensed under the CC0 license. If you file a PR to this repo, you agree to having
your "couch information" available under this license.

The minimum required information is your nick, city and country code.

[original]: https://github.com/jancborchardt/hackercouch "The original hackercouch project"
[gh]: https://github.com/hackercouch/hackercouch
[comment]: https://news.ycombinator.com/item?id=1842383 "hackercouch.com, anyone?"
[disclaimer]: disclaimer.md
