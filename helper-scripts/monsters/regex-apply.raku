use v6;

sub MAIN($dir, $find, $replace) {
    my @files = (dir $dir).grep({$_.path ~~ /txt$/});
    my $oldDir = "$dir.old";
    mkdir $oldDir;

    for @files -> $f {
         copy($f, $oldDir ~ '/' ~ $f.basename);

        my $txt = $f.IO.slurp;
        $txt = $txt.subst($find, $replace, :g);
        $f.spurt($txt);
    }
}

#`{
    # Purpose: Apply regexes to every line of every txt file at a given path.
    # Copy the old files to a new directory called .old/, overwriting as need be.
}
