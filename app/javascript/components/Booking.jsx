import React from 'react'

const Booking = ({ bookings }) => {
  return (
    <div className="booking-table-container">
      <table className="booking-table">
        <thead>
          <tr>
            <th>Client Name</th>
            <th>Animal Name</th>
            <th>Animal Type</th>
            <th>Hours Requested</th>
            <th>Date of Service</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
          {bookings.map((booking, index) => (
            <tr key={index}>
              <td>{`${booking.first_name} ${booking.last_name}`}</td>
              <td>{booking.animal_name}</td>
              <td>{booking.animal_type}</td>
              <td>{booking.hours_requested}</td>
              <td>{new Date(booking.date_of_service).toLocaleDateString()}</td>
              <td>${booking.price.toFixed(2)}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default Booking
