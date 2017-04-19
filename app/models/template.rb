class Template < ApplicationRecord
  belongs_to :type
  has many :documents
end
