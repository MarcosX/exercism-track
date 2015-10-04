# Raindrops

Write a program that converts a number to a string, the contents of which depends on the number's prime factors.

- If the number contains 3 as a prime factor, output 'Pling'.
- If the number contains 5 as a prime factor, output 'Plang'.
- If the number contains 7 as a prime factor, output 'Plong'.
- If the number does not contain 3, 5, or 7 as a prime factor,
  just pass the number's digits straight through.

## Examples

- 28's prime-factorization is 2, 2, 7.
  - In raindrop-speak, this would be a simple "Plong".
- 1755 prime-factorization is 3, 3, 3, 5, 13.
  - In raindrop-speak, this would be a "PlingPlang".
- The prime factors of 34 are 2 and 17.
  - Raindrop-speak doesn't know what to make of that,
    so it just goes with the straightforward "34".

## Setup

Go through the setup instructions for PL/SQL to get ready to code:

http://help.exercism.io/getting-started-with-plsql.html

## Running the Tests

Execute the tests by calling the `run` method in the respective `ut_<exercise>#` package.
The necessary code should be contained at the end of the test package.
As an example, the test for the _hamming_ exercise would be run using

```
begin
  ut_hamming#.run;
end;
/
```

## Source

A variation on a famous interview question intended to weed out potential candidates. [view source](http://jumpstartlab.com)
