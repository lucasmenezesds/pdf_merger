# frozen_string_literal: true

require_relative 'pdf_merger/core'
require_relative 'pdf_merger/file_manager'
require_relative 'pdf_merger/version'

module PdfMerger
  def self.root
    File.expand_path('..', __dir__)
  end

  class Error < StandardError; end

  class Merger
    def initialize
      @input_path = File.join(PdfMerger.root, 'data/input')
      @output_path = File.join(PdfMerger.root, 'data/output')
    end

    def run(output_filename = 'merged_document', opts: {})
      file_manager = PdfMerger::FileManager.new(@input_path)
      files_to_merge = file_manager.files_in_directory(@input_path)
      pdf_merger = PdfMerger::Core.new(@output_path, output_filename, opts:)

      pdf_merger.merge_documents(files_to_merge)
    end
  end
end
