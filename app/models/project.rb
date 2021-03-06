class Project < ApplicationRecord
  validates :name, :amount, presence: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :internalprojects
  has_many :coursemodules, through: 'internalprojects'
  scope :users_projects, lambda {
    order(
      created_at: :desc
    ).includes(
      :internalprojects,
      :coursemodules
    )
  }
end
