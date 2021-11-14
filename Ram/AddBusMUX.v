module AddBusMUX(address, add_bus_sel);

    parameter ADDRESS_SIZE = 16;
    input add_bus_sel; // (STR || LDR) ? 1 : 0
    input [ADDRESS_SIZE - 1:0] address;

    always @ (*) 
    begin
        if (sel)
            
    end

endmodule



