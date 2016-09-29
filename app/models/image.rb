class Image < ApplicationRecord
	belongs_to :user 

	has_attached_file :image, 
	styles: {thumb: "100x100#", small: "150x150", medium: "200x200", large: "400x400"},
    :path => ":rails_root/public/images/:id/:style/:filename",
    :url  => "/images/:id/:style/:filename"




  	do_not_validate_attachment_file_type :image

end
