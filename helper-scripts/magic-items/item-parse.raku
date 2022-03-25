use v6;
use DBIish;

# other path: /mnt/c/Users/gll/SRD5.db
my $db = DBIish.connect('SQLite', :database</mnt/c/users/Gavin Lochtefeld/Desktop/SRD5.db>);
sub as-hash($sql) { $db.execute($sql).allrows().map({@_[0] => @_[1]}).hash; }
my %magic-item-type = as-hash('select name, id from magicItemType');
my %item-rarity = as-hash('select name, id from rarity');

# name | itemType | typeClarification | rarityID | requiresAttunement | description
my method rsplit(Str:D $in: Str:D $delim, $count=999) {
    my @res-idx = $in.indices($delim)[*-($count == 999 ?? 0 !! $count-1)..*];

    my @res = Array.new;
    my $start = 0;
    loop (my $i = 0; $i < @res-idx.elems; $i++) {
        @res.push($in.substr($start..@res-idx[$i] - 1));
        $start = @res-idx[$i] + 1;
    }
    @res.push($in.substr(@res-idx[*-1] + 1..*));
}
my &get-hash-pair = -> %hash { -> $s {
    (my $key, my $val) = $s.trim.&rsplit(' ', 2);
    %hash{$key} => Int($val);
} };

sub pair-from-hash($line, %list, :$idx, :$split=',') {
    my &check = &get-hash-pair(%list);
    $line.substr($idx..*).split($split).map(&check);
}

class Item {
    has Str $.name is rw;
    has Int $.itemType is rw;
    has Str $.typeClarif is rw;
    has Int $.rarity is rw;
    has Bool $.attune is rw;
    has Str $.attuneDetails is rw;
    has Str $.descrip is rw;
}

sub MAIN($file) {
    my $contents = $file.IO.slurp;
    my @items = $contents.split(/\n\n/);
    my @items-sql = Array.new;

    loop (my $i = 0; $i < @items.elems; $i++) {
        my @lines = @items.split(/\n/);
        my $i = Item.new;

        $i.name = @lines[0];
        (my $type, my $typeClar, my $rarity, my $attuneFull) = @lines[1].&rsplit(',', 2).map({$_.trim.split(' ', 2)}).flat;
        $i.type = get-hash-pair(%magic-item-type)($type);
        $i.typeClarification = $typeClar;
        $i.rarity = get-hash-pair(%item-rarity)($rarity.wordcase);
        $i.attune = $attuneFull ~~ Any:D;
        $i.attuneDetails = $i.attune 
            ?? $attuneFull.substr(21..^*).chop()
            !! '';

        my $line
        for @lines[2..*] {
            
        }
    }
    
    "DELETE FROM magicItem;\nDELETE FROM sqlite_sequence WHERE name='magicItem';".say;
    for @items-sql { $_.say; }
}
#`[
Copyright 2022 Gavin Lochtefeld

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]
