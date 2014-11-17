mail-unf
========

A monkey patch that converts text based on Unicode Normalization Forms (UNF).
Unicode has 4 types for UNF; NFD, NFC, NFKD, NFKC.
Note that this patch is fixed to convert to NFC at this time.

Overview
--------

Feature
-------

Requirements
------------

### Ruby ###

* 1.9.2

### Gems ###

* `mail` 2.2.6 or higher, but lower than or equal to 2.5.4
* `unf` 0.1.0 or higher

### ActionMailer (Optional) ###

* 3.2 or higher


Getting Start
-------------

### Install as a gem ###

Add to your Gemfile:

    gem 'mail-unf'

or run this command:

    gem install mail-unf

License
-------

`mail-unf` is distributed under the MIT license.
