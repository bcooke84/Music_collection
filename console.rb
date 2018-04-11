require_relative('models/artist.rb')
require_relative('models/albums.rb')
require('pry-byebug')
Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "the beta band"
  })
  artist1.save()
artist2 = Artist.new({
  "name" => "americian football"
  })
  artist2.save()
artist3 = Artist.new({
  "name" => "anchorsong"
  })
  artist3.save()
artist4 = Artist.new({
  "name" => "artic monkeys"
  })
  artist4.save()
  album1 = Album.new({
    "name" => "yellow",
    "genre" => "blue",
    "artist_id" => artist1.id
    })
    album1.save()
  album2 = Album.new({
    "name" => "red",
    "genre" => "dub step",
    "artist_id" => artist2.id
    })
    album2.save()
    album3 = Album.new({
      "name" => "green",
      "genre" => "indie",
      "artist_id" => artist3.id
      })
      album3.save()
    album4 = Album.new({
      "name" => "black",
      "genre" => "indie",
      "artist_id" => artist3.id
    })
    album4.save()
binding.pry

nil
