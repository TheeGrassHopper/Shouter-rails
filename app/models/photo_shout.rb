class PhotoShout < ApplicationRecord
	has_attached_file :image, style: { thumb: "200x200" }
end
