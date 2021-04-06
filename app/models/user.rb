class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    end

    return nil
  end
end
