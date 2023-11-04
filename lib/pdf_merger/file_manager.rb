# frozen_string_literal: true

module PdfMerger
  class FileManager
    IGNORED_ENTRIES = %w[. .. .gitkeep].freeze

    def initialize(input_path)
      @input_path = input_path
    end

    def files_in_directory(full_path = nil)
      entries = Dir.entries(@input_path).reject { |entry| IGNORED_ENTRIES.include?(entry) }

      if full_path.nil?
        entries
      else
        entries.map do |entry|
          File.join(full_path, entry)
        end
      end
    end
  end
end
