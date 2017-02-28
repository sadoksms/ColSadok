module DevicesHelper
    def get_device_index_of(id)
    @devices.first { |dev| dev.id == id }.CodeIso
    end 
end
