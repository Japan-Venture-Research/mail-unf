require 'mail'

module Mail
  class Message
    def process_body_raw_with_unf
      unless @body_raw.encoding.to_s.upcase == 'ASCII-8BIT'
        @body_raw = @body_raw.to_s.to_nfc
      end
      process_body_raw_without_unf
    end
    alias_method :process_body_raw_without_unf, :process_body_raw
    alias_method :process_body_raw, :process_body_raw_with_unf
  end
end
