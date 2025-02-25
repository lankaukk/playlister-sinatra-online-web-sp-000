class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        @slug = name.gsub(" ","-").downcase
      end
    
    def self.find_by_slug(slug)
        self.all.find {|t| t.slug == slug}
    end
  end