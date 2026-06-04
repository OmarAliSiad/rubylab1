Bonus — The Architect's Test 
================================== 

1. If you had to add a new class to this project, what would you name it and where would it live?

I would make a new class called SlackHandler.

It would live in its own file: 

```text 
slack_handler.rb 
``` 

because its sole purpose is to send messages to Slack.

--- 

2. What is the one method it must implement?

It must implement: 

```ruby 
def handle(event) 
``` 

The router will invoke this method whenever a new event needs to be logged.

--- 

3. List every existing file you would open to plug it in.

The only file I need to open is main.rb in order to register my new handler:

```ruby 
router.register(SlackHandler.new) 
``` 

I don't need to modify any of the existing handlers.

--- 

4. If that list includes the router or the shared interface, stop. Name the violated principle and fix the design before touching any code.

If I had to edit event_router.rb or handler.rb then my design is violating the Open/Closed principle.

The router should already work with any handler that implements handle(event). To add support for Slack notifications, all I need to do is create SlackHandler and register it from main.rb.
