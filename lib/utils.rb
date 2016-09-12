module Utils
  class << self
    def urlsafe_base64_encode(content)
      Base64.encode64(content).strip.tr('+', '-').tr('/', '_').gsub(/\r?\n/, '')
    end

    def urlsafe_base64_decode(encoded_content)
      Base64.decode64 encoded_content.tr('_', '/').tr('-', '+')
    end
  end
end
