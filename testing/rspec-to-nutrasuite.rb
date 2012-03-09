#!/usr/bin/env ruby
#
# Does most of the work required to convert RSpec tests to use MiniTest
# and Nutrasuite.
#
# Usage: rspec-to-nutrasuite.rb < spec/thing_spec.rb > test/thing_test.rb

def convert_require_statements(line)
  line.sub /^(require.*)(spec)/, '\1test'
end

def convert_top_level_describe_to_class(line)
  if line =~ /^describe (["'](.+)["']|(\w+)) do/
    testable = ($2.to_s + $3.to_s).split.map { |word| word.capitalize }.join
    "class #{testable}Test < MiniTest::Unit::TestCase"
  else
    line
  end
end

def convert_nested_describe(line)
  line.sub /^(\s+)describe/, '\1the'
end

def convert_before_and_after(line)
  line.sub /(before|after)[(\s]+:each\)?/, '\1'
end

def convert_should_double_equals(line)
  line.sub /^(\s+)(.*)\.should == (.*)/, '\1assert_equal \3, \2'
end

def convert_should_be_something(line)
  line.sub /^(\s+)(.*)\.should be_(.*)/, %q{\1assert \2.\3?, 'should be \3'}
end

def convert_have_matcher(line)
  line.sub /^(\s+)(.*)\.should have\((\d+)\).*/, '\1assert_equal \3, \2.size'
end

ARGF.each_line do |line|
  puts [
    :convert_require_statements,
    :convert_top_level_describe_to_class,
    :convert_nested_describe,
    :convert_before_and_after,
    :convert_should_double_equals,
    :convert_should_be_something,
    :convert_have_matcher
  ].inject(line) { |line, method| send(method, line) }
end

