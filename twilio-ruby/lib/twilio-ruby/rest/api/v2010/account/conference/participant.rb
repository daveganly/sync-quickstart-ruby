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
          class ConferenceContext < InstanceContext
            class ParticipantList < ListResource
              ##
              # Initialize the ParticipantList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the Account that created this
              #   conference
              # @param [String] conference_sid A 34 character string that identifies the
              #   conference this participant is in
              # @return [ParticipantList] ParticipantList
              def initialize(version, account_sid: nil, conference_sid: nil)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    conference_sid: conference_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:conference_sid]}/Participants.json"
              end
              
              ##
              # Lists ParticipantInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Boolean] muted Only show participants that are muted or unmuted
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(muted: nil, limit: nil, page_size: nil)
                self.stream(
                    muted: muted,
                    limit: limit,
                    page_size: page_size
                ).entries
              end
              
              ##
              # Streams ParticipantInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Boolean] muted Only show participants that are muted or unmuted
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(muted: nil, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)
                
                page = self.page(
                    muted: muted,
                    page_size: limits['page_size'],
                )
                
                @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
              end
              
              ##
              # When passed a block, yields ParticipantInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Boolean] muted Only show participants that are muted or unmuted
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
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [Boolean] muted Only show participants that are muted or unmuted
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of ParticipantInstance
              def page(muted: nil, page_token: nil, page_number: nil, page_size: nil)
                params = {
                    'Muted' => muted,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                }
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                return ParticipantPage.new(@version, response, @solution)
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.ParticipantList>'
              end
            end
          
            class ParticipantPage < Page
              ##
              # Initialize the ParticipantPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] account_sid The unique id of the Account that created this
              #   conference
              # @param [String] conference_sid A 34 character string that identifies the
              #   conference this participant is in
              # @return [ParticipantPage] ParticipantPage
              def initialize(version, response, solution)
                super(version, response)
                
                # Path Solution
                @solution = solution
              end
              
              ##
              # Build an instance of ParticipantInstance
              # @param [Hash] payload Payload response from the API
              # @return [ParticipantInstance] ParticipantInstance
              def get_instance(payload)
                return ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.ParticipantPage>'
              end
            end
          
            class ParticipantContext < InstanceContext
              ##
              # Initialize the ParticipantContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] conference_sid The string that uniquely identifies the
              #   conference this participant is in
              # @param [String] call_sid The call_sid
              # @return [ParticipantContext] ParticipantContext
              def initialize(version, account_sid, conference_sid, call_sid)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    conference_sid: conference_sid,
                    call_sid: call_sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:conference_sid]}/Participants/#{@solution[:call_sid]}.json"
              end
              
              ##
              # Fetch a ParticipantInstance
              # @return [ParticipantInstance] Fetched ParticipantInstance
              def fetch
                params = {}
                
                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )
                
                return ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                    call_sid: @solution[:call_sid],
                )
              end
              
              ##
              # Update the ParticipantInstance
              # @param [Boolean] muted Indicates if the participant should be muted
              # @return [ParticipantInstance] Updated ParticipantInstance
              def update(muted: nil)
                data = {
                    'Muted' => muted,
                }
                
                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )
                
                return ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                    call_sid: @solution[:call_sid],
                )
              end
              
              ##
              # Deletes the ParticipantInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                return @version.delete('delete', @uri)
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.ParticipantContext #{context}>"
              end
            end
          
            class ParticipantInstance < InstanceResource
              ##
              # Initialize the ParticipantInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The unique id of the Account that created this
              #   conference
              # @param [String] conference_sid A 34 character string that identifies the
              #   conference this participant is in
              # @param [String] call_sid The call_sid
              # @return [ParticipantInstance] ParticipantInstance
              def initialize(version, payload, account_sid: nil, conference_sid: nil, call_sid: nil)
                super(version)
                
                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'call_sid' => payload['call_sid'],
                    'conference_sid' => payload['conference_sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'end_conference_on_exit' => payload['end_conference_on_exit'],
                    'muted' => payload['muted'],
                    'start_conference_on_enter' => payload['start_conference_on_enter'],
                    'uri' => payload['uri'],
                }
                
                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'conference_sid' => conference_sid,
                    'call_sid' => call_sid || @properties['call_sid'],
                }
              end
              
              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [ParticipantContext] ParticipantContext for this ParticipantInstance
              def context
                unless @instance_context
                  @instance_context = ParticipantContext.new(
                      @version,
                      @params['account_sid'],
                      @params['conference_sid'],
                      @params['call_sid'],
                  )
                end
                @instance_context
              end
              
              def account_sid
                @properties['account_sid']
              end
              
              def call_sid
                @properties['call_sid']
              end
              
              def conference_sid
                @properties['conference_sid']
              end
              
              def date_created
                @properties['date_created']
              end
              
              def date_updated
                @properties['date_updated']
              end
              
              def end_conference_on_exit
                @properties['end_conference_on_exit']
              end
              
              def muted
                @properties['muted']
              end
              
              def start_conference_on_enter
                @properties['start_conference_on_enter']
              end
              
              def uri
                @properties['uri']
              end
              
              ##
              # Fetch a ParticipantInstance
              # @return [ParticipantInstance] Fetched ParticipantInstance
              def fetch
                context.fetch
              end
              
              ##
              # Update the ParticipantInstance
              # @param [Boolean] muted Indicates if the participant should be muted
              # @return [ParticipantInstance] Updated ParticipantInstance
              def update(muted: nil)
                context.update(
                    muted: muted,
                )
              end
              
              ##
              # Deletes the ParticipantInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.ParticipantInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end