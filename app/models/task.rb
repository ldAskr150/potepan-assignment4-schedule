class Task < ApplicationRecord
    # バリデーションを設定
    validates :title, presence: true
    validates :start, presence: true
    validates :finish, presence: true
    validates :description, length: { maximum: 500 }
end
