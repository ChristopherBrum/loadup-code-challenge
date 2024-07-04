import React from "react";

const ShowBooking = ({ booking }) => {
  if (!booking || booking.length === 0) {
    return <p>No booking available.</p>;
  }

  const handleDeleteBooking = (e) => {
    if (!window.confirm("Are you sure you want to cancel this booking?")) {
      e.preventDefault();
    }
  };

  return (
    <div className="show-booking-detail-container" id="darkModeDetailTable">
      <table className="show-booking-detail-table">
        <tbody>
          <tr className="show-booking-detail-row">
            <th className="show-booking-detail-label">Client Name</th>
            <td className="show-booking-detail-value">{`${booking.first_name} ${booking.last_name}`}</td>
          </tr>
          <tr className="show-booking-detail-row">
            <th className="show-booking-detail-label">Animal Name</th>
            <td className="show-booking-detail-value">{booking.animal_name}</td>
          </tr>
          <tr className="show-booking-detail-row">
            <th className="show-booking-detail-label">Animal Type</th>
            <td className="show-booking-detail-value">{booking.animal_type}</td>
          </tr>
          <tr className="show-booking-detail-row">
            <th className="show-booking-detail-label">Hours Requested</th>
            <td className="show-booking-detail-value">
              {booking.hours_requested}
            </td>
          </tr>
          <tr className="show-booking-detail-row">
            <th className="show-booking-detail-label">Date of Service</th>
            <td className="show-booking-detail-value">
              {new Date(booking.date_of_service).toLocaleDateString()}
            </td>
          </tr>
          <tr className="show-booking-detail-row">
            <th className="show-booking-detail-label">Total Price</th>
            <td className="show-booking-detail-value show-booking-price-value">
              ${parseFloat(booking.price).toFixed(2)}
            </td>
          </tr>
          <tr className="show-booking-detail-row">
            <th className="show-booking-detail-label">Cancel Booking</th>
            <td className="show-booking-detail-value">
              <form
                action={`/bookings/${booking.id}`}
                method="delete"
                onSubmit={handleDeleteBooking}
                className="show-booking-cancel-form"
              >
                <input type="hidden" name="_method" value="delete" />
                <input
                  type="hidden"
                  name="authenticity_token"
                  value={
                    document.querySelector('meta[name="csrf-token"]').content
                  }
                />
                <button type="submit" className="show-booking-cancel-btn">
                  Cancel Booking
                </button>
              </form>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  );
};

export default ShowBooking;
