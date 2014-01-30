module RMeetup
	module Type

		# == RMeetup::Type::City
		#
		# Data wraper for a City fethcing response
		# Used to access result attributes as well
		# as progammatically fetch relative data types
		# based on this city.

		# Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
		# See http://www.meetup.com/meetup_api/docs/cities/ for available fields

		class Venue

			attr_accessor :venue

			def initialize(venue = {})
				self.venue = venue
			end

			def method_missing(id, *args)
				return self.venue[id.id2name]
			end

			# Special accessors that need typecasting or other parsing

			def id
				return self.venue['id'].to_i
			end
			def zip
				return self.venue['zip'].to_s
			end
			def state
				return self.venue['state'].to_s
			end
			def address_1
				return self.venue['address_1'].to_s
			end
			def city
				return self.venue['city'].to_s
			end
			def country
				return self.venue['country'].to_s
			end
			def distance
				return self.venue['distance'].to_i
			end
			def rating_count
				return self.venue['rating_count'].to_i
			end
			def rating
				return self.venue['rating'].to_s
			end
			def lat
				return self.venue['lat'].to_f
			end
			def lon
				return self.venue['lon'].to_f
			end
		end
	end
end