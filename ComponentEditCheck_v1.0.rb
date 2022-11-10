module CustomTool

  #SKETCHUP_CONSOLE.show
  #SKETCHUP_CONSOLE.clear
  
  module Shared #shared var
    #load cursor image
    @@cursor_id = nil
    path = File.dirname(__FILE__)
    cursor_path = File.join(path, '/ComponentEditCheck/Pointer.png')
    p "cursor_path: ",cursor_path
    if cursor_path
    @@cursor_id = UI.create_cursor(cursor_path, 0, 0)
    end
    
    #current selection path
    @@lastArr = Array.new

    #component check bool 
    @@compoBool = false
  end
  
  class MySelectionObserver < Sketchup::SelectionObserver 
    include Shared
    
    def onSelectionBulkChange(selection)
      #SKETCHUP_CONSOLE.clear
      puts "onSelection: #{selection}"

      arr = Array.new
      active_path = Sketchup.active_model.active_path
      arr = active_path
      puts "active path: ",arr
      
      @@compoBool = false
      
      if (arr)
       arr.each {|i|
          if(i.is_a? Sketchup::ComponentInstance)
            puts "Component selected"
            UI.set_cursor(@@cursor_id)
            #UI.beep
            @@compoBool = true
          end #compo is_a loop end
        }
      end #if (arr) loop end
      
      puts "in any component? ",@@compoBool
    end # def end
  end # class end

  Sketchup.active_model.selection.add_observer(MySelectionObserver.new)
  

end #CustomTool end





