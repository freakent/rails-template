class UserSession
    include ActiveModel::Model

    attr_accessor :email, :password
    validates :email, :password, presence: true

    def persisted?
        false
    end

end