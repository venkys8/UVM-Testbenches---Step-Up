We are not using native I2C signals.

The set-up has I2C master controller that has SCL & SDA signals to access I2C memory.

We are controlling WR,ADDR,DIN,DOUT of I2C master controller 

1. Master to Slave
   a. Write
   Start -> send_addr -> get_ack -> send_data -> get_ack _> stop

   b. Read
   Start -> send_addr -> get_ack -> rec_data _> stop

2. Slave to Master
   a. Write
   detect_start -> store_addr -> send_ack -> store_data -> send_ack -> detect_stop

   b. Read
   detect_start -> store_addr -> send_ack -> send_data -> detect_stop

   
