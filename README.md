# LoadUp Code Challenge - Cat and Dog Sitting Service

## Setup Instructions

### Prerequisites

- Ruby (version 3.2.2)
- Rails (version 7.1)
- Node.js and npm (for JavaScript dependencies)
- PostgreSQL (or another database supported by Rails)
- Firefox (for running end-to-end tests)

### Installation

1. **Clone the repository**:

   ```sh
   git clone https://github.com/yourusername/loadup-pet-sitting.git
   cd loadup-pet-sitting
   ```

2. **Install Ruby dependencies**:

   ```sh
   bundle install
   ```

3. **Install JavaScript dependencies**:

   ```sh
   npm install
   ```

4. **Set up the database**:

   ```sh
   rails db:create
   rails db:migrate
   ```

5. **Start the Rails server**:

   ```sh
   rails server
   ```

6. **Visit the application**:

   Open your web browser and navigate to `http://localhost:3000`.

### Running Tests

#### Unit Tests

Unit tests are provided for the pricing engine. To run the unit tests, use the following command:

```sh
bundle exec rspec spec/helpers spec/models spec/controllers
```

#### End-to-End Tests

End-to-end tests are provided for the booking form and admin pages. These tests ensure that the React components render properly and that the booking process works as expected.

To run the end-to-end tests, use the following command:

```sh
bundle exec rspec spec/features/booking_spec.rb
```

**Note**: During the development of the end-to-end tests, there were challenges in getting the React components to render properly in the test environment. The main issues were related to timing and visibility of the components. Despite these challenges, the tests should provide a good starting point for verifying the functionality of the booking form and admin pages.

### Pricing Engine

The pricing engine calculates the cost of the pet sitting service based on the following rules:

- Base charge: $20
- Additional charge per hour for dogs: $10
- Additional charge per hour for cats: $5

### Future Improvements

Given more time, the following improvements could be made:

- **Improved Error Handling**: Enhance the form validation and error messages.
- **Styling**: Add more styling to the booking form and admin pages for a better user experience.
- **Deployment**: Deploy the application to a cloud service (e.g., Heroku) for easier access and demonstration.
- **Additional Tests**: Add more comprehensive tests for edge cases and error scenarios.

## Conclusion

Thank you for taking the time to review this application. If you have any questions or need further assistance, please feel free to reach out.

---

Feel free to customize the repository URL and any other details specific to your application. This `README.md` should provide clear instructions for setting up and running the application, as well as context about the testing challenges encountered.