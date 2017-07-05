# Contributing

So you want to contribute to Skylark development!  Thanks in advance
for anything that you can provide for the project.  We (well, just me
at the moment) welcome feedback, bug reports, and---perhaps most
importantly---pull requests.

## Hacking

To contribute, you should have a relatively new version of Ruby.  (The
gemspec greedily requires Ruby 2.3 or higher because I haven't had the
opportunity to test on anything lower.)

Make sure you have installed `bundler`,

```console
$ gem install bundler
```

and make sure you have all of the project dependencies installed,

```console
$ bundle install
```

Use a branching scheme like this:

* `<description-of-feature>` for feature additions

* `fix-<#>-<description-of-change>` for bug/performance fixes

**Fork** to your own personal or organization account (unless you
already are an authorized contributor on this project) and **make a
branch** for your work.  Make multiple branches if your work is
divergent or has multiple different channels.  Feel free to merge
between these branches in a way that makes sense.  When ready,
**submit a pull request** with the base set to `master` on
`rye/skylark`.  We will dispatch it to a different base if necessary.


## Filing Issues/Pull Requests

In general,

* Please use English, and please be as communicative as possible.

* Please make sure you have notifications turned on for GitHub on the
  specific Issue or PR you submit---we might try to follow-up quickly.
  In general, we'll accept anything that matches the coding style and
  produces a valuable on-target movement towards the project's
  purpose.
