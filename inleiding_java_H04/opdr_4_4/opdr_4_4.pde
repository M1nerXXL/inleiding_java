float percentage = 4.976142;

percentage *= 10;
percentage = round(percentage);
percentage /= 10;

println("Downloading...");
println();
print(percentage);
print("%");

//Is wel afgerond op een decimaal.
//4.976142 afronden op gehele getallen is 5,
//maar 4.976142 afronden op een decimaal is ook 5.
//Als het percentage 4.936142 was zou het afronden naar 4.9, de code klopt dus.
