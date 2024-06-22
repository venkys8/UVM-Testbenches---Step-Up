class rand_din_rst extends uvm_sequence#(transaction);
`uvm_object_utils(rand_din_rst)
  
    transaction tr;
 
   function new(input string path = "rand_din_rst");
    super.new(path);
   endfunction
   
   
   virtual task body(); 
   repeat(15)
     begin
         tr = transaction::type_id::create("tr");
         start_item(tr);
         assert(tr.randomize());
         `uvm_info("SEQ", $sformatf("rst : %0b  din : %0b  dout : %0b", tr.rst, tr.din, tr.dout), UVM_NONE);
         finish_item(tr);     
     end
   endtask
 
endclass
