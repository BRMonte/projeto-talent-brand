class Note < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { minimum: 3 }

  validates :title, presence: true,
            length: { minimum: 3 },
            uniqueness: { message: "%{value} já existe" }

  scope :filter_by_content, -> (content) { where("content like ?", "#{content}%")}

  enum priority:   { 'Alta' => 1, 'Media' => 2, 'Baixa' => 3 }

  def self.search(search)
    if search
      note_by_content = Note.find_by(content: search)
      if note_by_content
        self.where(note_id: note_by_content)
        else
          Note.all
      end
    else
        Note.all
    end
  end

end
