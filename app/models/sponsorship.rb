class Sponsorship < ActiveRecord::Base
  belongs_to :event
  belongs_to :sponsor, polymorphic: true
end
