class Section < ApplicationRecord
  belongs_to :article
  has_many :paragraphs
end


# class Document < ApplicationRecord
#   has_many :sections
#   has_many :paragraphs, through: :sections
# end

# class Section < ApplicationRecord
#   belongs_to :document
#   has_many :paragraphs
# end

# class Paragraph < ApplicationRecord
#   belongs_to :section
# end
