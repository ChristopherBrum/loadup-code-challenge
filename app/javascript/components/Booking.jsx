import React from 'react'

const Booking = ({ initialDate, userId }) => {
  return (
    <div>
      <h2>Booking Component</h2>
      <p>Initial Date: {initialDate}</p>
      <p>User ID: {userId}</p>
      {/* Add your booking form or logic here */}
    </div>
  )
}

export default Booking
