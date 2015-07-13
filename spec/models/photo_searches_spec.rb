require 'rails_helper'

describe PhotoSearch do

  subject {described_class.new(stock_ref= '' ,registration= '')}


  context  'test validations' do
    it 'for registration ' do
      expect(subject.valid?).to eq false
      expect(subject.errors[:registration]).to eq(["can't be blank", "is too short (minimum is 7 characters)"])

    end
    it 'for stock_ref ' do
      expect(subject.valid?).to eq false
      expect(subject.errors[:stock_ref]).to eq(["can't be blank", "is too short (minimum is 9 characters)"])

    end

  end
  context 'it process the form with valid values' do
    it 'accepts registration value' do
      allow(subject).to receive(:registration) {'abc'}
      expect(subject.registration).to eq('abc')

    end
    it 'accepts stock_ref value' do
      allow(subject).to receive(:stock_ref) {'bb2-b'}
      expect(subject.stock_ref).to eq('bb2-b')

    end
  end

  describe '.obfuscated_stock_ref' do
    subject {described_class.new( stock_ref= ' arnfa-u-4633 ',registration= ' mk5 1fdd ')}

    it 'calculates reference' do
      expect(subject.obfuscated_ref).to eq('ADRDNFF1A5-KUM4')
    end

  end


  describe 'fetch images' do
    subject {described_class.new( registration= ' mk5 1fdd ', stock_ref= ' arnfa-u-4633 ')}
    it 'returns correct image set size' do
      expect(subject.fetch_images.size).to eq 24

    end
    it 'returns expected urls' do
      expect(subject.fetch_images('ADRDNFF1A5-KUM4')).to eq [
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/f',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/i',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/r',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/4',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/5',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/6',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/7',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/8',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/9',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/10',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/11',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/350/12',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/f',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/i',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/r',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/4',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/5',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/6',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/7',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/8',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/9',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/10',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/11',
                                                                    'http://vcache.arnoldclark.com/imageserver/ADRDNFF1A5-KUM4/800/12'
                                                                ]
    end
  end
end

