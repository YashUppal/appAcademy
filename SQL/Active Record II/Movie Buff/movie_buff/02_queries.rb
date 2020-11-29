def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.

  Movie
    .select("movies.id,movies.title,movies.yr,movies.score")
    .where("movies.yr IN (?) AND movies.score BETWEEN ? AND ?",(1980..1989),3,5)

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
    .where("movies.yr NOT IN (?)",Movie.select("yr").where("movies.score > 8"))
    .group("movies.yr")
    .pluck(:yr)

end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.

  Actor
    .joins(:movies)
    .where("movies.title = ?",title)
    .order("castings.ord")

end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.

  Movie
    .select("movies.id,movies.title,actors.name")
    .joins(:actors)
    .where("castings.ord = ? AND movies.director_id = actors.id",1)
    

end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

  Actor
    .joins(:castings)
    .select("actors.id,actors.name,COUNT(actors.id) AS roles")
    .where("castings.ord != ?",1)
    .group("actors.id")
    .order("COUNT(actors.id) DESC")
    .limit(2)

end
