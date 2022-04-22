% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: pokemon.pro
% --- Line: Just a few facts about pokemon
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% --- cen(P) :: Pokemon P was "creatio ex nihilo"

cen(pikachu).
cen(bulbasaur).
cen(caterpie).
cen(charmander).
cen(vulpix).
cen(poliwag).
cen(squirtle).
cen(staryu).
cen(eevee).

% -----------------------------------------------------------------------
% --- evolves(P,Q) :: Pokemon P directly evolves to pokemon Q

evolves(pikachu,raichu).
evolves(bulbasaur,ivysaur).
evolves(ivysaur,venusaur).
evolves(caterpie,metapod).
evolves(metapod,butterfree).
evolves(charmander,charmeleon).
evolves(charmeleon,charizard).
evolves(vulpix,ninetails).
evolves(poliwag,poliwhirl).
evolves(poliwhirl,poliwrath).
evolves(squirtle,wartortle).
evolves(wartortle,blastoise).
evolves(staryu,starmie).

evolves(eevee,flareon).
evolves(eevee,jolteon).
evolves(eevee,vaporeon).

% -----------------------------------------------------------------------
% --- pokemon(name(N),T,hp(H),attach(A,D)) :: There is a pokemon with
% --- name N, type T, hit point value H, and attach named A that does
% --- damage D.

pokemon(name(pikachu), electric, hp(60), attack(gnaw, 10)).
pokemon(name(raichu), electric, hp(90), attack(thunder-shock, 90)).

pokemon(name(bulbasaur), grass, hp(40), attack(leech-seed, 20)).
pokemon(name(ivysaur), grass, hp(60), attack(vine-whip, 30)).
pokemon(name(venusaur), grass, hp(140), attack(poison-powder, 70)).

pokemon(name(caterpie), grass, hp(50), attack(gnaw, 20)).
pokemon(name(metapod), grass, hp(70), attack(stun-spore, 20)).
pokemon(name(butterfree), grass, hp(130), attack(whirlwind, 80)).

pokemon(name(charmander), fire, hp(50), attack(scratch, 10)).
pokemon(name(charmeleon), fire, hp(80), attack(slash, 50)).
pokemon(name(charizard), fire, hp(170), attack(royal-blaze, 100)).

pokemon(name(vulpix), fire, hp(60), attack(confuse-ray, 20)).
pokemon(name(ninetails), fire, hp(100), attack(fire-blast, 120)).

pokemon(name(poliwag), water, hp(60), attack(water-gun, 30)).
pokemon(name(poliwhirl), water, hp(80), attack(amnesia, 30)).
pokemon(name(poliwrath), water, hp(140), attack(dashing-punch, 50)).

pokemon(name(squirtle), water, hp(40), attack(bubble, 10)).
pokemon(name(wartortle), water, hp(80), attack(waterfall, 60)).
pokemon(name(blastoise), water, hp(140), attack(hydro-pump, 60)).

pokemon(name(staryu), water, hp(40), attack(slap, 20)).
pokemon(name(starmie), water, hp(60), attack(star-freeze, 20)).

pokemon(name(plusle), electric, hp(30), attack(spark, 20)).
pokemon(name(minum), electric, hp(30), attack(shock, 20)).

pokemon(name(eevee), normal, hp(30), attack(growl, 0)).
pokemon(name(flareon), flareon, hp(65), attack(ember, 40)).
pokemon(name(jolteon), electric, hp(65), attack(paralayze, 30)).
pokemon(name(vaporeon), grass, hp(65), attack(constrict, 50)).

display_names :- pokemon(name(Name),_,_,_),write(Name),nl,fail.

disply_attacks :- pokemon(_,_,_,attack(Attack,DMG)),write(Attack)
                ,write(' is '),write(DMG),write(' damage.'),nl,fail.

powerful(Name) :- pokemon(name(Name),_,_,attack(_,DMG)), DMG > 55.

tough(Name) :- pokemon(name(Name),_,hp(HP),_), HP > 100.

type(Name,T) :- pokemon(name(Name),T,_,_).

dump_kind(T) :- pokemon(name(Name), T, hp(HP), attack(Attack,DMG)),
    write('pokemon(name('), write(Name), write('), '), write(T),
    write(', hp('),write(HP),write('), attack('), write(Attack),
    write(', '), write(DMG), write(')).'),nl,fail.

display_cen :- cen(Pokemon),write(Pokemon),nl,fail.

family(P) :- evolves(P,Q), evolve(Q,R), write(P), write(' '), write(Q),
    write(' '), write(R).

families :- cen(P), family(P), nl, fail.

lineage(P) :- evolves(P,Q), evolves(Q,R), display_info(P), nl,
    display_info(Q), nl, display_info(R).
lineage(P) :- evolves(P,Q), display_info(P), nl, display_info(Q).
lineage(P) :- display_info(P).

display_info(P) :- pokemon(name(P), T, hp(HP), attack(A, DMG)),
    write('pokemon(name('), write(P), write('), '),
    write(T), write(', hp('), write(HP), write('), attack('), write(A),
    write(', '), write(DMG), write(')), ').

attack(Q,R) :- pokemon(name(Q),_,_,attack(A,DMG)),
                pokemon(name(R),_,hp(HP),_),
                write(Q),write(' attacks '),write(R),write(' with '),write(A),nl,
                REM is HP - DMG,
                checkHealth(R,REM),
                write(R),write(' has '),write(REM),write(' health left'),
                %attack(R,Q),
                nl,fail.

attack.

checkHealth(P,H) :- H < 0, write(P), write(' is dead.'), nl,fail.
checkHealth(P,H) :- H > 0, nl.
checkHealth.
