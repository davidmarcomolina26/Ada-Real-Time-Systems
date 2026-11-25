with ada.text; use ada.text;
with Contadores; use Contadores;

procedure main is 
   --declaramos un contador
   C: contador;
begin
   --Inicializamos el contador
   inicializar(C);
   --Incrementamos el contador 3 veces y mostramos su valor
   for i in 1..3 loop
      incrementar (C);

      Put_line("Valor del contador: " & Integer'Image(valor(C)));

   end loop;

end main;
