require "bboxer/version"

require "benchmark"
require "capybara"
require "capybara/dsl"
require "capybara/poltergeist"

module Bboxer
  class << self
    include Capybara::DSL

    Capybara.run_server = false
    Capybara.current_driver = :poltergeist
    Capybara.javascript_driver = :poltergeist
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, {
        js_errors: true,
        timeout: 60
      })
    end

    JAVASCRIPTS = File.read("javascripts/bboxer.js")

    def run(args)
      args.each do |arg|
        process_path(arg)
      end
    end

    def process_path(path)
      expanded_path = File.expand_path(path)
      if File.directory?(expanded_path)
        Dir.entries(expanded_path).each do |entry_name|
          next if %w(. ..).include?(entry_name)
          entry_path = File.join(path, entry_name)
          process_path(entry_path)
        end
      elsif File.exists?(expanded_path)
        if path.end_with?(".svg")
          puts "Processing: #{path}"
          output_path = expanded_path.sub(/\.svg$/, "-updated.svg")

          time = Benchmark.measure do
            document = process_file(expanded_path)
            File.open(output_path, "w") { |f| f.write(document) }
          end

          puts "Finished in #{time.real.round(3)}ms"
          puts "Output written to #{output_path}"
        else
          puts "Ignoring file: #{expanded_path}"
        end
      else
        puts "No such file or directory: #{expanded_path}"
      end
    end

    def process_file(path)
      page.visit(path)
      # page.save_screenshot("pre.png", { full: true })
      # inject scripts into page and run
      page.execute_script(JAVASCRIPTS)
      # page.save_screenshot("post.png", { full: true })

      return page.body
    end
  end
end
