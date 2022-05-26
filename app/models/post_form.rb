class PostForm
  include ActiveModel::Model

  attr_accessor(
    :id, :school_list, :course, :unit, :introduction, :introduction_time, :development, :development_time, :summary, :summary_time,
    :user_id, :created_at, :updated_at, :images,
    :id, :name, :record_type, :record_id, :blob_id, :created_at
  )

  with_options presence: true do
    validates :school_list
    validates :course
    validates :unit
    validates :introduction, length: { maximum: 300 }
    validates :development,  length: { maximum: 1000 }
    validates :summary,      length: { maximum: 300 }
  end

  validates :images, length: { maximum: 6, message: 'は6枚以下にしてください' }
  
  with_options numericality: { only_integer: true, less_than_or_equal_to: 50 } do
    validates :introduction_time
    validates :development_time
    validates :summary_time
  end
end