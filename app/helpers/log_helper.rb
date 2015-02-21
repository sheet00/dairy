module LogHelper

 def active?(name)
   return "active" if name == action_name
 end

end
