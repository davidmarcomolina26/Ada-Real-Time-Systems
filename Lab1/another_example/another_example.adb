with Ada.Text_IO; use Ada.Text_IO;
procedure another_example is
    name: String(1 .. 20);
    length: Natural;
begin
    put("Enter your name: ");
    get_line(name, length); -- Reads up to 20 characters, updates 'length' with actual count.
    put_line("Hello, " & name(1 .. length) & "! The length is "  & Integer'Image(length));
end another_example;
