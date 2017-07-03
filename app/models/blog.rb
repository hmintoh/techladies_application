class Blog < ActiveRecord::Base
    #ensure there is content AND content is not blank
    validates :title, presence: true
    validates :content, presence: true
end
