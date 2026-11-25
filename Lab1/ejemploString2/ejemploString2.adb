-- Ejemplo de Ada.Text_IO con strings
with Ada.Text_IO; use Ada.Text_IO;

procedure ejemploString2 is

    -- Creacion de ejemplares, para la entrada / salida de numeros,
    -- a partir de los paquete genericos " Ada . Text_Io . Integer_Io "
    -- y " Ada . Text_Io . Float_Io ".
    package ES_int is new Ada.Text_Io.Integer_Io(Integer);
    package ES_float is new Ada.Text_Io.Float_Io(Float);

    -- Creacion de ejemplares , para la entrada / salida de un
    -- enumerado definido por nosotros
    -- tipo definido por nosotros
    type dia_t is ( LUN , MAR , MIE , JUE , VIE , SAB , DOM );
    package ES_dia_t is new Ada.Text_Io.Enumeration_Io( dia_t );

    
    s1: String(1 .. 2);           
    s2: String(1 .. 3);    
    hoy: dia_t;
begin
       put("Introduce el día de la semana : ");

       -- Al ser la cadena s1 de longitud 2 lee los 2 primeros
       ES_dia_t.get(hoy);
       put("El día de la semana es: ");
       ES_dia_t.put(hoy);

end ejemploString2; 
