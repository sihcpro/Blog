class Tag < ApplicationRecord
  validates :tagname, uniqueness: { case_sensitive: false }
end
