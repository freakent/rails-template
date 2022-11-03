class User < ApplicationRecord
  authenticates_with_sorcery!
  before_update :setup_activation, if: -> { email_changed? }
  after_update :send_activation_needed_email!, if: -> { previous_changes["email"].present? }

  enum :access_level, { user: 0, admin: 4, superuser: 9 }
  
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

end
