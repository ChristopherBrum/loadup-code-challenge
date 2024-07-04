import React from "react";

const Booking = ({ bookings }) => {
  const bookingsArray = bookings ? JSON.parse(bookings) : [];

  if (!bookings || bookings.length === 0) {
    return <p>No bookings available.</p>;
  }

  const handleDeleteBooking = (e) => {
    if (!window.confirm("Are you sure you want to delete this booking?")) {
      e.preventDefault();
    }
  };

  const formatDate = (booking) => {
    const date = new Date(booking.date_of_service);
    date.setDate(date.getDate() + 1); // Increment the day by 1
    return date.toLocaleDateString();
  };

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
            <th className="header-cell">Total Price</th>
            <th className="header-cell">Delete</th>
          </tr>
        </thead>
        <tbody>
          {bookingsArray.map((booking) => (
            <tr
              key={booking.id}
              className={`table-row ${
                booking.id % 2 === 0 ? "even-row" : "odd-row"
              }`}
            >
              <td className="table-cell">{`${booking.first_name} ${booking.last_name}`}</td>
              <td className="table-cell">{booking.animal_name}</td>
              <td className="table-cell">{booking.animal_type}</td>
              <td className="table-cell">{booking.hours_requested}</td>
              <td className="table-cell">{formatDate(booking)}</td>
              <td className="table-cell price-cell">
                ${parseFloat(booking.price).toFixed(2)}
              </td>
              <td className="table-cell">
                <form
                  action={`/bookings/${booking.id}`}
                  method="post"
                  onSubmit={handleDeleteBooking}
                >
                  <input type="hidden" name="_method" value="delete" />
                  <input
                    type="hidden"
                    name="authenticity_token"
                    value={
                      document.querySelector('meta[name="csrf-token"]').content
                    }
                  />
                  <button type="submit" className="delete-btn">
                    Delete
                  </button>
                </form>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Booking;
