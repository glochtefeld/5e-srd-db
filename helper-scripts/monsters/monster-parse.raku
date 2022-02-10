use v6;

constant @sizes = <Tiny Small Medium Large Gargantuan>;
constant @speedTypes = <Normal Burrow Climb Fly Swim>;
constant @alignments = 'lawful good', 'lawful neutral', 'lawful evil', 'neutral good', 'neutral neutral', 'neutral evil', 'chaotic good', 'chaotic neutral', 'chaotic evil';
constant @abilities = <Str Dex Con Int Wis Cha>;
subset AbilityPair of Pair where {$_.key ~~ Int:D && $_.value ~~ Int:D};

class Monster {
    has $.id;
    has $.name;
    has $.size;
    has $.monsterType;
    has $.alignment;
    has $.ac;
    has $.hp;
    has $.hpFormula;
    has @.speeds;
    has AbilityPair @scores;
    has AbilityPair @saves;
}

sub MAIN($file) {
    my $contents = $file.IO.slurp;
    my @monsters = $contents.split(/\n\n/);
    
    loop (my $i = 0; $i < @monsters.elems; $i++) {
        my @lines = @monsters[$i].split(/\n/);
        my $id = $i + 1;
        my $name = @lines[0];
        (my $size, my $type, my $law-chaos, my $good-evil) = @lines[1].split(' ');
        my $align = $law-chaos ~ ' ' ~ $good-evil;
        $type = $type.chop();
    }
}

#`{
    [ A warning:
        Listen. Never do this. Never try to write a parser for any part
        of the SRD. You will hate it. It's nothing but edge cases. If 
        you take anything from this, MAKE IT THIS COMMENT.
    ]
Copyright 2022 Gavin Lochtefeld

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}
