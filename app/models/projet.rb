class Projet < ActiveRecord::Base
    belongs_to :device
    has_attached_file :image, styles: { medium: "100x100>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates_presence_of :name
    validates_length_of :name, :maximum => 100
    validates_presence_of :objective
    validates_presence_of :device_id
end
