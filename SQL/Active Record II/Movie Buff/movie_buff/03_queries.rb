def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  Movie
  .joins(:actors)
  .select("movies.id,movies.title")
  .where({actors:{name:those_actors}})
  .group("movies.id")
  .having("COUNT(movies.id) > 1")

end

def golden_age
  # Find the decade with the highest average movie score.

  Movie
    .select("(movies.yr/10)*10 AS decade")
    .group("decade")
    .order("AVG(movies.score) DESC")
    .first
    .decade
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

  Actor
    .joins(:movies)
    .select("actors.name")
    .distinct
    .where("movies.title IN (?)",
      Movie
        .joins(:actors)
        .where("actors.name = ?",name)
        .pluck(:title)
)
.where("actors.name NOT IN (?)",name)
.pluck(:name)
# .select { |ele| ele != name }


end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .left_outer_joins(:movies)
    .select("movies.*,actors.*")
    .where("movies.id IS NULL")
    .count(:id)
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

  pre_processed = whazzername.split("").join("%")
  pre_processed = "%" + pre_processed + "%"

  Movie
    .joins(:actors)
    .where("LOWER(actors.name) LIKE ?",pre_processed)

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.


  Actor
    .joins(:movies)
    .select("actors.id,actors.name,MAX(movies.yr) - MIN(movies.yr) AS career")
    .group("actors.id")
    .order("MAX(movies.yr) - MIN(movies.yr) DESC")
    .limit(3)
end
