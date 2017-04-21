class Template < ApplicationRecord
  belongs_to :type
  has_many :documents
end
