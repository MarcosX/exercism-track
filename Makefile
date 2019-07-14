#test-clojure:
#	ls -d clojure/* | xargs -L 1 -I folder bash -c 'cd folder && lein test'

#test-crystal:
#	ls -d crystal/* | xargs -L 1 -I folder bash -c 'cd folder && crystal spec'

test-python:
	pip install --no-cache-dir -r python/requirements.txt &&\
  pytest python/**/*_test.py &&\
	ls python/**/*.py | grep -v _test.py | xargs pylint

test-elixir:
	ls -d elixir/* | xargs -L 1 -I folder bash -c 'cd folder && elixir *_test.exs'

test-ruby:
	ls -d ruby/* | xargs -L 1 -I folder bash -c 'cd folder && ruby *_test.rb'

#test-javascript:
#	jasmine-node javascript/**/*.spec.js
