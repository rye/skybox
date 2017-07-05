# skybox

Skybox is a simple CLI-based LDAP scraper whose intended purpose is to
dump an entire LDAP search base out into a bunch of JSON files based
on the LDIF data dumped by the LDAP server.  More precisely, every
object in the database gets its own JSON file.

## Installation/Setup

Just clone the repository, cd into it, and run the following commands:

```console
$ bundle install
$ bundle exec script/scrape config/<your configuration file>.yml
```
