task :test do
  puts %x( bundle exec ruby test/get_request_test.rb )
  puts %x( bundle exec ruby test/head_request_test.rb )
  puts %x( bundle exec ruby test/post_request_test.rb )
  puts %x( bundle exec ruby test/put_request_test.rb )
  puts %x( bundle exec ruby test/delete_request_test.rb )
end

task :default => [:test]
