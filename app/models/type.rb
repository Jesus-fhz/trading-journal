class Type < ApplicationRecord
    has_many :trades, :dependent => :restrict_with_error
end 
