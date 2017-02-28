class Device < ActiveRecord::Base
    
    has_many :projets
    validates_presence_of :Nom
end
