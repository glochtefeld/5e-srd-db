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

constant @sizes = <Tiny Small Medium Large Huge Gargantuan>; # creatureSize
constant @speedTypes = <normal burrow climb fly swim>; # movementType
constant @alignments = 'lawful good', 'lawful neutral', 'lawful evil', 'neutral good', 'neutral neutral', 'neutral evil', 'chaotic good', 'chaotic neutral', 'chaotic evil', 'any alignment'; # alignment
constant @abilities = <Str Dex Con Int Wis Cha>; # ability
constant @senses = <blindsight darkvision tremorsense truesight>; # sense
constant @challenges = <0 1/8 1/4 1/2 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30>; # challengeRating
constant @numbers = <one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty twenty-one twenty-two twenty-three twenty-four twenty-five twenty-six twenty-seven twenty-eight twenty-nine thirty thirty-one thirty-two thirty-three thirty-four thirty-five>; # dumb.


my &get-pair = -> @arr { -> $s {
    (my $predicate, my $val) = $s.trim.split(' ');
    my $key = @arr.grep({$_ eq $predicate}, :k)[0] + 1;
    $key => Int($val);
} };
my &get-hash-pair = -> %hash { -> $s {
    (my $key, my $val, my $other) = $s.trim.split(' ');
    $key = $key ~ ' ' ~ $val if $other ~~ Any:D;
    $val = $other if $other ~~ Any:D;
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
    has $.extra-types is rw;
    has Int $.alignment is rw;
    has Int $.ac is rw;
    has Int $.hp is rw;
    has Str $.hpFormula is rw;
    has @.speeds is rw;
    has @.scores is rw;
    has @.saves is rw;
    has IntPair @.skills is rw;
    has Int $.passivePerception is rw;
    has @.senses is rw;
    has @.languages is rw;
    has $.telepathy is rw;
    has $.challenge is rw;
    has @.damage-modifiers is rw;
    has @.condition-immunities is rw;
    has @.traits is rw;
    has $.multiattack is rw;
    has @.attacks is rw;
    has @.actions is rw;
    has $.legendary-action-ct is rw;
    has @.legendary-actions is rw;
    has @.reactions is rw;
}

class Speed {
    has $.type;
    has $.speed;
    has $.measure;
    has $.qualifier;

    submethod BUILD(:@arr) {
        given @arr.elems {
            when 4 { $!qualifier = @arr[3]; proceed }
            when * >= 3 { $!type = get-idx(@speedTypes)(@arr[0]); $!speed= @arr[1].Int; $!measure = %distance{@arr[2];} }
            when 2 { $!type = 1; $!speed = @arr[0].Int; $!measure = %distance{@arr[1]}; }
            default { die "Unknown speed: {@arr.raku.say}"; }
        }
        $!qualifier = '' unless $!qualifier ~~ Any:D;
    }
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
    has @.damage is rw;
    has $.hitEffect is rw;
}

#`[
    class AtkDamage {
        has @.rolls;
        has $.prereq;
    }

    class AtkDmgPart {
        has $.average;
        has $.formula;
        has $.type;
    }
]

sub MAIN($file) {
    my $contents = $file.IO.slurp;
    my @monsters = $contents.split(/\n\n/);

    my @monster-sql;
    my @speeds-sql;
    my @scores-sql;
    my @saves-sql;
    my @skills-sql;
    my @senses-sql;
    my @languages-sql;
    my @damage-modifiers-sql;
    my @condition-immunities-sql;
    my @traits-sql;
    my @attacks-sql;
    my @damages-sql;
    my @actions-sql;
    my @legendary-actions-sql;
    my @reactions-sql;
    
    loop (my $i = 0; $i < @monsters.elems; $i++) {
        my @lines = @monsters[$i].split(/\n/);
        my $m = Monster.new;

        $m.id = $i + 1;
        $m.name = @lines[0];

        (my $size, my $type, my $type-align) = @lines[1].split(' ', 3);
        $m.size = get-idx(@sizes)($size);
        $type = $type.chop() if $type.substr(*-1) eq ',';
        $m.monsterType = %types{$type.tclc()};
        my @type-align = $type-align.split('),');
        ($m.extra-types, $m.alignment) = @type-align.elems > 1 
            ?? (@type-align[0].substr(1..*), idx-from-list(@type-align[1].trim, @alignments, :idx<0>)[0])
            !! ('', idx-from-list(@type-align[0].trim, @alignments, :idx<0>)[0]);


        (my $ac, my $ac-source) = @lines[2].substr(11..*).split(' ('); # Not using AC SOURCE
        $m.ac = $ac.trim.Int;
        (my $hp, $m.hpFormula) = @lines[3].split(' ')[2..3];
        $m.hp = $hp.trim.Int;
        $m.speeds = @lines[4].substr(5..*).split(', ').map({Speed.new(arr=>$_.trim.split(' '))});
        $m.scores = @lines[5].split(/\(.\d+\)/).map({Int($_) if $_});
        my $j = 6;

        $m.damage-modifiers = Array.new;
        until @lines[$j] eq 'Traits' { # Header
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
                $m.languages = pair-from-hash($line, %languages, :idx<10>);
            }
            elsif $line.match(/^Telepathy/) { $m.telepathy = True; }
            elsif $line.match(/^Challenge/) {
                my $challenge = $line.split(' ')[1];
                $m.challenge = idx-from-list($challenge, @challenges, :idx<0>)[0];
            }
            elsif $line.match(/^Damage\sResistances/) {
                # damageTypeID | monsterID | nonmagical | silvered | adamantine | dmg mult
                $line = $line.substr(19..*);
                $m.damage-modifiers.append($line.split(/\,|\;/).map({
                    my @res = $_.trim.split(' ');
                    if @res.elems > 1 {
                        %damage{@res[0].trim.tclc}=>(
                            (@res[1]~~/n./) ~~ Any:D, 
                            (@res[1]~~/ns/)~~Any:D,
                            (@res[1]~~/na/)~~Any:D,
                            0.5
                        );
                    }
                    else { %damage{$_.trim.tclc}=>(False, False, False, 0.5); }
                }));
            }
            elsif $line.match(/^Damage\sImmunities/) {
                $line = $line.substr(18..*);
                $m.damage-modifiers.append($line.split(/\,|\;/).map({
                    my @res = $_.trim.split(' ');
                    if @res.elems > 1 {
                        %damage{@res[0].trim.tclc}=>(
                            (@res[1]~~/n./) ~~ Any:D, 
                            (@res[1]~~/ns/)~~Any:D,
                            (@res[1]~~/na/)~~Any:D,
                            0
                        );
                    }
                    else { %damage{$_.trim.tclc}=>(False, False, False, 0); }
                }));
            }
            elsif $line.match(/^Damage\sVulnerabilities/) {
                $line = $line.substr(23..*);
                $m.damage-modifiers.append($line.split(/\,|\;/).map({
                    my @res = $_.trim.split(' ');
                    if @res.elems > 1 {
                        %damage{@res[0].trim.tclc}=>(
                            (@res[1]~~/n./) ~~ Any:D, 
                            (@res[1]~~/ns/)~~Any:D,
                            (@res[1]~~/na/)~~Any:D,
                            2
                        );
                    }
                    else { %damage{$_.trim.tclc}=>(False, False, False, 2); }
                }));
            }
            elsif $line.match(/^Condition\sImmunities/) {
                $m.condition-immunities = $line.substr(21..*).split(',').map({%conditions{$_.trim.tclc}});
            }
            else {
                $line.say;
                die "Unknown property found";
            }
        }

        my %default-saves = $m.scores.pairs.map({($_.key + 1)=>($_.value div 2 - 5)}).hash;
        for $m.saves { %default-saves{$_.key} = $_.value; }
        $m.saves = %default-saves.Array.map({$_.key.Int=>$_.value});

        $m.passivePerception = ($m.skills.grep({$_.key == 14})[0].value 
            || $m.scores[4] div 2 - 5 ) 
            + 10;

        $m.telepathy = $m.telepathy || False;

        $j++; # Consume Traits

        until @lines[$j] eq 'Actions' { # Traits
            my $line = @lines[$j++];
            (my $name, my $desc) = $line.split('.', 2);
            $m.traits.push($name=>$desc);
        }
        ++$j;

        until @lines[$j] eq 'Legendary Actions' || @lines[$j] eq 'Reactions' || @lines[$j] eq 'END' { # Actions
            my $line = @lines[$j++];

            if $line ~~ /^Multiattack/ { 
                my $match = ($line ~~/(one|two|three|four|five|six|seven|thirty\-five|1d4)/).Str;
                if $match eq '1d4' { $m.multiattack = 4; }
                else { $m.multiattack = get-idx(@numbers)($match) || 0; } # hydra goes hard
            }
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
                    @melee = $range.split(' or ')[0].trim.split(' ')[1..2];
                    @range = $range.split(' or ')[1].trim.substr(6..*).split(/\/|\s/);
                    $a.melee-range = @melee[0]=>%distance{@melee[1]};
                    ($a.ranged-std, $a.ranged-upper) = (@range[0]=>%distance{@range[2]}, @range[0]=>%distance{@range[2]});
                }
                elsif $range ~~ /reach/ {
                    @melee = $range.split(' ')[1..2];
                    $a.melee-range = @melee[0]=>%distance{@melee[1]};
                }
                elsif $range ~~ /range/ {
                    @range = $range.trim.substr(6..*).split(/(\/|\s)/);
                    my @rnge = @range[0..*-1];
                    ($a.ranged-std, $a.ranged-upper) = @rnge.map({@_[0]=>%distance{@rnge[*-1]}});
                }
                $a.target = $target.split(' ')[0].Int;
                $a.ranged-std = 0=>0 unless $a.ranged-std ~~ Any:D;
                $a.ranged-upper = 0=>0 unless $a.ranged-upper ~~ Any:D;
                $a.melee-range = 0=>0 unless $a.melee-range ~~ Any:D;

                (my $dmg, my $hiteff) = $hit.split('&');
                $a.hitEffect = ($hiteff && $effect)
                    ?? $hiteff ~ '.' ~ $effect      # take both
                    !! ($hiteff || $effect || '');  # take whichever exists, or empty if neither

                $a.damage = $dmg.substr(6..*).split('|');
                #`[.map({
                    (my $rolls, my $prereq) = $_.split('?');
                    $prereq = $prereq.trim if $prereq ~~ Any:D;

                    my @rolls = $rolls.split(' plus ').map({
                        my @r = $_.trim.split(' ');
                        AtkDmgPart.new(average=>@r[0].Int, formula=>@r[1], type=>%damage{@r[2]});
                    });
                });]

                $m.attacks.push($a);
            }
            else { # Some other action
                (my $k, my $v) = $line.split('.', 2);
                $m.actions.push($k=>$v);
            }
        }
        $m.multiattack = 0 unless $m.multiattack ~~ Any:D;

        while @lines[$j] ne 'END' && $j < @lines.elems {
            if @lines[$j] eq 'Reactions' {
                $j++;
                repeat {
                    my $line = @lines[$j++];
                    (my $k, my $v) = $line.split('.', 2);
                    $m.reactions.push($k=>$v);
                } until @lines[$j] eq 'Legendary Actions'
                    || @lines[$j] eq 'END';
            }
            if @lines[$j] eq 'Legendary Actions' {
                $j++;
                $m.legendary-action-ct = (@lines[$j++] ~~ /\d+\slegendary\sactions/).Str.split(' ', 2)[0].Int;
                repeat {
                    my $line = @lines[$j++];
                    (my $k, my $v) = $line.split('.', 2);
                    (my $name, my $costprt) = $k.split(' (Costs ');
                    $costprt = $costprt.split(' ')[0].Int;
                    $m.legendary-actions.push($name=>($costprt, $v));
                } until @lines[$j] eq 'Reactions'
                    || @lines[$j] eq 'END';
            }
        }
        $m.legendary-action-ct = 0 unless $m.legendary-action-ct ~~ Any:D;
        
        # echo SQL
        #`{ my @monster-sql;
            my @speeds-sql;
            my @scores-sql;
            my @saves-sql;
            my @skills-sql;
            my @senses-sql;
            my @languages-sql;
            my @damage-modifiers-sql;
            my @condition-immunities-sql;
            my @traits-sql;
            my @attacks-sql;
            my @actions-sql;
            my @legendary-actions-sql;
            my @reactions-sql; }

        my $monster-sql = "INSERT INTO monster ( name, sizeID, monsterTypeID, otherTypes, alignmentID, ac, hp, hpFormula, passivePerception, telepathy, challengeID, multiattack, legendaryActionsCount) VALUES ({$m.name}, {$m.size}, {$m.monsterType}, {$m.extra-types}, {$m.alignment}, {$m.ac}, {$m.hp}, {$m.hpFormula}, {$m.passivePerception}, {$m.telepathy}, {$m.challenge}, {$m.multiattack}, {$m.legendary-action-ct}); ";

        @monster-sql.push($monster-sql);

        for $m.speeds -> $s {
            my $spd = "INSERT INTO monsterSpeed (monsterID, movementTypeID, amount, measureID, qualifier) VALUES ({$m.id}, {$s.type}, {$s.speed}, {$s.measure}, '{$s.qualifier}');";
            @speeds-sql.push($spd);
        }
        for $m.scores.pairs {
            @scores-sql.push("INSERT INTO monsterAbility (monsterID, abilityID, score) VALUES ({$m.id}, {$_.key + 1}, {$_.value});");
        }
        for $m.saves {
            @saves-sql.push("INSERT INTO monsterSave (monsterID, abilityID, saveBonus) VALUES ({$m.id}, {$_.key}, {$_.value});");
        }
        for $m.skills {
            @skills-sql.push("INSERT INTO monsterSkill (monsterID, skillID, bonus) VALUES ({$m.id}, {$_.key}, {$_.value});");
        }
        for $m.senses {
            @senses-sql.push("INSERT INTO monsterSense (monsterID, senseID, range, measureID) VALUES ({$m.id}, {$_.key}, {$_.value}, 3);");
        }
        for $m.languages {
            @languages-sql.push("INSERT INTO monsterLanguage (monsterID, languageID, canSpeak) VALUES ({$m.id}, {$_.key}, {$_.value});");
        }
        for $m.damage-modifiers {
            my @vals = $_.value;
            @damage-modifiers-sql.push("INSERT INTO monsterDamageModifier (monsterID, damageTypeID, onlyNonmagical, exceptNMSilver, exceptNMAdamantine, dmgMultiplier) VALUES ({$m.id}, {$_.key}, {@vals[0].Int}, {@vals[1].Int}, {@vals[2].Int}, {@vals[3]});"); 
        }
        for $m.condition-immunities {
            @condition-immunities-sql.push("INSERT INTO monsterConditionImmunity (monsterID, conditionID) VALUES ({$m.id}, $_)");
        }
        for $m.traits {
            @traits-sql.push("INSERT INTO monsterTrait (monsterID, name, description) VALUES ({$m.id}, '{$_.key}', '{$_.value}');");
        }
        for $m.attacks {
            @attacks-sql.push("INSERT INTO monsterAttack (monsterID, name, toHitBonus, isMelee, isRanged, isSpell, isWeapon, meleeRange, meleeRangeDistID, stdRange, stdRangeDistID, maxRange, maxRangeDistID, targetCount, hitEffect) VALUES ({$m.id}, '{$_.name}', {$_.toHitBonus}, {$_.melee.Int}, {$_.range.Int}, {$_.spell.Int}, {$_.weapon.Int}, {$_.melee-range.key}, 3, {$_.ranged-std.key}, 3, {$_.ranged-upper.key}, 3, {$_.target}, '{$_.hitEffect}');"); 
            for $_.damage { 
                # Tricky bit: the attackID is going to be @attacks-sql.elems.
                @damages-sql.push("INSERT INTO monsterAttackDmg (attackID, roll) VALUES ({@attacks-sql.elems}, '$_');");
            }
        }
        for $m.actions {
            @actions-sql.push("INSERT INTO monsterAction (monsterID, name, description) VALUES ({$m.id}, '{$_.key}', '{$_.value}');");
        }
        for $m.legendary-actions {
            @legendary-actions-sql.push("INSERT INTO monsterLegendaryAction (monsterID, name, description, cost) VALUES ({$m.id}, '{$_.key}', '{$_.value[1]}', {$_.value[0]});");
        }
        for $m.reactions {
            @reactions-sql.push("INSERT INTO monsterReaction (monsterID, name, description) VALUES ({$m.id}, '{$_.key}', '{$_.value}');");
        }
    }

    "DELETE FROM monster;\nDELETE FROM sqlite_sequence WHERE name='monster';".say;
    for @monster-sql { $_.say; }
    "\nDELETE FROM monsterSpeed;\nDELETE FROM sqlite_sequence WHERE name='monsterSpeed';".say;
    for @speeds-sql { $_.say; }
    "\nDELETE FROM monsterAbility;\nDELETE FROM sqlite_sequence WHERE name='monsterAbility';".say;
    for @scores-sql { $_.say; }
    "\nDELETE FROM monsterSave;\nDELETE FROM sqlite_sequence WHERE name='monsterSave';".say;
    for @saves-sql { $_.say; }
    "\nDELETE FROM monsterSkill;\nDELETE FROM sqlite_sequence WHERE name='monsterSkill';".say;
    for @skills-sql { $_.say; }
    "\nDELETE FROM monsterSense;\nDELETE FROM sqlite_sequence WHERE name='monsterSense';".say;
    for @senses-sql { $_.say; }
    "\nDELETE FROM monsterLanguage;\nDELETE FROM sqlite_sequence WHERE name='monsterLanguage';".say;
    for @languages-sql { $_.say; }
    "\nDELETE FROM monsterDamageModifier;\nDELETE FROM sqlite_sequence WHERE name='monsterDamageModifier';".say;
    for @damage-modifiers-sql { $_.say; }
    "\nDELETE FROM monsterConditionImmunity;\nDELETE FROM sqlite_sequence WHERE name='monsterConditionImmunity';".say;
    for @condition-immunities-sql { $_.say; }
    "\nDELETE FROM monsterTrait;\nDELETE FROM sqlite_sequence WHERE name='monsterTrait';".say;
    for @traits-sql { $_.say; }
    "\nDELETE FROM monsterAttack;\nDELETE FROM sqlite_sequence WHERE name='monsterAttack';".say;
    for @attacks-sql { $_.say; }
    "\nDELETE FROM monsterAttackDmg;\nDELETE FROM sqlite_sequence WHERE name='monsterAttackDmg';".say;
    for @damages-sql { $_.say; }
    "\nDELETE FROM monsterAction;\nDELETE FROM sqlite_sequence WHERE name='monsterAction';".say;
    for @actions-sql { $_.say; }
    "\nDELETE FROM monsterLegendaryAction;\nDELETE FROM sqlite_sequence WHERE name='monsterLegendaryAction';".say;
    for @legendary-actions-sql { $_.say; }
    "\nDELETE FROM monsterReaction;\nDELETE FROM sqlite_sequence WHERE name='monsterReaction';".say;
    for @reactions-sql { $_.say; }
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

