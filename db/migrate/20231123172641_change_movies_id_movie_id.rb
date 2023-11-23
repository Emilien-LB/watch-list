class ChangeMoviesIdMovieId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookmarks, :movies_id, :movie_id
  end
end
