import React, { useState } from "react";

const NewBooking = () => {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [animalName, setAnimalName] = useState("");
  const [animalType, setAnimalType] = useState("");
  const [hoursRequested, setHoursRequested] = useState("");
  const [dateOfService, setDateOfService] = useState("");

  const displayMessage = (message) => {
    if (!message) return null;

    const element = document.querySelector(".message");
    element.innerHTML = message;

    setTimeout(() => {
      element.innerHTML = "";
    }, 5000)

    return null;
  };

  const validInputs = () => {
    if (firstName.trim().length < 1) {
      return displayMessage("First name cannot be empty");
    }

    if (lastName.trim().length < 1) {
      return displayMessage("Last name cannot be empty");
    }

    if (animalName.trim().length < 1) {
      return displayMessage("Animal name cannot be empty");
    }

    if (animalType !== "Dog" && animalType !== "Cat") {
      console.log(animalType)
      return displayMessage("Please select an animal type");
    }

    if (hoursRequested < 2 || hoursRequested > 8) {
      return displayMessage("Hours requested must be between 2 and 8");
    }

    if (!dateOfService) {
      return displayMessage("Date of service is required");
    } else {
      const selectedDate = new Date(dateOfService);
      const today = new Date();
      if (selectedDate < today) {
        return displayMessage("Date of service cannot be in the past");
      }
    }

    return true;
  };

  const handleSubmit = (e) => {
    if (!validInputs()) {
      e.preventDefault();
    }
  };

  return (
    <div className="new-booking-container" id="darkModeForm">
      {/* prevents cross-site request forgery attacks */}
      <input
        type="hidden"
        name="authenticity_token"
        value={document.querySelector('meta[name="csrf-token"]').content}
      />

      <form action="/bookings" method="POST" onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="first_name">Your First Name:</label>
          <input
            type="text"
            id="first_name"
            name="booking[first_name]"
            value={firstName}
            onChange={(e) => setFirstName(e.target.value)}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="last_name">Your Last Name:</label>
          <input
            type="text"
            id="last_name"
            name="booking[last_name]"
            value={lastName}
            onChange={(e) => setLastName(e.target.value)}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="animal_name">Animal's Name:</label>
          <input
            type="text"
            id="animal_name"
            name="booking[animal_name]"
            value={animalName}
            onChange={(e) => setAnimalName(e.target.value)}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="animal_type">Animal Type:</label>
          <select
            id="animal_type"
            name="booking[animal_type]"
            value={animalType}
            onChange={(e) => setAnimalType(e.target.value)}
            required
          >
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
            value={hoursRequested}
            onChange={(e) => setHoursRequested(e.target.value)}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="date_of_service">Date of Service:</label>
          <input
            type="date"
            id="date_of_service"
            name="booking[date_of_service]"
            value={dateOfService}
            onChange={(e) => setDateOfService(e.target.value)}
            required
          />
        </div>

        <div className="form-group">
          <input type="submit" value="Submit Booking" className="submit-btn" />
        </div>
      </form>

      <p className="message"></p>
    </div>
  );
};

export default NewBooking;