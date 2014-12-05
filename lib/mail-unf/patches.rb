require 'mail'

module Mail
  class Message
    def process_body_raw_with_unf
      unless @body_raw.encoding.to_s.downcase == 'ascii-8bit'
        @body_raw = @body_raw.to_s.to_nfc
      end
      process_body_raw_without_unf
    end
    alias_method :process_body_raw_without_unf, :process_body_raw
    alias_method :process_body_raw, :process_body_raw_with_unf
  end

  module FieldWithUnf
    ENCODINGS = %w(utf-8 iso-2022-jp)

    def self.included(base)
      base.send :alias_method, :initialize_without_unf, :initialize
      base.send :alias_method, :initialize, :initialize_with_unf
    end

    def initialize_with_unf(value = nil, charset = 'utf-8')
      if ENCODINGS.include? charset.to_s.downcase
        if value.kind_of?(Array)
          value = value.map { |e| convert_with_unf(e, charset) }
        else
          value = convert_with_unf(value, charset)
        end
      end
      initialize_without_unf(value, charset)
    end

    private

    def convert_with_unf value, charset
      if ENCODINGS.include? charset.to_s.downcase
        value = value.to_s.to_nfc
      end
      value
    end
  end

  class SubjectField < UnstructuredField
    include FieldWithUnf
  end

  class FromField < StructuredField
    include FieldWithUnf
  end

  class SenderField < StructuredField
    include FieldWithUnf
  end

  class ToField < StructuredField
    include FieldWithUnf
  end
end
