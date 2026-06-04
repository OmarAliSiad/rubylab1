# Bonus — The Architect's Test

### 1. What would you name the new class and where would it live?

I would create a class called `SlackHandler`.

It would be in a separate file called:

```text
slack_handler.rb
```

because its only job is sending notifications to Slack.

---

### 2. What is the one method it must implement?

It must implement:

```ruby
def handle(event)
```

The router calls this method whenever a new event is logged.

---

### 3. List every existing file you would open to plug it in.

I only need to update `main.rb` to register the new handler:

```ruby
router.register(SlackHandler.new)
```

I don't need to change any of the existing handlers.

---

### 4. If that list includes the router or the shared interface, stop. Name the violated principle and fix the design before touching any code.

If I have to modify `event_router.rb` or `handler.rb`, then the design is not following the Open/Closed Principle.

The router should already work with any handler that implements `handle(event)`. To add Slack support, I should only create `SlackHandler` and register it in `main.rb`, without changing the router itself.
