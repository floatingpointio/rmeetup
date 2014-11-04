rMeetup
=======
[![Gem Version](https://badge.fury.io/rb/rMeetup.svg)](http://badge.fury.io/rb/rMeetup)
[![Build Status](https://travis-ci.org/neektza/rmeetup.svg?branch=master)](https://travis-ci.org/neektza/rmeetup)
[![Code Climate](https://codeclimate.com/github/neektza/rmeetup.png)](https://codeclimate.com/github/neektza/rmeetup)
[![Coverage Status](https://coveralls.io/repos/neektza/rmeetup/badge.png?branch=master)](https://coveralls.io/r/neektza/rmeetup?branch=master)
[![Inline docs](http://inch-ci.org/github/neektza/rmeetup.svg?branch=master)](http://inch-ci.org/github/neektza/rmeetup)

A Ruby wrapper for the Meetup REST API v3

New API code Sample
===================

Initializing the client
-----------------------

```ruby
client = RMeetup::Client.new(api_key: '...')
```

Working with events
-------------------
```ruby
# Find one
client.event(id: '...')

# Find many
client.events(group_id: '...')
client.events(member_id: '...')
client.events(venue_id: '...')

# When authenticated ...
event = client.my.events(attending: true).first

# RSVPing to an event
event.rsvp(:no)
event.rsvp(:yes)

# If admin
event.members(attending: true)
event.members(attending: false)
```

Working with groups
-------------------
```ruby
# Find one
client.group(id: '...')
client.group(urlname: '...')

# Find many
client.groups(ids: '...')
client.groups(member_id: '...')
client.groups(organizer_id: '...')
client.groups(topic: '...')

# Group information
group = client.group(id: '...')
group.members # API eqiv => profiles or members
group.topics
group.meetups(:past)
group.meetups(:upcoming)

# When authenticated ...
group = client.my.groups.first

# Leaving/joining a group
group.join
group.leave

# Scheduling a meetup
group.meetups.schedule(title: '...', description: '...', at: Date.tomorrow)
```

Working with members
--------------------

```ruby
client.member(id: '...')
```

Installation
============

... via Rubygems/Bundler.

Credits
-------
* [Jared Pace](https://github.com/jdpace/rmeetup) - built initial iteration
* [Jason Berlinsky](https://github.com/Jberlinsky/rmeetup) - forked, expanded, documented for api v1.0
* [Tommy Chan](https://github.com/tommytcchan/rmeetup) - added venues, updated to api v2.0
* [Tanner Mares](https://github.com/tannermares/rmeetup) - check for type in base_url, fix event time and venue, also updated to api v2.0
* [Joshua Calloway](https://github.com/joshuacalloway/rmeetup) - added post functionality and event comment creation
* [Zishan Ahmad](https://github.com/zishan/rmeetup) - consolidated changes, updated docs
* [Nikica Jokić](https://github.com/neektza/rmeetup) - thread-safe client refactoring, setup for TravisCI, CodeClimate, Coveralls...
