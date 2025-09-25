describe HighwireShrimper::IRC::Types::Key do
  describe '#valid' do
    it 'accepts a valid key' do
      expect do
        Key 'a' * 23
      end.not_to raise_error
    end

    it 'rejects an invalid key' do
      expect do
        Key 'a' * 24
      end.to raise_error HighwireShrimper::IRC::Types::InvalidFormatError
    end
  end
end
