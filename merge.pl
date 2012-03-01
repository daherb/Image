use strict;
use warnings;
use List::Util qw(max);
use Image::Imlib2;

{
  my $i1 = Image::Imlib2->load("bild1.png");
  my $i2 = Image::Imlib2->load("bild1.png");
  my $image = Image::Imlib2->new(200, 200);
  $image->image_set_format("tiff");
  for (my $ct1=0;$ct1<200;$ct1++)
  {
    for (my $ct2=0;$ct2<200;$ct2++)
    {
      my ($r1,$g1,$b1,$a1)=$i1->query_pixel($ct1,$ct2);
      my ($r2,$g2,$b2,$a2)=$i2->query_pixel($ct1,$ct2);
      my $r=$r1+$r2;
      $r=255 if $r>255;
      my $g=$g1+$g2;
      $g=255 if $g>255;
      my $b=$b1+$b2;
      $b=255 if $b>255;
      my $maxi=max $r,$g,$b;
      $image->set_color($maxi,$maxi,$maxi,255);
      $image->draw_point($ct1,$ct2);
    }
  }
  $image->save("bild3.tif");
}
