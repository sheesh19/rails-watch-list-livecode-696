puts "Clearing db"
Movie.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"

movies = JSON.parse(URI.open(url).read)["results"]

movies.each do |movie|
    Movie.create!(
        title: movie["title"],
        overview: movie["overview"],
        rating: movie["vote_average"],
        poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
    )
end

puts "Created #{Movie.count} movie(s)"