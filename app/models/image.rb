class Image < ApplicationRecord
	belongs_to :user 

	has_attached_file :image, 
	styles: {thumb: "900x900#"},
    :path => ":rails_root/public/images/:id/:style/:filename",
    :url  => "/images/:id/:style/:filename"




  	do_not_validate_attachment_file_type :image

end
