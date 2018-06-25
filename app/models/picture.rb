class Picture < ApplicationRecord

    validates :artist, presence: true
    validates :title, length: { minimum: 3 }
    validates :title, length: { maximum: 20 }
    validates :url, presence: true
    validates :url, uniqueness: true

    def self.newest_first
      Picture.order("created_at DESC")
    end

    def self.most_recent_five
      Picture.newest_first.limit(5)
    end

    def self.last_month_pictures(time)
        Picture.where("created_at < ?", (time)).where("created_at > ?", (time - 1.month ))
    end

    def self.pictures_created_in_year(year)
        # year_begin = Date.new(year)
        # year_end = date.end_of_year

        Picture.where("created_at LIKE '%#{year}%' ")
    end

end
