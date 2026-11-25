package privado is
    type target_t is private;
    function Asignar_blanco(x, y : Integer) return target_t;
    procedure Imprimir_blanco(T : target_t);
private
    type target_t is record
        x : Integer;
        y : Integer;
    end record;
end privado;