require('pg')
require_relative('artist.rb')
require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id
  attr_writer :name, :genre

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE albums SET (name, genre, artist_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@name, @genre, @artist_id]
    SqlRunner.run(sql, values)
  end
  def artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    artist_hash = SqlRunner.run(sql, values)[0]
    return Artist.new(artist_hash)
  end

end
