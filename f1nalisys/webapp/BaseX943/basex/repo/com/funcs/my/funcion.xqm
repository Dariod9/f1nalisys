module namespace funcs = "com.funcs.my.funcion";

declare function funcs:curso($cname) as element()*
{
for $a in distinct-values(doc("cursos")//nome) where $a = $cname
return 
  <elem>
  {$a}
  </elem>
};
