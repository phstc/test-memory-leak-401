This is a test project for the memory leak problem @nickooolas and I are debugging. See [#401](https://github.com/phstc/shoryuken/issues/401).

## Running

Make sure to export AWS creds, also with permissions for creating a queue name `test`.


```shell
git clone git@github.com:phstc/test-memory-leak-401.git

cd test-memory-leak-401

./start.sh
```

`start.sh` will start a Shoryuken process with concurrency 5 and delay 5, same as reported in [here](https://github.com/phstc/shoryuken/issues/401#issuecomment-313974460)

The test worker will keep enqueuing back a single message delaying up to 5 minutes `rand(1..300)`.

For increasing the queue activity `bundle exec ./enqueue.rb 1000`, this will enqueue 1000 messages. These messages won't be enqueued back.
