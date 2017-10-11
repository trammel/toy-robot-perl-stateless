#!/usr/bin/perl -w
use Test::More qw(no_plan);
use FindBin qw($Bin);

for my $test (
  {
    'name' => 'Example a',
    'input' => '
PLACE 0,0,NORTH
MOVE
REPORT
',
    'expect' => '0,1,NORTH',
  },
  {
    'name' => 'Example b',
    'input' => '
PLACE 0,0,NORTH
LEFT
REPORT
',
    'expect' => '0,0,WEST',
  },
  {
    'name' => 'Example c',
    'input' => '
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
',
    'expect' => '3,3,NORTH',
  },
  {
    'name' => 'No reporting before place',
    'input' => '
REPORT
PLACE 1,2,EAST
',
    'expect' => '',
  },
  {
    'name' => 'Reporting twice',
    'input' => '
PLACE 1,2,EAST
REPORT
REPORT
',
    'expect' => '1,2,EAST
1,2,EAST',
  },
  {
    'name' => "Doesn't move off the grid",
    'input' => '
PLACE 0,0,NORTH
REPORT
MOVE
REPORT
MOVE
REPORT
MOVE
REPORT
MOVE
REPORT
MOVE
REPORT
',
    'expect' => '0,0,NORTH
0,1,NORTH
0,2,NORTH
0,3,NORTH
0,4,NORTH
0,4,NORTH'
  },

) {
  my $result = `echo '$test->{input}' | perl $Bin/../toy-robot.pl`;
  chomp($result);
  is(
    $result,
    $test->{'expect'},
    "$test->{'name'} input and expected output matches.",
  );
}

