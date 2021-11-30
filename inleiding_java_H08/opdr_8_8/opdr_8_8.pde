long a = 0;
long b = 1;
long c;
println(a);
println(b);
for(int i=0; i<20; i++){
  c = a+b;
  println(c);
  a = b;
  b = c;
}
