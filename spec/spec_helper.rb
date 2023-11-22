# frozen_string_literal: true
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  json_return = 
    {
      "kind": "civicinfo#representativeInfoResponse",
      "normalizedInput": {
        "locationName": "Sample Location",
        "line1": "123 Main Street",
        "city": "Sample City",
        "state": "SS",
        "zip": "12345"
      },
      "divisions": {
        "division_key_1": {"name": "Division Name 1", "alsoKnownAs": ["Alias 1", "Alias 2"], "officeIndices": [0, 1]},
        "division_key_2": {"name": "Division Name 2", "alsoKnownAs": ["Alias 3", "Alias 4"], "officeIndices": [2]}
      },
      "offices": [
        {"name": "Office Name 1", "divisionId": "division_key_1", "levels": ["Level 1"], "roles": ["Role 1", "Role 2"],
         "sources": [{"name": "Source 1", "official": true}], "officialIndices": [0, 1]},
        {"name": "Office Name 2", "divisionId": "division_key_1", "levels": ["Level 2"], "roles": ["Role 3"],
         "sources": [{"name": "Source 2", "official": false}], "officialIndices": [2]},
        {"name": "Office Name 3", "divisionId": "division_key_2", "levels": ["Level 3"], "roles": ["Role 4"],
         "sources": [{"name": "Source 3", "official": true}], "officialIndices": [3]}
      ],
      "officials": [
        {"name": "Official Name 1", "address": [{"locationName": "Official Location 1", "line1": "456 Oak Avenue",
                                                   "city": "Official City 1", "state": "OS1", "zip": "54321"}],
         "party": "Party 1", "phones": ["111-222-3333", "444-555-6666"], "urls": ["http://www.official1.com"],
         "photoUrl": "http://www.official1.com/photo.jpg", "emails": ["official1@example.com"],
         "channels": [{"type": "Twitter", "id": "@official1"}, {"type": "Facebook", "id": "official1"}]},
        {"name": "Official Name 2", "address": [{"locationName": "Official Location 2", "line1": "789 Maple Street",
                                                   "city": "Official City 2", "state": "OS2", "zip": "98765"}],
         "party": "Party 2", "phones": ["777-888-9999"], "urls": ["http://www.official2.com"],
         "photoUrl": "http://www.official2.com/photo.jpg", "emails": ["official2@example.com"],
         "channels": [{"type": "Instagram", "id": "official2"}]}
      ]
    }

    config.before(:each) do
      stub_request(:get, 'https://www.googleapis.com/civicinfo/v2/representatives').
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Faraday v1.8.0'}).
        to_return(status: 200, body: JSON.generate(json_return), headers: {})
    end
  end    
    

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # The settings below are suggested to provide a good initial experience
  # with RSpec, but feel free to customize to your heart's content.
  #   # This allows you to limit a spec run to individual examples or groups
  #   # you care about by tagging them with `:focus` metadata. When nothing
  #   # is tagged with `:focus`, all examples get run. RSpec also provides
  #   # aliases for `it`, `describe`, and `context` that include `:focus`
  #   # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  #   config.filter_run_when_matching :focus
  #
  #   # Allows RSpec to persist some state between runs in order to support
  #   # the `--only-failures` and `--next-failure` CLI options. We recommend
  #   # you configure your source control system to ignore this file.
  #   config.example_status_persistence_file_path = "spec/examples.txt"
  #
  #   # Limits the available syntax to the non-monkey patched syntax that is
  #   # recommended. For more details, see:
  #   #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  #   config.disable_monkey_patching!
  #
  #   # Many RSpec users commonly either run the entire suite or an individual
  #   # file, and it's useful to allow more verbose output when running an
  #   # individual spec file.
  #   if config.files_to_run.one?
  #     # Use the documentation formatter for detailed output,
  #     # unless a formatter has already been configured
  #     # (e.g. via a command-line flag).
  #     config.default_formatter = "doc"
  #   end
  #
  #   # Print the 10 slowest examples and example groups at the
  #   # end of the spec run, to help surface which specs are running
  #   # particularly slow.
  #   config.profile_examples = 10
  #
  #   # Run specs in random order to surface order dependencies. If you find an
  #   # order dependency and want to debug it, you can fix the order by providing
  #   # the seed, which is printed after each run.
  #   #     --seed 1234
  #   config.order = :random
  #
  #   # Seed global randomization in this process using the `--seed` CLI option.
  #   # Setting this allows you to use `--seed` to deterministically reproduce
  #   # test failures related to randomization by passing the same `--seed` value
  #   # as the one that triggered the failure.
  #   Kernel.srand config.seed
end
