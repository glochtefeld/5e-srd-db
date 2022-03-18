use v6;
use DBIish;

# other path: /mnt/c/users/Gavin Lochtefeld/Desktop/SRD5.db
my $db = DBIish.connect('SQLite', :database</mnt/c/Users/gll/SRD5.db>);
sub as-hash($sql) { $db.execute($sql).allrows().map({@_[0] => @_[1]}).hash; }
my %types = as-hash('select name, id from monsterType');
my %languages = as-hash('select name, id from language');
my %skills = as-hash('select name, id from skill');
my %damage = as-hash('select name, id from damageType');
my %conditions = as-hash('select name, id from condition');
my %distance = as-hash('select measure, id from distance');

constant @sizes = <Tiny Small Medium Large Gargantuan>;
constant @speedTypes = <Normal Burrow Climb Fly Swim>;
constant @alignments = 'lawful good', 'lawful neutral', 'lawful evil', 'neutral good', 'neutral neutral', 'neutral evil', 'chaotic good', 'chaotic neutral', 'chaotic evil';
constant @abilities = <Str Dex Con Int Wis Cha>; # Used for saves
constant @senses = <blindsight darkvision tremorsense truesight>;
constant @challenges = <0 1/8 1/4 1/2 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30>;


my &get-pair = -> @arr { -> $s {
    (my $predicate, my $val) = $s.trim.split(' ');
    my $key = @arr.grep({$_ eq $predicate}, :k)[0] + 1;
    $key => Int($val);
} };
my &get-hash-pair = -> %hash { -> $s {
    (my $key, my $val) = $s.trim.split(' ');
    %hash{$key} => Int($val);
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
sub pair-from-hash($line, %list, :$idx, :$split=',') {
    my &check = &get-hash-pair(%list);
    $line.substr($idx..*).split($split).map(&check);
}

subset IntPair of Pair where {$_.key ~~ Int:D && $_.value ~~ Int:D};

class Monster {
    has Int $.id is rw;
    has $.name is rw;
    has Int $.size is rw;
    has Int $.monsterType is rw;
    has Int $.alignment is rw;
    has Int $.ac is rw;
    has Int $.hp is rw;
    has Str $.hpFormula is rw;
    has @.speeds is rw;
    has IntPair @.scores is rw;
    has IntPair @.saves is rw;
    has IntPair @.skills is rw;
    has Int $.passivePerception is rw;
    has @.senses is rw;
    has @.languages is rw;
    has $.telepathy is rw;
    has $.challenge is rw;
    has @.damage-resistances is rw;
    has @.damage-immunities is rw;
    has @.condition-immunities is rw;
    has @.traits is rw;
    has $.multiattack is rw;
}

class Attack {
    has $.name is rw;
    has $.toHitBonus is rw;
    has $.melee-range is rw; # length => distID
    has $.ranged-std is rw; # length => distID
    has $.ranged-upper is rw; #length => distID
    has $.melee is rw;
    has $.range is rw;
    has $.spell is rw;
    has $.weapon is rw;
    has $.target is rw;
    has @.avgDamage is rw;
    has @.damageFormula is rw;
    has @.damageType is rw;
    has $.hitEffect is rw;
}

sub MAIN($file) {
    my $contents = $file.IO.slurp;
    my @monsters = $contents.split(/\n\n/);
    
    loop (my $i = 0; $i < @monsters.elems; $i++) {
        my @lines = @monsters[$i].split(/\n/);
        my $m = Monster.new;

        $m.id = $i + 1;
        $m.name = @lines[0];
        (my $size, my $type, my $law-chaos, my $good-evil) = @lines[1].split(' ');
        $m.size = get-idx(@sizes)($size);
        $m.alignment = idx-from-list($law-chaos ~ ' ' ~ $good-evil, @alignments, :idx<0>).flat[0];
        $m.monsterType = %types{$type.chop().tclc()};
        (my $ac, my $ac-source) = @lines[2].substr(11..*).split(' ('); # Not using AC SOURCE
        $m.ac = $ac.trim.Int;
        (my $hp, $m.hpFormula) = @lines[3].split(' ')[2..3];
        $m.hp = $hp.trim.Int;
        $m.speeds = @lines[4].substr(5..*).split(', ');
        $m.scores = @lines[5].split(/\((\+|\-)\d\)/).map({Int($_) if $_})
            .pairs.map({$_.key + 1 => $_.value});
        my $j = 6;
        repeat { # Header
            my $line = @lines[$j++];

            if $line.match(/^Saving\sThrow/) {
                $m.saves = pair-from-list($line, @abilities, :idx<14>);
            }
            elsif $line.match(/^Skills/) {
                $m.skills = pair-from-hash($line, %skills, :idx<6>);
            }
            elsif $line.match(/^Senses/) {
                $m.senses = pair-from-list($line, @senses, :idx<6>);
            }
            elsif $line.match(/^Languages/) {
                $m.languages = pair-from-hash($line, %languages, :idx<9>);
            }
            elsif $line.match(/^Telepathy/) { $m.telepathy = True; }
            elsif $line.match(/^Challenge/) {
                my $challenge = $line.split(' ')[2];
                $m.challenge = pair-from-list($challenge, @challenges, :idx<0>);
            }
            elsif $line.match(/^Damage\sResistances/) {
                # damageTypeID | monsterID | mundane | silvered | adamantine | immune
                my $adamantine = $line ~~ /adamantine/;
                my $silver = $line ~~ /silver/;
                my $mundane = $line ~~ /nonmagical/;
                $line = $line.substr(18..*)
                .subst(/(and|silver|adamantine|from\snonmagical\sattacks|that|aren.t)/, :g);
                $m.damage-resistances = $line.split(/\,|\;/).map({%damage{$_.trim.tclc}=>($mundane ~~Any:D, $silver ~~ Any:D, $adamantine ~~ Any:D, False)});
            }
            elsif $line.match(/^Damage\sImmunities/) {
                my $adamantine = $line ~~ /adamantine/;
                my $silver = $line ~~ /silver/;
                my $mundane = $line ~~ /nonmagical/;
                $line = $line.substr(18..*)
                .subst(/(and|silver|adamantine|from\snonmagical\sattacks|that|aren.t)/, :g);
                $m.damage-resistances = $line.split(/\,|\;/).map({%damage{$_.trim.tclc}=>($mundane ~~Any:D, $silver ~~ Any:D, $adamantine ~~ Any:D, True)});
            }
            elsif $line.match(/^Condition\sImmunities/) {
                $m.condition-immunities = $line.substr(21..*).split(',').map({%conditions{$_.trim.tclc}});
            }
            else {
                $line.say;
                die "Unknown property found";
            }
        } until @lines[$j] eq 'Traits';
        $m.passivePerception = $m.skills.grep({$_.key == 14})[0].value + 10;
        $j++; # Consume Traits

        repeat { # Traits
            my $line = @lines[$j++];
            (my $name, my $desc) = $line.split('.', 2);
            $m.traits.push($name=>$desc);
        } until @lines[$j] eq 'Actions';
        ++$j;

        repeat { # Actions
            my $line = @lines[$j++];

            if $line ~~ /^Multiattack/ { $m.multiattack = True; }
            elsif $line ~~ /(M|R)+(S|W)A\./ {
                my $a = Attack.new;
                (my $title, my $atkType, my $targeting, my $hit, my $effect) = $line.split('.', 5);
                $a.name = $title;
                ($a.range, $a.melee, $a.spell, $a.weapon) = (False, False, False, False);
                given $atkType.trim {
                    when 'MSA' { $a.melee = True; $a.spell = True; }
                    when 'MWA' { $a.melee = True; $a.weapon = True; }
                    when 'RSA' { $a.range = True; $a.spell = True;}
                    when 'RWA' { $a.range = True; $a.weapon = True; }
                    when 'MRWA' { $a.melee = True; $a.range = True; $a.weapon = True; }
                    default { die "Unknown attack type: $atkType"; }
                }

                (my $hitBonus, my $range, my $target)  = $targeting.split(',').map({$_.trim});
                $a.toHitBonus = $hitBonus.split(' ')[0].Int;
                my @melee;
                my @range;
                if $range ~~ /reach/ && $range ~~ /range/ {
                    @melee = $range.split(' or ')[0].split(' ')[1..2];
                    @range = $range.split(' or ')[1].trim.substr(6..*).split('/').map({$_.split(' ')});
                    $a.melee-range = @melee[0]=>%distance{@melee[1]};
                    ($a.ranged-std, $a.ranged-upper) = @range.map({@_[0]=>%distance{@_[1]}});
                }
                elsif $range ~~ /reach/ {
                    @melee = $range.split(' ')[1..2];
                    $a.melee-range = @melee[0]=>%distance{@melee[1]};
                }
                elsif $range ~~ /range/ {
                    @range = $range.trim.substr(6..*).split('/').map({$_.split(' ')});
                    ($a.ranged-std, $a.ranged-upper) = @range.map({@_[0]=>%distance{@_[1]}});
                }

                # target
                $a.target = $target.split(' ')[0].Int;

                # damage
                
                # details
            }

        } until @lines[$j] eq 'Legendary Actions' 
            || @lines[$j] eq 'Reactions' 
            || @lines[$j] eq 'END';
        ++$j;

        my $rest = @lines[$j..*].join(' ');

        if $rest ~~ /\nReactions\n/ {}
        if $rest ~~ /\nLegendary\sActions\n/ {}
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
        Changed Melee/Ranged Weapon/Spell Attack to (M|R)(W|S)A, and occasionally MRWA for spears
        Changed "one target" to "1 target"
        Changed "ft." to "Feet"
        
    Copyright 2022 Gavin Lochtefeld

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

