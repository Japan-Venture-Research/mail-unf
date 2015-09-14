mail-unf
========

A monkey patch that normalizes text based on Unicode Normalization Forms (UNF).
Unicode has 4 types for UNF; NFD, NFC, NFKD, NFKC.
Note that this patch is fixed to convert to NFC at this time.

Usage
-----

### Install as a gem ###

Add to your Gemfile:

    gem 'mail-unf'

or run this command:

    gem install mail-unf


### Using with mail-iso-2022-jp gem ###

The requiring order in Gemfile is very important.
`mail-unf` gem should be required after `mail-iso-2022-jp` gem.

    gem 'mail-iso-2022-jp'
    gem 'mail-unf'


Requirements
------------

### Ruby ###

* 1.9.3

### Gems ###

* `mail` 2.5.4 or higher, but lower than or equal to 2.6.3
* `unf` 0.1.0 or higher


License
-------

`mail-unf` is distributed under the MIT license.
