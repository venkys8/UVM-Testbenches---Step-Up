typedef enum bit [1:0]   {readd = 0, writed = 1, rst = 2} oper_mode;
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "apb_config.sv"
`include "transaction.sv"
`include "write_data.sv"
`include "read_data.sv"
`include "write_read.sv"
`include "writeb_readb.sv"
`include "write_err.sv"
`include "read_err.sv"
`include "reset_dut.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"

module tb;
  
  
  apb_if vif();
  
  apb_ram dut (.presetn(vif.presetn), .pclk(vif.pclk), .psel(vif.psel), .penable(vif.penable), .pwrite(vif.pwrite), .paddr(vif.paddr), .pwdata(vif.pwdata), .prdata(vif.prdata), .pready(vif.pready), .pslverr(vif.pslverr));
  
  initial begin
    vif.pclk <= 0;
  end
 
   always #10 vif.pclk <= ~vif.pclk;
 
  
  
  initial begin
    uvm_config_db#(virtual apb_if)::set(null, "*", "vif", vif);
    run_test("test");
   end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end 
endmodule
