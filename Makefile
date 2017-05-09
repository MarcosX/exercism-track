test-crystal:
	echo "Running Crystal tests"
	ls -d crystal/* | xargs -L 1 -I folder bash -c 'cd folder && crystal spec'

test-python:
	echo "Running Python tests"
	pytest python/**/*_test.py

test-elixir:
	echo "Running Elixir tests"
	ls -d elixir/* | xargs -L 1 -I folder bash -c 'cd folder && elixir *_test.exs'

test-ruby:
	echo "Running Ruby tests"
	ls -d ruby/* | xargs -L 1 -I folder bash -c 'cd folder && ruby *_test.rb'

test-javascript:
	echo "Running Javascript tests"
	jasmine-node javascript/**/*.spec.js

test-scala:
	echo "Running Scala tests"
	ls -d scala/* | xargs -L 1 -I folder bash -c 'cd folder && sbt test'

test:
	echo "Running Crystal tests" &&\
	ls -d crystal/* | xargs -L 1 -I folder bash -c 'cd folder && crystal spec' &&\
	echo "Running Python tests" &&\
	pytest python/**/*_test.py &&\
	echo "Running Elixir tests" &&\
	ls -d elixir/* | xargs -L 1 -I folder bash -c 'cd folder && elixir *_test.exs' &&\
	echo "Running Ruby tests" &&\
	ls -d ruby/* | xargs -L 1 -I folder bash -c 'cd folder && ruby *_test.rb' &&\
	echo "Running Javascript tests" &&\
	jasmine-node javascript/**/*.spec.js
