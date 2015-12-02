class Problem < ActiveRecord::Base

  before_save :set_status
  validates :title, :description, :picture, presence: true

  private
    def set_status
      self.status = 'sedang dikerjakan'
    end

end
