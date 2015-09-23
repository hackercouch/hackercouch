# hackercouch

HackerCouch is couchsurfing for Hackers. Here's how it goes:

- Fork this repo
- Add your own markdown file with your nick (perhaps twitter/github handle?) in the `_couches` directory
- You file a Pull Request on [github][gh]
- Make sure the build passes
- Go check hackercouch.com the next time you are travelling.

The idea isn't new, it has been tried before as well. The reason I'm trying this again is:

- I love the idea of a Fork->PR->Merge->Publish flow with almost zero effort.
- hackercouch.com was available.

I also made a similar PR-based DNS redirect service called [lightsaber][ls] recently.

[gh]: https://github.com/captn3m0/hackercouch
[ls]: https://github.com/captn3m0/lightsaber

# Development

HackerCouch uses Jekyll Collections, which is a feature I really like.
Hosted on github-pages, duh.
Builds will use travis, as soon as I get time.

# LICENSE

This uses Jekyll collections and the base Jekyll theme. The very little code here
is licensed under the MIT License. However, everything under the `_couches` directory
is licensed under the CC0 license. If you file a PR to this repo, you agree to having
your "couch information" available under this license.