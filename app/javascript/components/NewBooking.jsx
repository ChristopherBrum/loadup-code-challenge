import React from "react";

const NewBooking = () => {
  return (
    <div className="new-booking-container" id="darkModeForm">
			<input type="hidden" name="authenticity_token" value={document.querySelector('meta[name="csrf-token"]').content} />

      <form action="/bookings" method="POST">
        <div className="form-group">
          <label htmlFor="first_name">Your First Name:</label>
          <input type="text" id="first_name" name="booking[first_name]" required />
        </div>

        <div className="form-group">
          <label htmlFor="last_name">Your Last Name:</label>
          <input type="text" id="last_name" name="booking[last_name]" required />
        </div>

        <div className="form-group">
          <label htmlFor="animal_name">Animal's Name:</label>
          <input type="text" id="animal_name" name="booking[animal_name]" required />
        </div>

        <div className="form-group">
          <label htmlFor="animal_type">Animal Type:</label>
          <select id="animal_type" name="booking[animal_type]" required>
            <option value="">Select animal type</option>
            <option value="Dog">Dog</option>
            <option value="Cat">Cat</option>
          </select>
        </div>

        <div className="form-group">
          <label htmlFor="hours_requested">Hours Requested (2-8):</label>
          <input
            type="number"
            id="hours_requested"
            name="booking[hours_requested]"
            min="2"
            max="8"
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="date_of_service">Date of Service:</label>
          <input
            type="date"
            id="date_of_service"
            name="booking[date_of_service]"
            required
          />
        </div>

        <div className="form-group">
          <input type="submit" value="Submit Booking" className="submit-btn" />
        </div>
      </form>
    </div>
  );
};

export default NewBooking;
