class Quote < ApplicationRecord
  validates :saying, presence: true, length: { maximum: 140, minimum: 3 }
  validate :is_Yoda?

  def is_Yoda?
    if author != "Yoda"
      errors.add(:author, "<strong>Author Must Be Yoda!</strong>")
    end
  end

end
