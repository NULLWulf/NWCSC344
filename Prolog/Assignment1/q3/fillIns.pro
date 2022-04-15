%% Query 1: Is picachu a “creatio ex nihilo” (created out of nothing) pokemon? %%
?- cen(pikachu).
true.

%% Query 2: Is raichu a “creatio ex nihilo” pokemon? %%
?- cen(riachu).
false.

%$ Query 3: By means of hand intervention, list all of the “creatio ex nihilo” pokemon.  %%
?- cen(Name).
Name = pikachu ;
Name = bulbasaur ;
Name = caterpie ;
Name = charmander ;
Name = vulpix ;
Name = poliwag ;
Name = squirtle ;
Name = staryu.


%% By means of the standard idiom of repetition, list all of the “creatio ex nihilo” pokemon. %%
?- cen(Name),write(Name),nl,fail.
pikachu
bulbasaur
caterpie
charmander
vulpix
poliwag
squirtle
staryu
false.

%%  Does squirtle evolve into wartortle?
?- evolves(squirtle,wartortle).
true.

%%  Does wartortle evolve into squirtle? %%
?- evolves(wartortle,squirtle).
false.

%% Does squirtle evolve into blastoise? %%
?- evolves(squirtle,blastoise).
false.

%% : By means of hand intervention, list all triples of pokemon such %% 
%% that the first evolves into the second %%
%% and the second evolves into the third. %%
?- evolves(P,Q),evolves(Q,R).
X = bulbasaur,
Y = ivysaur,
Z = venusaur ;
X = caterpie,
Y = metapod,
Z = butterfree ;
X = charmander,
Y = charmeleon,
Z = charizard ;
X = poliwag,
Y = poliwhirl,
Z = poliwrath ;
X = squirtle,
Y = wartortle,
Z = blastoise ;
false.

%% By means of the standard idiom of repetition, list all pairs of pokemon such that the first evolves %%
%% through an intermediary to the second - placing an arrow between each pair.%%
?-evolves(P,Q),evolves(Q,R),write(P),write('-->'),write(R),
bulbasaur --> venusaur
caterpie --> butterfree
charmander --> charizard
poliwag --> poliwrath
squirtle --> blastoise
false.

%% : By means of hand intervention, list all triples of pokemon such that the first evolves into the second
%% and the second evolves into the third. %%
?- pokemon(name(N),_,_,_),write(N),nl,fail.
pikachu
raichu
bulbasaur
ivysaur
venusaur
caterpie
metapod
butterfree
charmander
charmeleon
charizard
vulpix
ninetails
poliwag
poliwhirl
polywrath
squirtle
wartortle
blastoise
staryu
starmie
false.

%% By means of the standard idiom of repetition, list the names of all of the fire pokemon
?- pokemon(name(N),fire,_,_),write(N),nl,fail.
charmander
charmeleon
charizard
vulpix
ninetails
false.

%% By means of the standard idiom of repetition, provide a summary of each pokemon and its kind,
%% representing each pairing of name and kind in the manner suggested by the redacted demo.
?- pokemon(name(Name),T,_,_),write('nks(name('),write(Name),write('),kind('),write(T),write('))'),nl,fail.
nks(name(pikachu),kind(electric))
nks(name(raichu),kind(electric))
nks(name(bulbasaur),kind(grass))
nks(name(ivysaur),kind(grass))
nks(name(venusaur),kind(grass))
nks(name(caterpie),kind(grass))
nks(name(metapod),kind(grass))
nks(name(butterfree),kind(grass))
nks(name(charmander),kind(fire))
nks(name(charmeleon),kind(fire))
nks(name(charizard),kind(fire))
nks(name(vulpix),kind(fire))
nks(name(ninetails),kind(fire))
nks(name(poliwag),kind(water))
nks(name(poliwhirl),kind(water))
nks(name(polywrath),kind(water))
nks(name(squirtle),kind(water))
nks(name(wartortle),kind(water))
nks(name(blastoise),kind(water))
nks(name(staryu),kind(water))
nks(name(starmie),kind(water))
false.

%% What is the name of the pokemon with the waterfall attack?
?- pokemon(name(Name),_,_,attack(waterfall,_)). 
N = wartortle

%% What is the name of the pokemon with the poison-powder attack?
?- pokemon(name(Name),_,_,attack(poison-powder,_)).
N = venusaur

%% By means of the standard idiom of repetition, list the names of the attacks of all of the water pokemon.
?- pokemon(_,water,_,attack(Attack,_)),write(Attack),nl,fail.
water-gun
amnesia
dashing-punch
bubble
waterfall
hydro-pump
slap
star-freeze
false.

%% How much damage (hp count) can poliwhirl absorb?
?- pokemon(name(poliwhirl),_,hp(HP),_).
HP = 80


%% How much damage (hp count) can butterfree absorb?
?- pokemon(name(butterfree),_,hp(HP),_).  
HP = 130

%%  By means of the standard idiom of repetition, list the names of all of the pokemon that can absorb
%% more than 85 units of damage
?- pokemon(name(Name),_,hp(HP),_), HP > 85, write(Name),nl,fail.
raichu
venusaur
butterfree
charizard
ninetails
polywrath
blastoise
false.

%% By means of the standard idiom of repetition, list the names of all of the pokemon that can dish
%% out more than 60 units of damage with one instance of their attack.
?- pokemon(_,_,_,attack(Name,DMG)), DMG>60,write(Name),nl,fail.
thunder-shock
poison-powder
whirlwind
royal-blaze
fire-blast
false.

%% By means of the standard idiom of repetition, list the names and the hit point value for each of the
%% creation ex nihilo” pokemon, with the results formatted as the redacted demo suggests.%%
?- cen(Name),pokemon(name(Name),_,hp(HP),_),write(Name),write(': '),write(HP),nl,fail.
pikachu: 60
bulbasaur: 40
caterpie: 50
charmander: 50
vulpix: 60
poliwag: 60
squirtle: 40
staryu: 40
false.