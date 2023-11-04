# frozen_string_literal: true

require 'hexapdf'

module PdfMerger
  class Core
    def initialize(output_path, final_name, opts:)
      @doc = HexaPDF::Document.new
      @output_path = output_path
      @final_name = final_name
      @options = opts
    end

    def merge_documents(path_to_documents)
      path_to_documents.each do |current_filepath|
        filename = File.basename(current_filepath, '.*')
        pdf = HexaPDF::Document.open(current_filepath)

        first_page = pdf.pages.first

        add_title_page(filename, first_page) if @options[:append_title_page] == true
        pdf.pages.each { |page| @doc.pages << @doc.import(page) }
      end
      save_document
    rescue NoMethodError
      puts 'Something went wrong, please check if the input/output file paths are correct'
    end

    def save_document
      full_filepath = File.join(@output_path, "#{@final_name}.pdf")
      @doc.write(full_filepath)
    end

    def add_title_page(filename, first_page)
      width = first_page.box(:media).width
      height = first_page.box(:media).height
      orientation = width > height ? :landscape : :portrait

      title = filename.tr('_-', ' ')
      font_size = 32
      blank_page = @doc.pages.add([0, 0, width, height], orientation:)
      canvas = blank_page.canvas

      align_text_to_center_center(title, { width:, height:, font_size: }, canvas)
    end

    def align_text_to_center_center(text, document_properties, canvas)
      width = document_properties.fetch(:width)
      height = document_properties.fetch(:height)
      font = document_properties.fetch(:font, 'Helvetica')
      font_size = document_properties.fetch(:font_size, 32)
      x = 0
      y = height

      txt_fragment = HexaPDF::Layout::TextFragment.create(text, font: @doc.fonts.add(font), font_size:)
      txt_layouter = HexaPDF::Layout::TextLayouter.new

      txt_layouter.style.align(:center).valign(:center)
      txt_layouter.fit([txt_fragment], width, height).draw(canvas, x, y)
    end
  end
end
