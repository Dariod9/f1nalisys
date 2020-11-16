module namespace f1_methods = "com.f1";

declare function f1_methods:constructors($ano) as element()*
{
 for $c in collection('f1')//ConstructorTable where $c/@season=$ano return $c
};

declare function f1_methods:tracks() as element()*
{
 <root>{for $c in collection('f1')//Circuit return <elem> {$c/CircuitName} {$c/Location} </elem>}</root>
};

declare function f1_methods:drivers($ano) as element()*
{
 for $p in collection('f1')//DriverTable where $p/@season=$ano return $p
};
 
declare function f1_methods:driver_standings($ano) as element()*
{
 for $c in collection('f1')//StandingsTable where $c/@season=$ano where $c//child::DriverStanding return $c
};

declare function f1_methods:race_results($ano, $round) as element()*
{
  for $c in collection('f1')//RaceTable where $c/@season=$ano where $c/@round=$round where $c//child::ResultsList return $c
};
 
declare function f1_methods:team_standings($ano) as element()*
{
 for $c in collection('f1')//StandingsTable where $c/@season=$ano where $c//child::ConstructorStanding return $c
};

declare function f1_methods:season($ano) as element()*
{
 <Races>{ for $a in collection('f1')//RaceTable[not(descendant::ResultsList)] where $a/@season =$ano return $a/Race }</Races>
};

declare function f1_methods:top3_drivers($ano) as element()*
{
 <root>{ for $c in collection('f1')//StandingsTable where $c/@season=$ano return $c//DriverStanding[position() < 4] }</root>
};

declare function f1_methods:top3_teams($ano) as element()*
{
 <root>{ for $c in collection('f1')//StandingsTable where $c/@season=$ano return $c//ConstructorStanding[position() < 4] }</root>
};

declare function f1_methods:rss() as element()*
{
 <root>{ for $i in collection('f1')//item[position()<6] return <elem> {$i/title} {$i/pubDate} {$i/author} {$i/link} {$i/description} </elem>} </root>
};
