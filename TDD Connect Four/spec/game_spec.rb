require './game'

describe Game do
  context ".initialize" do
    it "creates a Board and 2 Player instances" do
      expect(subject.board).to be_a(Board)
    end
  end

  context ".launch_turn" do
    after do
      subject.launch_turn
    end
    it "checks if there's a victory"
    it "checks if the game is over"
    it "launches a new turn if there's no victory nor defeat" do
      allow(subject).to receive(:victory?).and_return(false)
      allow(subject).to receive(:game_over?).and_return(false)
      expect(subject).to receive(:one_turn)
    end

    it "exits the game in case of victory" do
      allow(subject).to receive(:victory?).and_return(true)
      expect(subject).to receive(:exit_now)
    end

    it "exits the game in case of a defeat" do
      allow(subject).to receive(:game_over?).and_return(true)
      expect(subject).to receive(:exit_now)
    end
  end

  context ".victory?" do
    before do
      @board = double
      subject.board = @board
      allow(@board).to receive(:victory_conditions?).and_return(true)
      allow(Ui).to receive(:victory_message)
    end

    after do
      subject.victory?
    end

    it "displays a victory message in case of victory" do
      expect(Ui).to receive(:victory_message)
    end

    it "doesn't display any message if there's any victory" do
      allow(@board).to receive(:victory_conditions?).and_return(false)
      expect(Ui).not_to receive(:victory_message)
    end
  end

  context ".game_over?" do
    it "displays a game- over-message if the board is full and no one wins" do
      board = double
      allow(board).to receive(:board_full?).and_return(true)
      subject.board = board
      ui = double
      subject.ui = ui
      expect(ui).to receive(:game_over_message)
      subject.game_over?
    end
  end
end
