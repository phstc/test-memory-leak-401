#!/usr/bin/env bash

bundle exec shoryuken sqs create test

bundle exec ./enqueue.rb 1 1

bundle exec shoryuken -q test -r ./test.rb -c 5 -D 5 -L shoryuken.log -P shoryuken.pid -d

echo "Shoryuken is running $(cat shoryuken.pid)"
echo "For logging: tail -f shoryuken.log"
echo "For process monitoring: top -pid $(cat shoryuken.pid)"
echo "For shutting down: kill -9 $(cat shoryuken.pid)"
