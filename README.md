### Project: GifGenerator

Create an app where users can "favorite" gifs. Host your app live on Heroku.

#### Gifs

- [X] Admins can generate gifs by entering a one-word search term in field and then clicking "generate gif". This should create a new gif in the database. This feature is not available to regular users.
  - Gifs should have an image_path. See above "Images" in project #1 for more info on implementing images.
  - Use the [GiphyApi](https://github.com/giphy/GiphyAPI) to generate gifs.

#### Favoriting

- [X] Regular users can mark a gif as "favorite".
- [X] Regular users can see a list of all of the gifs they've marked as favorites.
- [X] Regular users cannot delete a gif; they can only "unfavorite" it for themselves.
- [X] Regular users should be able to see all gifs sorted by category.
- [X] Regular users should be able to see favorited gifs sorted by category.

#### Categories

- [X] Gifs belong to a category (category is the original word that was searched for by the admin).
- [X] categories can be created by a logged-in admin user (regular logged in users cannot create categories).
- [X] categories can be destroyed by a logged-in admin user (regular logged in users cannot destroy categories).

#### Authentication and Authorization

- [X] Users need to log in to see their favorited gifs.
- [X] Users can only see their own favorited gifs -- they should not be able to visit another user's page.
- [X] Users cannot create favorites for other users.
- [X] Users cannot create new categories -- only the admin can do that.
- [X] Users cannot create gifs -- only the admin can do that.
- [X] Visitors (non-registered users) can create user accounts.

#### User Experience

- [X] The application has been styled.
- [X] The application uses a balanced, considered color scheme.
- [X] The application implements a font (that is not the default font).
- [X] The application utilizes a nav bar. 
- [X] The style shows evidence of intentional layout. 
- [X] Space and text is balanced. White space is used to visually separate content. 
- [X] The application is easily usable. The user can intuitvely navigate between different portions of the application without manually entering the URL into the nav-bar or using the back button on their browser.

#### Database

- [X] Properly implements a one-to-many relationship
- [X] Properly implements a many-to-many relationship
- [X] Utilizes primary and foreign keys appropriately

### Code Quality

- [X] Logic lives in the appropriate files
- [X] Methods are refactored and follow SRP
- [X] Naming follows convention

#### Testing

- [X] Project has a running test suite
- [X] Test suite includes robust feature tests
- [X] Test suite includes tests for validations
- [X] Test suite includes tests for methods that they have created on the models

#### Optional Extensions

- Implement Twitter, Github, or Facebook OAuth login
- Use HAML for your views
- TDD using RSpec instead of Test::Unit
