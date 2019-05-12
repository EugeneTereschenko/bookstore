class Review < ApplicationRecord
  include AASM

  belongs_to :book
  belongs_to :user

  aasm column: 'state' do
    state :not_approved, initial: true
    state :approved
  end
end
