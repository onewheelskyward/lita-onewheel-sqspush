# lita-onewheel-sqspush

[![Build Status](https://travis-ci.org/onewheelskyward/lita-onewheel-sqspush.png?branch=main)](https://travis-ci.org/onewheelskyward/lita-onewheel-sqspush)
[![Coverage Status](https://coveralls.io/repos/onewheelskyward/lita-onewheel-sqspush/badge.png)](https://coveralls.io/r/onewheelskyward/lita-onewheel-sqspush)

Grabs the real url from apple news posts because I don't like or use apple news.  Hat tip to @samgrover for the idea & initial implementation.

## Installation

Add lita-onewheel-sqspush to your Lita instance's Gemfile:

``` ruby
gem "lita-onewheel-sqspush"
```

## Configuration

n/a

## Usage

anytime apple.news comes up, it grabs the content and finds the reference url in redirectToUrlAfterTimeout.
