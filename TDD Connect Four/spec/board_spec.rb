require './board'

describe Board do

  context ".valid?" do
    it "checks if a position is valid" do
      expect(subject.valid?(1)).to be_truthy
    end

    it "checks if a position is not valid" do
      expect(subject.valid?(8)).to be_falsey
    end
  end

  context ".play" do

    before do
      #@symbol = ☗
      #@position = "A"
    end
  end

  context "victory?" do
    it "returns false if there's no victory" do
      expect(subject.victory?).to be nil
    end

    it "returns the winning symbol in case of victory" do
      subject.play(1, 'X')
      subject.play(2, 'X')
      subject.play(2, 'X')
      subject.play(3, 'X')
      subject.play(3, 'X')
      subject.play(3, 'X')
      subject.play(4, 'O')
      subject.play(4, 'X')
      subject.play(4, 'X')
      subject.play(4, 'X')
      expect(subject.victory?).to eql('X')
    end


  end

end
