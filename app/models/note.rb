class Note < ApplicationRecord

    def self.march_notes
        where(completed: true, created_at: "2023-03-01".."2023-03-31")
      end
end
