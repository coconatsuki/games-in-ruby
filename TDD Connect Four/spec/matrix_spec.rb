require './matrix'

describe Matrix do
  subject do
    Matrix.new(7, 6)
  end
  context ".boxes" do
    it "creates an Array of nils" do
      result = subject.boxes.flatten.all? { |el| el.nil? }
      expect(result).to be true
    end

    it "contains 6 rows and 7 columns" do
      expect(subject.boxes.count).to eql(7)
      expect(subject.boxes.flatten.count).to eql(42)
    end
  end

  context ".[]=" do
    it "insert a value in a box" do
      subject[1, 2] = 8
      expect(subject.boxes[1][2]).to eql(8)
    end
    it "raises an error if outside of the matrix" do
      expect { subject[-1, 2] = 8 }.to raise_error(RuntimeError)
      expect { subject[1, 9] = 8 }.to raise_error(RuntimeError)
    end
  end

  context ".[]" do
    it "reads a box" do
      subject[1, 2] = 8
      expect(subject[1, 2]).to eql(8)
    end
    it "raises an error if outside of the matrix" do
      expect { subject[-1, 2] }.to raise_error(RuntimeError)
      expect { subject[1, 9] }.to raise_error(RuntimeError)
    end
  end

  context ".col" do
    it "returns a column" do
      subject[1, 2] = 8
      expect(subject.col(1)).to eql([nil, nil, 8, nil, nil, nil])
    end
  end

  context ".row" do
    it "returns a row" do
      subject[1, 2] = 8
      expect(subject.row(2)).to eql([nil, 8, nil, nil, nil, nil, nil])
    end
  end

  context ".diag_x" do
    it "returns a diag_r" do
      subject[4, 1] = 8
      expect(subject.diag_r(3)).to eql([nil, 8, nil, nil])
    end
    it "returns a diag_l" do
      subject[4, 1] = 8
      expect(subject.diag_l(5)).to eql([nil, 8, nil, nil, nil, nil])
    end
  end

  context ".cols" do
    it "returns all columns" do
      expect(subject.cols).to eql(subject.boxes)
    end
  end

  context ".rows" do
    it "returns all rows" do
      expect(subject.rows).to eql(Matrix.new(6, 7).boxes)
    end
  end

  context ".diags" do
    it "returns all diagonals" do
      expect(subject).to receive(:diag_l).exactly(7).times
      expect(subject).to receive(:diag_r).exactly(7).times
      expect(subject.diags.size).to eql(14)
    end
  end


  context ".available?" do
    it "returns true if there's an empty box in a column" do
      expect(subject.available?(1)).to be true
    end

    it "returns false if there's no empty box in a column" do
      6.times { |i| subject[1, i] = 'X' }
      expect(subject.available?(1)).to be false
    end
  end

  context ".play" do
    it "checks if a position is nil" do
      expect(subject.boxes[0][1]).to be_falsey
    end

    it "adds a symbol if the lowest row is nil" do
      subject.play(1, 'X')
      expect(subject.boxes[0][0]).to eql('X')
    end

    it "adds a symbol to a column with 2 elements inside" do
      subject.boxes[0][0] = 'X'
      subject.boxes[0][1] = 'X'
      subject.play(1, 'X')
      expect(subject.boxes[0][2]).to eql('X')
    end
  end
end
