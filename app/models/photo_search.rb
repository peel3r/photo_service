class PhotoSearch

  include ActiveModel::Model

  SIZES = [350,800]
  CAMERAS = %w(f i r 4 5 6 7 8 9 10 11 12)
  BASE_URL = "http://vcache.arnoldclark.com/imageserver"

  attr_accessor :registration, :stock_ref

  validates :registration, presence: true, length: { minimum: 7 }, allow_blank: false
  validates :stock_ref, presence: true, length: { minimum: 9 }, allow_blank: false

  def initialize(registration = "" ,stock_ref = "")
    @stock_ref = stock_ref.strip.upcase.gsub(' ', '')
    @registration = registration.strip.upcase.gsub(' ', '')
  end

  def fetch_images(reference="")
    @images = []
    SIZES.each do |size|
      CAMERAS.each do |camera|
        @images << [BASE_URL, reference,size, camera].join('/')
      end
    end
    @images
  end


  def obfuscated_ref
    @reference = @stock_ref.chars.take(@registration.length).zip(@registration.reverse.chars).flatten.join << @stock_ref.chars[8]
  end
end