package Date::Christmas;

use strict;
use integer;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw(christmasday);
$VERSION = '1.00';

sub christmasday {           
   my $y = shift;  
   my $dow=(50 + $y%100 + $y/400 + ($y%100)/4 - 2*($y/100))%7;
   my @xdays = @_ ? @_ : qw:Sunday Monday Tuesday Wednesday Thursday Friday Saturday:;
   return $xdays[$dow];
}

1;
__END__

=head1 NAME

Date::Christmas - Calculates the day of the week Christmas falls upon given the year.

=head1 SYNOPSIS

=over 4

=item * 

Getting the Christmas Day of the Week in English.

  use Date::Christmas qw(christmasday);
 
  my $year = "2010"; 
  my $dow = christmasday $year;
  print "Christmas day falls on $dow in the year $year\n";

  -or-

  perl -MDate::Christmas -le 'print christmasday (2010)';

=item * 

Getting the Christmas Day of the Week in any other language.
  
  use Date::Christmas qw(christmasday);

  my $year = 2004;
  $xmasdow = christmasday ($year, qw:sunnuntai maanantai tiistai keskiviikko torstai perjantai lauantai:);
  print "Christmas is on $xmasdow in the year $year\n";

  -or-

  perl -MDate::Christmas -le 'print christmasday (2000, qw:Sonntag Montag Dienstag Mittwoche Donnerstag Freitag Sonnabend:)'

=back

=head1 DESCRIPTION

Date::Christmas calculates the day of the week that Christmas will 
fall upon in any given year after the year 1600AD, including leap years. 
The algorithm is based on "The Formula for Christmas Day" on pages 261-262 
in the book _The Physics of Christmas_ by Roger Highfield. 

It is a module for people who like to plan ahead for their Christmas 
Holiday or for those who have festive scripts and just need the day that
Christmas falls upon without wanting to use Date::Manip or Date::Calc.

=head1 AUTHOR

HFB, hfb@cpan.org

=head1 SEE ALSO

perl(1), Date::Calc, Date::Manip.

=cut
