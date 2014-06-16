require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("Moe", @initial_health)

    @game.add_player(@player)
  end

  it "computes total points as a sum of all player points" do
    game = Game.new("Knuckleheads")

    player1 = Player.new("moe")
    player2 = Player.new("larry")

    game.add_player(player1)
    game.add_player(player2)

    player1.add_treasure(Treasure.new(:hammer, 50))
    player1.add_treasure(Treasure.new(:hammer, 50))
    player2.add_treasure(Treasure.new(:crowbar, 400))

    expect(game.total_points).to eq(500)

  end

  it "w00ts the player if a high number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)

    @game.play(2)

    expect(@player.health).to eq(@initial_health + 15*2)
  end

  it "doesn't change the players score for a medium roll" do
    Die.any_instance.stub(:roll).and_return(3)

    @game.play(3)

    expect(@player.health).to eq(@initial_health)
  end

  it "blams a player if a low number is rolled" do
    Die.any_instance.stub(:roll).and_return(2)

    @game.play(2)

    expect(@player.health).to eq(@initial_health - 10*2)
  end


end