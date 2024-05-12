class Diary < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy

  accepts_nested_attributes_for :videos, reject_if: :all_blank

  enum status: { draft: 0, published: 1, archived: 2 }

  after_initialize :set_default_status, if: :new_record?

  validate :at_least_one_video_or_content

  private

  def set_default_status
    self.status ||= :published
  end

  def at_least_one_video_or_content
    if content.blank? && videos.none?(&:valid?)
      errors.add(:base, "日記または動画のいずれか一方が必要です。")
    end
  end
end
