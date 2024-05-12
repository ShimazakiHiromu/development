class Video < ApplicationRecord
  belongs_to :diary

  validates :file_path, presence: true, unless: -> { all_blank? }
  validates :title, presence: true, unless: -> { all_blank? }
  validates :artist, presence: true, unless: -> { all_blank? }

  enum status: { practice: 0, completed: 1, daily: 2 }

  before_create :set_uploaded_at

  private

  def set_uploaded_at
    self.uploaded_at = Time.current
  end

  def all_blank?
    file_path.blank? && title.blank? && artist.blank?
  end
end