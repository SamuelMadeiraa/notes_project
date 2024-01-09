class Note < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title, against: :title
  
  def self.march_notes
    where(completed: true, created_at: "2023-03-01".."2023-03-31")
  end
end
