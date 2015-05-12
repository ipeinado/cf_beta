class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
    presence: true,
    uniqueness: {
        case_sensitive: false
    }



  def self.find_for_database_authentication(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
          where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
  	else
      conditions[:email].downcase! if conditions[:email]
  		where(conditions).first
  	end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

end
