# PdfMerger in Ruby

Just a simple PDF Merger in order to not upload any PDF with sensitive information to unknown servers/services.

## Usage

1. Update the settings if you'd like to:
    * Change the name of the merged PDF, change it's name inside `bin/run.rb` on the variable `output_filename`
    * Have a page with the document name added before the first page of each document that will be merged, change on the
      `options` variable. _The default is TRUE_
2. Add the PDFs you want to merge inside the folder: `data/input`
3. Run the project

**To run the project:**

1. From the root folder run the command:
    1. $ `bin/setup`
    2. $ `bin/run`

## Development

After checking out the repo, run `bin/setup` to install dependencies (_If you're using Debian based linux distros,
otherwise check the **Other O.S'** section_).

Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to
experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at project's repository. This project
is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CurrencyScrapper project's codebases, issue trackers, chat rooms and mailing lists is
expected to follow the code of conduct.
