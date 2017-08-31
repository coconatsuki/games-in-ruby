require './game'

describe Game do
  context ".victory?" do
    before do
      board = double
      allow(board).to receive(:victory_conditions).and_return(true)
      allow(board).to receive(:display)
      subject.board = board

      @player = double
      allow(@player).to receive(:victory_message)
      allow(@player).to receive(:symbol)

      allow(subject).to receive(:exit_now)
    end

    it "display a victory message in case of a victory" do
      expect(@player).to receive(:victory_message)
      subject.victory?(@player)
    end

    it "exits the game in case of a victory" do
      expect(subject).to receive(:exit_now)
      subject.victory?(@player)
    end
  end

  context ".one_turn" do
    before do
      @board = double
      allow(@board).to receive(:display)
      allow(@board).to receive(:ask_for_next_position)
      subject.board = @board

      @player = double
      allow(@player).to receive(:choose_box_message)
      allow(@player).to receive(:symbol).and_return('X')

      allow(subject).to receive(:victory?)
    end

    after do
      subject.one_turn(@player)
    end

    it "displays the board" do
      expect(@board).to receive(:display)
    end

    it "asks the player to choose a box" do
      expect(@player).to receive(:choose_box_message)
    end

    it "asks for the next position" do
      expect(@board).to receive(:ask_for_next_position).with('X')
    end

    it "checks for a victory" do
      expect(subject).to receive(:victory?).with(@player)
    end
  end
end
