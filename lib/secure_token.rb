# encoding: utf-8

require 'securerandom'

module SecureToken
  class EncryptorBlankError < StandardError
    def initialize
      super 'Encryptor is blank'
    end
   end

  class << self
    def random_token(token_length = 32)
      SecureRandom.hex(token_length.to_i / 2)
    end

    def encrypt(raw, encryptor = :sha256)
      raw = raw.to_s + Settings.salt

      case encryptor
      when :sha256
        Digest::SHA256.hexdigest(raw)
      when :sha1
        Digest::SHA1.hexdigest(raw)
      when :md5
        Digest::MD5.hexdigest(raw)
      else
        raise EncryptorBlankError
      end
    end

    def simple_sign(raw, range = 5..8)
      Digest::MD5.hexdigest(raw.to_s)[range]
    end

    def decrypt(mixed)
    end
  end
end
