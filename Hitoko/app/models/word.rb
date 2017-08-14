class Word < ActiveRecord::Base
    validates :title, presence: true
    validates :content, presence: true,
                        length: {minimun: 1, maximum: 140}
end
