module CustomTool

  SKETCHUP_CONSOLE.show
  SKETCHUP_CONSOLE.clear
  
  module Shared
    @@lastArr = Array.new
    @@compoBool = false
  end
  
  class MyInstanceObserver < Sketchup::InstanceObserver
    include Shared
    def onOpen(instance)
      SKETCHUP_CONSOLE.clear
      puts "onOpen: #{instance}"

      arr = Array.new
      active_path = Sketchup.active_model.active_path
      arr = active_path
      puts "active path: ",arr
      
      UI.beep
      @@compoBool = true
      puts "in any component? ",@@compoBool
      
      
      
    end # def end
  end # class end

  
  Sketchup.active_model.definitions[0].instances[0].add_observer(MyInstanceObserver.new)

end #CustomTool end





