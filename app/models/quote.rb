class Quote < ApplicationRecord
  # prevent any new quote from being saved without a saying and an author
  # make sure the saying is between 3 and 140 characters long and author is between 3 and 50 char long
  validates :saying, presence: true, length: { maximum: 140, minimum: 3 }
  validates :author, presence: true, length: { maximum: 50, minimum: 3 }

end
