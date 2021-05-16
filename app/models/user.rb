class User < ApplicationRecord
    validates :username, uniqueness: true, allow_blank: true
    validates :email, presence: true, uniqueness: true, format: { with: %r{^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$}, message: "Email invalid", multiline: true }
    has_secure_password

    has_many :photos
    has_many :restaurants, through: :photos
end
