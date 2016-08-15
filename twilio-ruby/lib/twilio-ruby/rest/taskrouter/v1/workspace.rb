##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceList < ListResource
          ##
          # Initialize the WorkspaceList
          # @param [Version] version Version that contains the resource
          # @return [WorkspaceList] WorkspaceList
          def initialize(version)
            super(version)
            
            # Path Solution
            @solution = {}
            @uri = "/Workspaces"
          end
          
          ##
          # Lists WorkspaceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] friendly_name The friendly_name
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(friendly_name: nil, limit: nil, page_size: nil)
            self.stream(
                friendly_name: friendly_name,
                limit: limit,
                page_size: page_size
            ).entries
          end
          
          ##
          # Streams WorkspaceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name The friendly_name
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(friendly_name: nil, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)
            
            page = self.page(
                friendly_name: friendly_name,
                page_size: limits['page_size'],
            )
            
            @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
          end
          
          ##
          # When passed a block, yields WorkspaceInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name The friendly_name
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
          # Retrieve a single page of WorkspaceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The friendly_name
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of WorkspaceInstance
          def page(friendly_name: nil, page_token: nil, page_number: nil, page_size: nil)
            params = {
                'FriendlyName' => friendly_name,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            }
            response = @version.page(
                'GET',
                @uri,
                params
            )
            return WorkspacePage.new(@version, response, @solution)
          end
          
          ##
          # Retrieve a single page of WorkspaceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The friendly_name
          # @param [String] event_callback_url The event_callback_url
          # @param [String] template The template
          # @return [WorkspaceInstance] Newly created WorkspaceInstance
          def create(friendly_name: nil, event_callback_url: nil, template: nil)
            data = {
                'FriendlyName' => friendly_name,
                'EventCallbackUrl' => event_callback_url,
                'Template' => template,
            }
            
            payload = @version.create(
                'POST',
                @uri,
                data: data
            )
            
            return WorkspaceInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Taskrouter.V1.WorkspaceList>'
          end
        end
      
        class WorkspacePage < Page
          ##
          # Initialize the WorkspacePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [WorkspacePage] WorkspacePage
          def initialize(version, response, solution)
            super(version, response)
            
            # Path Solution
            @solution = solution
          end
          
          ##
          # Build an instance of WorkspaceInstance
          # @param [Hash] payload Payload response from the API
          # @return [WorkspaceInstance] WorkspaceInstance
          def get_instance(payload)
            return WorkspaceInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Taskrouter.V1.WorkspacePage>'
          end
        end
      
        class WorkspaceContext < InstanceContext
          ##
          # Initialize the WorkspaceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [WorkspaceContext] WorkspaceContext
          def initialize(version, sid)
            super(version)
            
            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Workspaces/#{@solution[:sid]}"
            
            # Dependents
            @activities = nil
            @events = nil
            @tasks = nil
            @task_queues = nil
            @workers = nil
            @workflows = nil
            @statistics = nil
          end
          
          ##
          # Fetch a WorkspaceInstance
          # @return [WorkspaceInstance] Fetched WorkspaceInstance
          def fetch
            params = {}
            
            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )
            
            return WorkspaceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end
          
          ##
          # Update the WorkspaceInstance
          # @param [String] default_activity_sid The default_activity_sid
          # @param [String] event_callback_url The event_callback_url
          # @param [String] friendly_name The friendly_name
          # @param [String] timeout_activity_sid The timeout_activity_sid
          # @return [WorkspaceInstance] Updated WorkspaceInstance
          def update(default_activity_sid: nil, event_callback_url: nil, friendly_name: nil, timeout_activity_sid: nil)
            data = {
                'DefaultActivitySid' => default_activity_sid,
                'EventCallbackUrl' => event_callback_url,
                'FriendlyName' => friendly_name,
                'TimeoutActivitySid' => timeout_activity_sid,
            }
            
            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )
            
            return WorkspaceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end
          
          ##
          # Deletes the WorkspaceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            return @version.delete('delete', @uri)
          end
          
          ##
          # Access the activities
          # @return [ActivityList] ActivityList
          def activities(sid=:unset)
            if sid != :unset
              return ActivityContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @activities
              @activities = ActivityList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end
            
            @activities
          end
          
          ##
          # Access the events
          # @return [EventList] EventList
          def events(sid=:unset)
            if sid != :unset
              return EventContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @events
              @events = EventList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end
            
            @events
          end
          
          ##
          # Access the tasks
          # @return [TaskList] TaskList
          def tasks(sid=:unset)
            if sid != :unset
              return TaskContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @tasks
              @tasks = TaskList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end
            
            @tasks
          end
          
          ##
          # Access the task_queues
          # @return [TaskQueueList] TaskQueueList
          def task_queues(sid=:unset)
            if sid != :unset
              return TaskQueueContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @task_queues
              @task_queues = TaskQueueList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end
            
            @task_queues
          end
          
          ##
          # Access the workers
          # @return [WorkerList] WorkerList
          def workers(sid=:unset)
            if sid != :unset
              return WorkerContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @workers
              @workers = WorkerList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end
            
            @workers
          end
          
          ##
          # Access the workflows
          # @return [WorkflowList] WorkflowList
          def workflows(sid=:unset)
            if sid != :unset
              return WorkflowContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @workflows
              @workflows = WorkflowList.new(
                  @version,
                  workspace_sid: @solution[:sid],
              )
            end
            
            @workflows
          end
          
          ##
          # Access the statistics
          # @return [WorkspaceStatisticsList] WorkspaceStatisticsList
          def statistics
            return WorkspaceStatisticsContext.new(
                @version,
                @solution[:sid],
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Taskrouter.V1.WorkspaceContext #{context}>"
          end
        end
      
        class WorkspaceInstance < InstanceResource
          ##
          # Initialize the WorkspaceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [WorkspaceInstance] WorkspaceInstance
          def initialize(version, payload, sid: nil)
            super(version)
            
            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                'default_activity_name' => payload['default_activity_name'],
                'default_activity_sid' => payload['default_activity_sid'],
                'event_callback_url' => payload['event_callback_url'],
                'friendly_name' => payload['friendly_name'],
                'sid' => payload['sid'],
                'timeout_activity_name' => payload['timeout_activity_name'],
                'timeout_activity_sid' => payload['timeout_activity_sid'],
            }
            
            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end
          
          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          # @return [WorkspaceContext] WorkspaceContext for this WorkspaceInstance
          def context
            unless @instance_context
              @instance_context = WorkspaceContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end
          
          def account_sid
            @properties['account_sid']
          end
          
          def date_created
            @properties['date_created']
          end
          
          def date_updated
            @properties['date_updated']
          end
          
          def default_activity_name
            @properties['default_activity_name']
          end
          
          def default_activity_sid
            @properties['default_activity_sid']
          end
          
          def event_callback_url
            @properties['event_callback_url']
          end
          
          def friendly_name
            @properties['friendly_name']
          end
          
          def sid
            @properties['sid']
          end
          
          def timeout_activity_name
            @properties['timeout_activity_name']
          end
          
          def timeout_activity_sid
            @properties['timeout_activity_sid']
          end
          
          ##
          # Fetch a WorkspaceInstance
          # @return [WorkspaceInstance] Fetched WorkspaceInstance
          def fetch
            context.fetch
          end
          
          ##
          # Update the WorkspaceInstance
          # @param [String] default_activity_sid The default_activity_sid
          # @param [String] event_callback_url The event_callback_url
          # @param [String] friendly_name The friendly_name
          # @param [String] timeout_activity_sid The timeout_activity_sid
          # @return [WorkspaceInstance] Updated WorkspaceInstance
          def update(default_activity_sid: nil, event_callback_url: nil, friendly_name: nil, timeout_activity_sid: nil)
            context.update(
                default_activity_sid: default_activity_sid,
                event_callback_url: event_callback_url,
                friendly_name: friendly_name,
                timeout_activity_sid: timeout_activity_sid,
            )
          end
          
          ##
          # Deletes the WorkspaceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end
          
          ##
          # Access the activities
          # @return [activities] activities
          def activities
            context.activities
          end
          
          ##
          # Access the events
          # @return [events] events
          def events
            context.events
          end
          
          ##
          # Access the tasks
          # @return [tasks] tasks
          def tasks
            context.tasks
          end
          
          ##
          # Access the task_queues
          # @return [task_queues] task_queues
          def task_queues
            context.task_queues
          end
          
          ##
          # Access the workers
          # @return [workers] workers
          def workers
            context.workers
          end
          
          ##
          # Access the workflows
          # @return [workflows] workflows
          def workflows
            context.workflows
          end
          
          ##
          # Access the statistics
          # @return [statistics] statistics
          def statistics
            context.statistics
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Taskrouter.V1.WorkspaceInstance #{values}>"
          end
        end
      end
    end
  end
end