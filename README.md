
# README


### Project Description
```
You are a back-end developer working on a team that is building an application to search for cuisines by country, and provide opportunity to learn more about that countries culture. This app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.
```

### Learning Goals
```
Expose an API that aggregates data from multiple external APIs
Expose an API that requires an authentication token
Implement Basic Authentication
Expose an API for CRUD functionality
Determine completion criteria based on the needs of other developers
Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).
```

### Endpoints
```
GET /api/v1/recipes
GET /api/v1/learning_resources
POST /api/v1/users
POST /api/v1/sessions
Recipes: POST /api/v1/favorites
GET /api/v1/favorites?[API_KEY]
```


- User will need to sign up for a unsplash api key and create account [here](https://unsplash.com/documentation#creating-a-developer-account)
- Sign up for an api key and id at "https://developer.edamam.com/edamam-recipe-api"

  <h3> How to install the project?</h3>

- Fork and clone this repo
- Run `bundle install`
- Run `rails db:{create,migrate}`
- `bundle exec rspec` to run the test suite

