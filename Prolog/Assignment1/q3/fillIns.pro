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
?- <<Query 8>>
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
?- <<Query 9>>
bulbasaur --> venusaur
caterpie --> butterfree
charmander --> charizard
poliwag --> poliwrath
squirtle --> blastoise
false.

%% : By means of hand intervention, list all triples of pokemon such that the first evolves into the second
%% and the second evolves into the third. %%
?- <<Query 10>>
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

?- <<Query 11>>
charmander
charmeleon
charizard
vulpix
ninetails
false.
?- <<Query 12>>
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
?- <<Query 13>>
N = wartortle
?- <<Query 14>>
N = venusaur
?- <<Query 15>>
water-gun
amnesia
dashing-punch
bubble
waterfall
hydro-pump
slap
star-freeze
false.
?- <<Query 16>>
HP = 80
?- <<Query 17>>
HP = 130
?- <<Query 18>>
raichu
venusaur
butterfree
charizard
ninetails
polywrath
blastoise
false.
?- <<Query 19>>
thunder-shock
poison-powder
whirlwind
royal-blaze
fire-blast
false.
?- <<Query 20>>
pikachu: 60
bulbasaur: 40
caterpie: 50
charmander: 50
vulpix: 60
poliwag: 60
squirtle: 40
staryu: 40
false.