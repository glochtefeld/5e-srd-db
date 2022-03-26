use v6;
use DBIish;

# other path: /mnt/c/Users/gll/SRD5.db
my $db = DBIish.connect('SQLite', :database</mnt/c/users/Gavin Lochtefeld/Desktop/SRD5.db>);
sub as-hash($sql) { $db.execute($sql).allrows().map({@_[0] => @_[1]}).hash; }
my %magic-item-type = as-hash('select name, id from magicItemType');
my %item-rarity = as-hash('select name, id from rarity');

my method rsplit(Str:D $in: Str:D $delim, $count=999) {
    my @res-idx = $in.indices($delim)[*-($count == 999 ?? 0 !! $count-1)..*];

    my @res = Array.new;
    my $start = 0;
    loop (my $i = 0; $i < @res-idx.elems; $i++) {
        @res.push($in.substr($start..@res-idx[$i] - 1));
        $start = @res-idx[$i] + 1;
    }
    if @res-idx.elems > 0 {
        @res.push($in.substr(@res-idx[*-1] + 1..*));
    }
    else {
        @res.push($in);
    }
    return @res;
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
        my @lines = @items[$i].split(/\n/);
        my $it = Item.new;

        $it.name = @lines[0];

        (my $typeFull, my $rareAttune) = @lines[1].&rsplit(',', 2).map({$_.trim});
        (my $type, my $typeClar) = $typeFull.&rsplit(' (', 2);
        (my $rarity, my $attuneFull) = $rareAttune.&rsplit(' (', 2);

        $it.itemType = %magic-item-type{$type.wordcase};
        $it.typeClarif = $typeClar || '';
        $it.rarity = %item-rarity{$rarity.wordcase};
        $it.attune = $attuneFull ~~ Any:D;
        $it.attuneDetails = $it.attune 
            ?? $attuneFull.substr(21..^*).chop()
            !! '';

        $it.descrip = @lines[2..*].join(' ');

        @items-sql.push("INSERT INTO magicItem (name, itemType, typeClarification, rarityID, requiresAttunement, attunementDetails, description) VALUES ('{$it.name}', {$it.itemType}, '{$it.typeClarif}', {$it.rarity}, {$it.attune.Int}, '{$it.attuneDetails}', '{$it.descrip}');");
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
