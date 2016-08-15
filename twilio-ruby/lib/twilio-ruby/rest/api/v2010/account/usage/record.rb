##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class UsageList < ListResource
            class RecordList < ListResource
              ##
              # Initialize the RecordList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [RecordList] RecordList
              def initialize(version, account_sid: nil)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Records.json"
                
                # Components
                @all_time = nil
                @daily = nil
                @last_month = nil
                @monthly = nil
                @this_month = nil
                @today = nil
                @yearly = nil
                @yesterday = nil
              end
              
              ##
              # Lists RecordInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [yesterday.Category] category Only include usage of a given category
              # @param [Time] start_date_before Filter by start date
              # @param [Time] start_date Filter by start date
              # @param [Time] start_date_after: Filter by start date
              # @param [Time] end_date_before Filter by end date
              # @param [Time] end_date Filter by end date
              # @param [Time] end_date_after: Filter by end date
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(category: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, limit: nil, page_size: nil)
                self.stream(
                    category: category,
                    start_date_before: start_date_before,
                    start_date: start_date,
                    start_date_after: start_date_after,
                    end_date_before: end_date_before,
                    end_date: end_date,
                    end_date_after: end_date_after,
                    limit: limit,
                    page_size: page_size
                ).entries
              end
              
              ##
              # Streams RecordInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [yesterday.Category] category Only include usage of a given category
              # @param [Time] start_date_before Filter by start date
              # @param [Time] start_date Filter by start date
              # @param [Time] start_date_after: Filter by start date
              # @param [Time] end_date_before Filter by end date
              # @param [Time] end_date Filter by end date
              # @param [Time] end_date_after: Filter by end date
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(category: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)
                
                page = self.page(
                    category: category,
                    start_date_before: start_date_before,
                    start_date: start_date,
                    start_date_after: start_date_after,
                    end_date_before: end_date_before,
                    end_date: end_date,
                    end_date_after: end_date_after,
                    page_size: limits['page_size'],
                )
                
                @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
              end
              
              ##
              # When passed a block, yields RecordInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [yesterday.Category] category Only include usage of a given category
              # @param [Time] start_date_before Filter by start date
              # @param [Time] start_date Filter by start date
              # @param [Time] start_date_after: Filter by start date
              # @param [Time] end_date_before Filter by end date
              # @param [Time] end_date Filter by end date
              # @param [Time] end_date_after: Filter by end date
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to read the
              #                       limit with the most efficient page size, i.e. min(limit, 1000)
              def each
                limits = @version.read_limits
                
                page = self.page(
                    page_size: limits['page_size'],
                )
                
                @version.stream(page,
                                limit: limits['limit'],
                                page_limit: limits['page_limit']).each {|x| yield x}
              end
              
              ##
              # Retrieve a single page of RecordInstance records from the API.
              # Request is executed immediately.
              # @param [yesterday.Category] category Only include usage of a given category
              # @param [Time] start_date_before Filter by start date
              # @param [Time] start_date Filter by start date
              # @param [Time] start_date_after: Filter by start date
              # @param [Time] end_date_before Filter by end date
              # @param [Time] end_date Filter by end date
              # @param [Time] end_date_after: Filter by end date
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of RecordInstance
              def page(category: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, page_token: nil, page_number: nil, page_size: nil)
                params = {
                    'Category' => category,
                    'StartDate<' => Twilio.serialize_iso8601(start_date_before),
                    'StartDate' => Twilio.serialize_iso8601(start_date),
                    'StartDate>' => Twilio.serialize_iso8601(start_date_after),
                    'EndDate<' => Twilio.serialize_iso8601(end_date_before),
                    'EndDate' => Twilio.serialize_iso8601(end_date),
                    'EndDate>' => Twilio.serialize_iso8601(end_date_after),
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                }
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                return RecordPage.new(@version, response, @solution)
              end
              
              ##
              # Access the all_time
              # @return [AllTimeList] AllTimeList
              def all_time
                @all_time ||= AllTimeList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Access the daily
              # @return [DailyList] DailyList
              def daily
                @daily ||= DailyList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Access the last_month
              # @return [LastMonthList] LastMonthList
              def last_month
                @last_month ||= LastMonthList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Access the monthly
              # @return [MonthlyList] MonthlyList
              def monthly
                @monthly ||= MonthlyList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Access the this_month
              # @return [ThisMonthList] ThisMonthList
              def this_month
                @this_month ||= ThisMonthList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Access the today
              # @return [TodayList] TodayList
              def today
                @today ||= TodayList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Access the yearly
              # @return [YearlyList] YearlyList
              def yearly
                @yearly ||= YearlyList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Access the yesterday
              # @return [YesterdayList] YesterdayList
              def yesterday
                @yesterday ||= YesterdayList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.RecordList>'
              end
            end
          
            class RecordPage < Page
              ##
              # Initialize the RecordPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [RecordPage] RecordPage
              def initialize(version, response, solution)
                super(version, response)
                
                # Path Solution
                @solution = solution
              end
              
              ##
              # Build an instance of RecordInstance
              # @param [Hash] payload Payload response from the API
              # @return [RecordInstance] RecordInstance
              def get_instance(payload)
                return RecordInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.RecordPage>'
              end
            end
          
            class RecordInstance < InstanceResource
              ##
              # Initialize the RecordInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [RecordInstance] RecordInstance
              def initialize(version, payload, account_sid: nil)
                super(version)
                
                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'api_version' => payload['api_version'],
                    'category' => payload['category'],
                    'count' => payload['count'],
                    'count_unit' => payload['count_unit'],
                    'description' => payload['description'],
                    'end_date' => Twilio.deserialize_iso8601(payload['end_date']),
                    'price' => payload['price'].to_f,
                    'price_unit' => payload['price_unit'],
                    'start_date' => Twilio.deserialize_iso8601(payload['start_date']),
                    'subresource_uris' => payload['subresource_uris'],
                    'uri' => payload['uri'],
                    'usage' => payload['usage'],
                    'usage_unit' => payload['usage_unit'],
                }
              end
              
              def account_sid
                @properties['account_sid']
              end
              
              def api_version
                @properties['api_version']
              end
              
              def category
                @properties['category']
              end
              
              def count
                @properties['count']
              end
              
              def count_unit
                @properties['count_unit']
              end
              
              def description
                @properties['description']
              end
              
              def end_date
                @properties['end_date']
              end
              
              def price
                @properties['price']
              end
              
              def price_unit
                @properties['price_unit']
              end
              
              def start_date
                @properties['start_date']
              end
              
              def subresource_uris
                @properties['subresource_uris']
              end
              
              def uri
                @properties['uri']
              end
              
              def usage
                @properties['usage']
              end
              
              def usage_unit
                @properties['usage_unit']
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.RecordInstance>"
              end
            end
          end
        end
      end
    end
  end
end