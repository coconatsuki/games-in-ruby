require './board'

describe Board do
  context ".initialize" do
        it "returns an empty hash" do
          subject.boxes = {}
        end
  end

  context ".victory_conditions" do
    it "returns true if there are 3 crosses in a row" do
      subject.boxes = { 'a1' => ' X ', 'b1' => ' X ', 'c1' => ' X '}
      expect(subject.victory_conditions('X')).to be true
    end

    it "returns true if there are 3 crosses in a column" do
      subject.boxes = { 'a1' => ' X ', 'a2' => ' X ', 'a3' => ' X '}
      expect(subject.victory_conditions('X')).to be true
    end

    it "returns true if there are 3 crosses in a diagonal" do
      subject.boxes = { 'a1' => ' X ', 'b2' => ' X ', 'c3' => ' X '}
      expect(subject.victory_conditions('X')).to be true
    end

    it "returns false if there are different symbols in a row" do
      subject.boxes = { 'a1' => ' X ', 'b1' => ' O ', 'c1' => ' X '}
      expect(subject.victory_conditions('X')).to be false
    end

    it "returns true if there are weird symbols in a row" do
      subject.boxes = { 'a1' => ' A ', 'b1' => ' A ', 'c1' => ' A '}
      expect(subject.victory_conditions('A')).to be true
    end
  end
  context ".play" do
    it "adds a random symbol in a box" do
      subject.play('S', 'a1')
      expect(subject.boxes['a1']).to eql(' S ')
    end
  end

  context ".boxes" do
    it "checks that an empty box returns 3 spaces" do
      expect(subject.boxes['a1']).to eql('   ')
    end
  end

  context ".valid?" do
    it "checks that a position is valid" do
      expect(subject.valid?('b3')).to be_truthy
    end

    it "checks that a position isn't valid" do
      expect(subject.valid?('m8')).to be_falsey
    end

    it "checks that a position isn't valid" do
      expect(subject.valid?('m8')).to be_falsey
    end
  end

  context ".available" do
    it "returns true if a box is empty" do
      expect(subject.available?('a1')).to be true
    end

    it "returns false if a box already contains a symbol" do
      subject.boxes['a1'] = ' X '
      expect(subject.available?('a1')).to be false
    end
  end
end
