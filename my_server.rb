require "soap/rpc/standaloneServer"

class MyServer < SOAP::RPC::StandaloneServer
# Expose our services
  def initialize(*args)
      super(args[0], args[1], args[2], args[3])
      add_rpc_method(self, 'add', 'a', 'b')
      add_rpc_method(self, 'div', 'a', 'b')
  end

  # Handler methods
  def add(a, b)
     return a + b
  end
  def div(a, b)
     return a / b
  end
end

begin
  server = MyServer.new("MyServer",'urn:ruby:calculation', 'localhost', 9999)
  trap('INT'){
    server.shutdown
  }
  server.start
  rescue => err
  puts err.message
end

