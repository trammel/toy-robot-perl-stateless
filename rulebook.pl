use FreezeThaw qw(freeze);

my $max = 4;
my $rulebook = {
  'PLACE' => [
    map {
      my $x = $_;
      [
        map { 
          my $y = $_;
          { 'EAST' => [$x, $y, 'EAST'], 'SOUTH' => [$x, $y, 'SOUTH'], 'WEST' => [$x, $y, 'WEST'], 'NORTH' => [$x, $y, 'NORTH'] }
        } (0..$max)
      ]
    } (0..$max)
  ],
  'MOVE' => [
    map {
      my $x = $_;
      [
        map { 
          my $y = $_;
          { 'NORTH' => [$x, $y + 1 > $max ? $max : $y + 1, 'NORTH'], 'WEST' => [$x - 1 < 0 ? 0 : $x - 1, $y, 'WEST'], 'SOUTH' => [$x, $y - 1 < 0 ? 0 : $y - 1, 'SOUTH'], 'EAST' => [$x + 1 > $max ? $max : $x + 1, $y, 'EAST'] }
        } (0..$max)
      ]
    } (0..$max)
  ],
  'LEFT' => [
    map {
      my $x = $_;
      [
        map { 
          my $y = $_;
          { 'EAST' => [$x, $y, 'NORTH'], 'SOUTH' => [$x, $y, 'EAST'], 'WEST' => [$x, $y, 'SOUTH'], 'NORTH' => [$x, $y, 'WEST'] }
        } (0..$max)
      ]
    } (0..$max)
  ],
  'RIGHT' => [
    map {
      my $x = $_;
      [
        map { 
          my $y = $_;
          { 'EAST' => [$x, $y, 'SOUTH'], 'SOUTH' => [$x, $y, 'WEST'], 'WEST' => [$x, $y, 'NORTH'], 'NORTH' => [$x, $y, 'EAST'] }
        } (0..$max)
      ]
    } (0..$max)
  ],
};

print freeze($rulebook);


