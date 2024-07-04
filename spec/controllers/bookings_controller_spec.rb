require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  let(:valid_attributes) {
    {
      first_name: "John",
      last_name: "Doe",
      animal_name: "Fluffy",
      animal_type: "Dog",
      hours_requested: 3,
      date_of_service: Date.tomorrow,
      price: 100
    }
  }

  let(:invalid_attributes) {
   {
      first_name: "",
      last_name: "",
      animal_name: "",
      animal_type: "",
      hours_requested: 1,
      date_of_service: nil,
      price: nil
    }
  }

  before do
    allow_any_instance_of(BookingsController).to receive(:calculate_price) do |_, animal_type, hours|
      if animal_type.present? && hours.to_i >= 2
        100
      else
        nil
      end
    end
  end  

  describe "GET #index" do
    it "returns a success response" do
      Booking.create! valid_attributes
      get :index
      expect(response).to be_successful
    end

    it "assigns @bookings in descending order of creation" do
      booking1 = Booking.create! valid_attributes
      booking2 = Booking.create! valid_attributes
      get :index
      expect(assigns(:bookings)).to eq([booking2, booking1])
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new Booking to @booking" do
      get :new
      expect(assigns(:booking)).to be_a_new(Booking)
    end
  end

  describe "GET #show" do
    context "with valid id" do
      it "returns a success response" do
        booking = Booking.create! valid_attributes
        get :show, params: { id: booking.to_param }
        expect(response).to be_successful
      end
    end

    context "with invalid id" do
      it "redirects to the bookings path" do
        get :show, params: { id: 'invalid' }
        expect(response).to redirect_to(bookings_path)
        expect(flash[:alert]).to eq('Booking ID is invalid.')
      end
    end

    context "with non-existent id" do
      it "redirects to the bookings path" do
        get :show, params: { id: 999999 }
        expect(response).to redirect_to(bookings_path)
        expect(flash[:alert]).to eq('Booking ID does not exist.')
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Booking" do
        expect {
          post :create, params: { booking: valid_attributes }
        }.to change(Booking, :count).by(1)
      end

      it "redirects to the created booking" do
        post :create, params: { booking: valid_attributes }
        expect(response).to redirect_to(Booking.last)
      end

      it "sets the correct price" do
        post :create, params: { booking: valid_attributes }
        expect(Booking.last.price).to eq(100)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested booking" do
      booking = Booking.create! valid_attributes
      expect {
        delete :destroy, params: { id: booking.to_param }
      }.to change(Booking, :count).by(-1)
    end

    it "redirects to the bookings list" do
      booking = Booking.create! valid_attributes
      delete :destroy, params: { id: booking.to_param }
      expect(response).to redirect_to(bookings_path)
    end

    it "sets a notice on successful deletion" do
      booking = Booking.create! valid_attributes
      delete :destroy, params: { id: booking.to_param }
      expect(flash[:notice]).to eq('Booking was successfully deleted.')
    end

    context "when deletion fails" do
      it "sets an alert and redirects to bookings path" do
        booking = Booking.create! valid_attributes
        allow_any_instance_of(Booking).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: booking.to_param }
        expect(flash[:alert]).to eq('Failed to delete booking.')
        expect(response).to redirect_to(bookings_path)
      end
    end
  end
end
