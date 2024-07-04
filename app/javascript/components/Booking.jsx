import React from "react";

const Booking = ({ bookings }) => {
  const bookingsArray = bookings ? JSON.parse(bookings) : [];

  if (bookingsArray.length === 0) {
    return <p>No bookings available.</p>;
  }

  return (
    <div className="booking-table-container" id="darkModeTable">
      <table className="booking-table">
        <thead>
          <tr className="table-header">
            <th className="header-cell">Client Name</th>
            <th className="header-cell">Animal Name</th>
            <th className="header-cell">Animal Type</th>
            <th className="header-cell">Hours Requested</th>
            <th className="header-cell">Date of Service</th>
            <th className="header-cell">Price</th>
          </tr>
        </thead>
        <tbody>
          {bookingsArray.map((booking, index) => (
            <tr
              key={index}
              className={`table-row ${
                index % 2 === 0 ? "even-row" : "odd-row"
              }`}
            >
              <td className="table-cell">{`${booking.first_name} ${booking.last_name}`}</td>
              <td className="table-cell">{booking.animal_name}</td>
              <td className="table-cell">{booking.animal_type}</td>
              <td className="table-cell">{booking.hours_requested}</td>
              <td className="table-cell">
                {new Date(booking.date_of_service).toLocaleDateString()}
              </td>
              <td className="table-cell price-cell">
                ${parseFloat(booking.price).toFixed(2)}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Booking;
