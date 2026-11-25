with Ada.Text_IO ; -- Incluimos el paquete Text_IO de Ada
use Ada.Text_IO ;  -- Es similar a namespace en C ++

procedure Puntuacion is
    package ES_int is new Ada.Text_Io.Integer_Io(Natural);  -- Instanciamos un paquete a partir del generico Text_Io.Integer_Io que maneja Naturales
    
    canastas2 : Natural;
    triples : Natural;
    libres : Natural;
begin
    Put("Introduce el número de canastas de 2: ");
    ES_int.Get(canastas2);                            -- Lee un valor entero
    set_col(50);                                      -- Posiciona el cursor en la columna 50
    Put("Has introducido: ");                         -- Muestra un mensaje
    ES_int.Put(canastas2);                            -- Muestra el valor introducido
    New_line(1);                                      -- Salta N líneas
    Put("Introduce el número de canastas de 3: ");    -- Muestra un mensaje
    ES_int.Get(triples);                              -- Lee un valor entero   
    set_col(5);                                       -- Posiciona el cursor en la columna 5
    Put("Has introducido: ");                         -- Muestra un mensaje
    ES_int.Put(triples);                              -- Muestra el valor introducido
    New_line(1);                                      -- Salta N líneas
    Put("Introduce el número de tiros libres: ");     -- Muestra un mensaje
    ES_int.Get(libres);                               -- Lee un valor entero
    set_col(5);                                       -- Posiciona el cursor en la columna 5
    Put("Has introducido: ");                         -- Muestra un mensaje
    ES_int.Put(libres);                               -- Muestra el valor introducido
    New_line(2);                                      -- Salta N líneas

    -- Muestra el resultado y hace un casting explícito a STRING de la suma de triples, canastas de 2 y tiros libres
    Put("Los puntos totales son: " & Integer'image(triples*3+canastas2*2+libres));    
  exception
      when DATA_ERROR =>
          New_line(2);
          Put("Debes introducir un valor válido");
end Puntuacion ;
