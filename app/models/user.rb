class User < ApplicationRecord
  validates :email, presence: true, length: {maximum: 60}, email: true
  validates :fax_number, presence: true, length: {maximum: 60}, phone: {possible: true}

  before_save :format_fax_number

  private

    def format_fax_number
      self.fax_number = Phonelib.parse(fax_number).e164
    end
end
