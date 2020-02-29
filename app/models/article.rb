class Article < ApplicationRecord
    belongs_to :user
    has_many :tickets 
    has_many :comments
    
    validates :name, length: { maximum: 50 }, presence: true
    validates :place, length: { maximum: 100}, presence: true
    validates :content, length: { maximum: 2000}, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validate :start_end_check
    
    default_scope -> { order(start_time: :desc) }
    
    def start_end_check
        errors.add(:end_date, "の日付を正しく記入してください。") unless
        self.start_time < self.end_time
    end
    #validates :start_time_should_be_before_end_time
    
    private
    
    def start_time_should_be_before_end_time
        return unless start_time && end_time
     
        if start_time >= end_time
            errors.add(:start_time, 'は終了時間よりも前に設定してください')
        end
    end
    attachment :image
end
    #attachment :image

