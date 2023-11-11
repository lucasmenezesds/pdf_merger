# frozen_string_literal: true

require 'ruby-progressbar'

module PdfMerger
  class Progress
    def initialize(total, size: 80)
      bar_options = { format: '%a ~ %e |%P% Competed | Processed: %c from %C' }
      @progress_bar = ProgressBar.create(**bar_options,
                                         title: 'Merge Progress',
                                         starting_at: 0,
                                         length: size,
                                         total:)
    end

    def increment
      @progress_bar.increment
    end
  end
end
