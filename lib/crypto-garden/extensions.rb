class CryptoGarden
  module Extensions
    
    module String
      def mod26
        strip_non_ascii.mod26!
      end
      
      def mod26!
        chars.map { |char| mod26_cache[char] }
      end
      
      private

      def mod26_cache
        @md26_cache ||= Hash.new { |h,k| k.match(/^[a-z]$/i) ? h[k.upcase] = k.upcase.bytes.first % 65 : k }
      end
      
      def strip_non_ascii
        gsub(/[^a-z]/i, '')
      end
      
    end

    module Numeric
      def mod26
        (round.modulo(26) + 65).chr
      end
    end
    
  end
end

class String
  include CryptoGarden::Extensions::String
end

class Numeric
  include CryptoGarden::Extensions::Numeric
end