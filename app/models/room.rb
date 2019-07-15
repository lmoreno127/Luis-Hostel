class Room < ApplicationRecord
    has_many :bookings, dependent: :destroy
    mount_uploaders :image, RoomUploader
    serialize :image, JSON
    def find_booking(user)
      bookings.find_by(user_id: user.id)
    end
end
