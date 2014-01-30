# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rMeetup}
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Berlinsky"]
  s.date = %q{2011-01-21}
  s.description = %q{A simple Ruby gem, providing access to the Meetup API}
  s.email = %q{jason@jasonberlinsky.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/rmeetup.rb", "lib/rmeetup/collection.rb", "lib/rmeetup/fetcher.rb", "lib/rmeetup/fetcher/base.rb", "lib/rmeetup/fetcher/cities.rb", "lib/rmeetup/fetcher/comments.rb", "lib/rmeetup/fetcher/events.rb", "lib/rmeetup/fetcher/groups.rb", "lib/rmeetup/fetcher/members.rb", "lib/rmeetup/fetcher/photos.rb", "lib/rmeetup/fetcher/rsvps.rb", "lib/rmeetup/fetcher/topics.rb", "lib/rmeetup/type.rb", "lib/rmeetup/type/city.rb", "lib/rmeetup/type/comment.rb", "lib/rmeetup/type/event.rb", "lib/rmeetup/type/group.rb", "lib/rmeetup/type/member.rb", "lib/rmeetup/type/photo.rb", "lib/rmeetup/type/rsvp.rb", "lib/rmeetup/type/topic.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "lib/rmeetup.rb", "lib/rmeetup/collection.rb", "lib/rmeetup/fetcher.rb", "lib/rmeetup/fetcher/base.rb", "lib/rmeetup/fetcher/cities.rb", "lib/rmeetup/fetcher/comments.rb", "lib/rmeetup/fetcher/events.rb", "lib/rmeetup/fetcher/groups.rb", "lib/rmeetup/fetcher/members.rb", "lib/rmeetup/fetcher/photos.rb", "lib/rmeetup/fetcher/rsvps.rb", "lib/rmeetup/fetcher/topics.rb", "lib/rmeetup/type.rb", "lib/rmeetup/type/city.rb", "lib/rmeetup/type/comment.rb", "lib/rmeetup/type/event.rb", "lib/rmeetup/type/group.rb", "lib/rmeetup/type/member.rb", "lib/rmeetup/type/photo.rb", "lib/rmeetup/type/rsvp.rb", "lib/rmeetup/type/topic.rb", "spec/client_spec.rb", "spec/fetcher_spec.rb", "spec/fetchers/base_spec.rb", "spec/fetchers/cities_spec.rb", "spec/fetchers/comments_spec.rb", "spec/fetchers/events_spec.rb", "spec/fetchers/groups_spec.rb", "spec/fetchers/members_spec.rb", "spec/fetchers/photos_spec.rb", "spec/fetchers/rsvps_spec.rb", "spec/fetchers/topics_spec.rb", "spec/responses/cities.json", "spec/responses/comments.json", "spec/responses/error.json", "spec/responses/events.json", "spec/responses/groups.json", "spec/responses/members.json", "spec/responses/photos.json", "spec/responses/rsvps.json", "spec/responses/topics.json", "spec/spec_helper.rb", "rMeetup.gemspec"]
  s.homepage = %q{https://github.com/Jberlinsky/rmeetup}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "rMeetup", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rmeetup}
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{A simple Ruby gem, providing access to the Meetup API}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
