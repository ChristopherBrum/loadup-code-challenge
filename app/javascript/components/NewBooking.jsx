import React from 'react'

const NewBooking = () => {
  return (
		<>
			<h2>New Booking Form</h2>
			<form action="/bookings" method="POST">
			<label htmlFor="first_name">Your First Name:</label>
			<input type="text" id="first_name" name="first_name" required />

			<label htmlFor="last_name">Your Last Name:</label>
			<input type="text" id="last_name" name="last_name" required />

			<label htmlFor="animal_name">Animal's Name:</label>
			<input type="text" id="animal_name" name="animal_name" required />

			<label htmlFor="animal_type">Animal Type:</label>
			<select id="animal_type" name="animal_type" required>
					<option value="Dog">Dog</option>
					<option value="Cat">Cat</option>
			</select>

			<label htmlFor="hours_requested">Hours Requested (2-8):</label>
			<input type="number" id="hours_requested" name="hours_requested" min="2" max="8" required />

			<label htmlFor="date_of_service">Date of Service:</label>
			<input type="date" id="date_of_service" name="date_of_service" required />

			<input type="submit" value="Submit Booking" />
		</form>
		</>
  )
}

export default NewBooking
