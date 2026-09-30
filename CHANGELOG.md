# Changelog

All notable changes to this project will be documented in this file.

## Release 1.1.0

Fork of benjamin-robertson/acsc_e8_office_hardening.

**Features**

  - `all_macros_disabled` sets `blockcontentexecutionfrominternet` for Excel, Word, Access, PowerPoint and Visio, and `macroruntimescanscope`, as the other two restricting modes do. ACSC Essential Eight Maturity Level 1 lists both.
  - Supports `puppetlabs/registry` 6.x and `puppetlabs/stdlib` 10.x.

## Release 1.0.0

**Features**

  - Added support for Puppet 8, Server 2022 and Windows 11.
  - Added Unit/lint testing to github actions.
  - Removed use of legacy facts.
  - Improved handling of office_macro_run time fact to prevent failures with strict mode.
  - Bumped PDK version to 3.3.0.

## Release 0.2.0

**Features**

  - Republish to Forge. 

**Bugfixes**

**Known Issues**

## Release 0.1.1

**Features**

**Bugfixes**

  - Fixed metadata.json to refer to the correct git repo and issue tracker. 

**Known Issues**

## Release 0.1.0

**Features**

**Bugfixes**

**Known Issues**
