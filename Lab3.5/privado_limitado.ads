package privado_limitado is
    type target_t is limited private;
    procedure Asignar_blanco(x, y : Integer; T : out target_t);
    procedure Imprimir_blanco(T : target_t);
private
    type target_t is record
        x : Integer;
        y : Integer;
    end record;
end privado_limitado;