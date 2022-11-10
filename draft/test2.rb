module Examples
  module CustomTool
    class LineTool
      UI.menu('Plugins').add_item('test2') do Sketchup.active_model.select_tool(Examples::CustomTool::LineTool.new)
      end

      # Default code, use or delete...
      mod = Sketchup.active_model # Open model
      ent = mod.entities # All entities in model
      sel = mod.selection # Current selection
      
      SKETCHUP_CONSOLE.show
      SKETCHUP_CONSOLE.clear
      puts 1


      # path = File.dirname(__FILE__)
      # cursor_path = File.join(path, 'test2/assets/png/Pointer.png')

      # p cursor_path

      # cursor_id = nil
      # cursor_id = UI.create_cursor(cursor_path, 0, 0)

      # def onSetCursor
      #   UI.set_cursor(cursor_id)
      # end

      arr = Array.new
      active_path = Sketchup.active_model.active_path
      arr = active_path
      if (arr)
        arr.each {|i|
          if(i.is_a? Sketchup::ComponentInstance)
            p "Component selected"
            UI.beep
            #onSetCursor
          end
        }
      end

      puts 2

      
    end
  end
end




