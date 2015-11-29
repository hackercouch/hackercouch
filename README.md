# hackercouch

HackerCouch is couchsurfing for Hackers. Here's how it goes:

- Fork this repo
- Add your own markdown file with your nick (perhaps twitter/github handle?) in the `_couches` directory
- You file a Pull Request on [github][gh]
- Make sure the build passes
- Go check hackercouch.com the next time you are travelling.

See [add.md](add.md) for more detailed instructions.

The idea isn't new, it has been [tried before][original] as well. The reason I'm trying this again is:

- I love the idea of a Fork->PR->Merge->Publish flow with almost zero effort.
- hackercouch.com was available.

I also made a similar PR-based DNS redirect service called [lightsaber][ls] recently.

[gh]: https://github.com/captn3m0/hackercouch
[ls]: https://github.com/captn3m0/lightsaber

# Development

HackerCouch uses Jekyll Collections, which is a feature I really like.
Hosted on github-pages, duh.
Builds use travis, and make sure that the site has proper html before its deployed

# Credits

- The original hackercouch project: [jancborchardt/hackercouch][original]
- [remy/mit-license](https://github.com/remy/mit-license) for the fork-PR-publish workflow.

# LICENSE

This uses Jekyll collections and the base Jekyll theme. The very little code here
is licensed under the MIT License. However, everything under the `_couches` directory
is licensed under the CC0 license. If you file a PR to this repo, you agree to having
your "couch information" available under this license.

The minimum required information is your nick, city and country code.


[original]: https://github.com/jancborchardt/hackercouch "The original hackercouch project"
