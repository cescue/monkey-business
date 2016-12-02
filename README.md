# monkey-business
Simple ruby client for the surveymonkey api

## Usage

Make sure your access token is stored an environment variable named `SURVEYMONKEY_ACCESS_TOKEN`.

The client is sort of a DSL

```
  client = MonkeyBusiness::API.new

  client.surveys                      # /surveys/
  client.surveys(id: 12)              # /surveys/12
  client.surveys(id: 12).responses    # /surveys/12/responses
  client.surveys(id: 12).responses(5) # /surveys/12/responses/5

  # ... et cetera, you get the idea.
```

However, in order to actually make the API calls, you'll need to follow up with a call to the `request` method (ideally this will change in the future):

```
  client.surveys                        # Returns a MonkeyBusiness::Surveys object
  client.surveys.request                # Sends the actual request (Defaults to GET)
  client.surveys.request(method: :post) # Sends a POST request
```

## TODO

  * Implement all API methods
  * Make usage more intuitive
  * Better documentation
