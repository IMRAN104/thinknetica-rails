class Train < ApplicationRecord
  belongs_to :route, optional: true
end
