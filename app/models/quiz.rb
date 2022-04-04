class Quiz < ApplicationRecord
  enum category: { easy: 1, normal: 2, hard: 3 }
end
