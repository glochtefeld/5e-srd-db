use v6;
constant @sizes = <Tiny Small Medium Large Gargantuan>;
constant @speedTypes = <Normal Burrow Climb Fly Swim>;
constant @alignments = 'lawful good', 'lawful neutral', 'lawful evil', 'neutral good', 'neutral neutral', 'neutral evil', 'chaotic good', 'chaotic neutral', 'chaotic evil';
constant @abilities = <Str Dex Con Int Wis Cha>; # Used for saves
constant @languages = 'Any', 'Common', 'Dwarvish', 'Elvish', 'Giant', 'Gnomish', 'Goblin', 'Halfling', 'Orc', 'Abyssal', 'Celestial', 'Draconic', 'Deep Speech', 'Infernal', 'Primordial', 'Sylvan', 'Undercommon';
constant @skills = 'Any', 'Athletics', 'Acrobatics', 'Sleight of Hand', 'Stealth', 'Arcana', 'History', 'Investigation', 'Nature', 'Religion', 'Animal Handling', 'Insight', 'Medicine', 'Perception', 'Survival', 'Deception', 'Intimidation', 'Performance', 'Persuasion';
constant @senses = <blindsight darkvision tremorsense truesight>;
constant @challenges = <0 1/8 1/4 1/2 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30>;

my &get-pair = -> @arr { -> $s {
    (my $predicate, my $val) = $s.trim.split(' ');
    my $key = @arr.grep({$_ eq $predicate}, :k)[0] + 1;
    $key => Int($val);
} };
my &get-idx = -> @arr { -> $s { @arr.grep({$_ eq $s}, :k)[0] + 1; } };

sub pair-from-list($line, @list, :$idx, :$split=',') {
    my &check = &get-pair(@list);
    $line.substr($idx..*).split($split).map(&check);
}
sub idx-from-list($line, @list, :$idx, :$split=',') {
    my &check = &get-idx(@list);
    $line.substr($idx..*).split($split).map(&check);
}

subset AbilityPair of Pair where {$_.key ~~ Int:D && $_.value ~~ Int:D};

class Monster {
    has $.id is rw;
    has $.name is rw;
    has $.size is rw;
    has $.monsterType is rw;
    has $.alignment is rw;
    has $.ac is rw;
    has $.hp is rw;
    has $.hpFormula is rw;
    has @.speeds is rw;
    has AbilityPair @.scores is rw;
    has AbilityPair @.saves is rw;
    has @.skills is rw;
    has @.senses is rw;
    has @.languages is rw;
    has $.telepathy is rw;
    has $.challenge is rw;
    has @.damage-resistances is rw;
    has @.damage-immunities is rw;
    has @.condition-immunities is rw;
}

sub MAIN($file) {
    my $contents = $file.IO.slurp;
    my @monsters = $contents.split(/\n\n/);
    
    loop (my $i = 0; $i < @monsters.elems; $i++) {
        my @lines = @monsters[$i].split(/\n/);
        my $m = Monster.new;

        $m.id = $i + 1;
        $m.name = @lines[0];
        ($m.size, my $type, my $law-chaos, my $good-evil) = @lines[1].split(' ');
        $m.alignment = $law-chaos ~ ' ' ~ $good-evil;
        $m.monsterType = $type.chop();
        ($m.ac, my $ac-source) = @lines[2].substr(11..*).split(' ('); # Not using AC SOURCE
        ($m.hp, $m.hpFormula) = @lines[3].split(' ')[2..3];
        $m.speeds = @lines[4].substr(5..*).split(', ');
        $m.scores = @lines[5].split(/\((\+|\-)\d\)/) .map({Int($_) if $_})
            .pairs.map({$_.key + 1 => $_.value});
        my $j = 6;
        repeat {
            my $line = @lines[$j++];
            $line.raku.say;

            if $line.match(/^Saving\sThrow/) {
                $m.saves = pair-from-list($line, @abilities, :idx<14>);
                $m.saves.raku.say;
            }
            elsif $line.match(/^Skills/) {
                $m.skills = pair-from-list($line, @skills, :idx<6>);
                $m.skills.raku.say;
            }
            elsif $line.match(/^Senses/) {
                $m.senses = pair-from-list($line, @senses, :idx<6>);
                $m.senses.raku.say;
            }
            elsif $line.match(/^Languages/) {
                $m.languages = pair-from-list($line, @languages, :idx<9>);
                $m.languages.raku.say;
            }
            elsif $line.match(/^Telepathy/) { $m.telepathy = True; }
            elsif $line.match(/^Challenge/) {
                my $challenge = $line.split(' ')[2];
                $m.challenge = pair-from-list($challenge, @challenges, :idx<0>);
                $m.challenge.raku.say;
            }
            elsif $line.match(/^Damage\sResistances/) {}
            elsif $line.match(/^Damage\sImmunities/) {}
            elsif $line.match(/^Condition\sImmunities/) {}
            else {
                $line.say;
                die "Unknown property found";
            }
        } until @lines[$j] eq 'Traits';
    }
}
#`{
    A warning:
        Listen. Never do this. Never try to write a parser for any part
        of the SRD. You will hate it. It's nothing but edge cases. If 
        you take anything from this, MAKE IT THIS COMMENT.

        For monsters specifically, the amount of stuff I had to manually go
        through the copied text and change by hand was inordinant.

    A brief list of changes made to the copied monster text:
        Replaced all instances of (xdx + x) with (xdx+x).
        Appended an int to the end of each language known to represent the ability to speak
        Changed every trait and ability to fit on a single line
        
    Copyright 2022 Gavin Lochtefeld

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

