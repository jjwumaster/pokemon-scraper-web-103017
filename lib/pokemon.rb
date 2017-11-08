require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  # @@id = 0

  def initialize(name:, id:, type:, db:, hp:)
    binding.pry
    @name = name
    @id = id
    binding.pry
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES('#{name}', '#{type}');") #why does @id not work?
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = pokemon.id;")
    pokemon_object = Pokemon.new(name: new_pokemon[0][1], id: new_pokemon[0][0], type: new_pokemon[0][2], db:db, hp:new_pokemon[0][3])
    pokemon_object
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE pokemon.id = #{self.id}")
    @hp = new_hp
  end

end
