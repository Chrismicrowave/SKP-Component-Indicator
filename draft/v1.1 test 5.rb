module CustomTool
  


  
  SKETCHUP_CONSOLE.show
  SKETCHUP_CONSOLE.clear
  
  module Shared
    @@cursor_id = nil
    path = File.dirname(__FILE__)
    cursor_path = File.join(path, 'ComponentEditCheck/Pointer.png')
    p "cursor_path: ",cursor_path
    @@cursor_id = UI.create_cursor(cursor_path, 1, 1)
    
    @@lastArr = Array.new
    @@compoBool = false
    
    
    #dialog.set_url("http://www.sketchup.com")
  
  end
  
  class MySelectionObserver < Sketchup::SelectionObserver
    include Shared
    def initialize
      @dialog = UI::WebDialog.new("Show sketchup.com", true,
  "ShowSketchupDotCom", 739, 641, 150, 150, true);
    end
    
    def onSelectionBulkChange(selection)
      SKETCHUP_CONSOLE.clear
      puts "onSelection: #{selection}"

      arr = Array.new
      active_path = Sketchup.active_model.active_path
      arr = active_path
      puts "active path: ",arr
      
      @@compoBool = false
      @dialog.close
      
      if (arr)
       arr.each {|i|
          if(i.is_a? Sketchup::ComponentInstance)
            puts "Component selected"
            UI.set_cursor(@@cursor_id)
            #UI.beep
            @@compoBool = true
            
            @dialog.show
          else 
          
          end #compo is_a loop end
        }
      end #if (arr) loop end
      
      puts "in any component? ",@@compoBool
    end # def end
  end # class end

  Sketchup.active_model.selection.add_observer(MySelectionObserver.new)
  

end #CustomTool end





