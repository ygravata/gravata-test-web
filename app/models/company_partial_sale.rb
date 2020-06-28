class CompanyPartialSale < ApplicationRecord
  belongs_to :user
  has_many :sales, dependent: :destroy
  has_one_attached :dataset
end
