module Flika
  class Photo

    def self.attr_reader(*attrs)
      mod = Module.new do
        attrs.each do |attribute|
          define_method attribute do
            @attrs[attribute.to_sym]
          end
          define_method "#{attribute}?" do
            !!@attrs[attribute.to_sym]
          end
        end
      end
      const_set(:Attributes, mod)
      include mod
    end

    attr_reader :id, :owner, :secret, :server, :farm, :title, :ispublic, :isfriend, :isfamily

    def initialize(attrs={})
      @attrs = attrs
    end
    def attrs
      @attrs
    end
    alias to_hash attrs

    def url(size='m')
      "http://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}_#{size}.jpg"
    end
  end
end
