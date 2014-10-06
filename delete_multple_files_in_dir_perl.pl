my $dir = $ARGV[0];
opendir(DIR,$dir) || die "Can't open $dir : $!\n";
my @files = readdir(DIR); 
close(DIR);

foreach my $file(@files)
{
my $now = time;
my @stat = stat("$dir/$file");
if ($stat[9] < ($now - 86400))
{
print "Deleting $dir/$file...";
unlink("$dir/$file");
print "Done.\n";
	}
}
