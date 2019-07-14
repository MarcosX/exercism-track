test-clojure:
	echo "Running Clojure tests"
	ls -d clojure/* | xargs -L 1 -I folder bash -c 'cd folder && lein test'

test-crystal:
	echo "Running Crystal tests"
	ls -d crystal/* | xargs -L 1 -I folder bash -c 'cd folder && crystal spec'

test-python:
	echo "Running Python tests" &&\
  pip install --no-cache-dir -r python/requirements.txt &&\
  pytest python/**/*_test.py &&\
  ls python/**/*.py | grep -v _test.py | xargs pylint

test-elixir:
	echo "Running Elixir tests"
	ls -d elixir/* | xargs -L 1 -I folder bash -c 'cd folder && elixir *_test.exs'

test-ruby:
	echo "Running Ruby tests"
	ls -d ruby/* | xargs -L 1 -I folder bash -c 'cd folder && ruby *_test.rb'

test-javascript:
	echo "Running Javascript tests"
	jasmine-node javascript/**/*.spec.js

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

build:
	docker build -t marcosx/exercism.io .

check-in:
	make test &&\
		docker build -t marcosx/exercism.io . &&\
		docker push marcosx/exercism.io &&\
		git push origin master

build-push:
	docker build -t marcosx/exercism.io . &&\
		docker push marcosx/exercism.io

docker-test:
	docker run -v ~/exercism:/exercism -it marcosx/exercism.io
