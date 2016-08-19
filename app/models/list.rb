class List < ActiveRecord::Base
    
    has_many :list_items
    belongs_to :user

    validates_presence_of :title

end
