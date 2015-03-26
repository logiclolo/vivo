class Capability

   def initialize(k, path)

     @input = k
     @filePath = Rails.root + path + 'config_capability.xml'
     @f = File.open(@filePath, "w+")
     @content='<?xml version="1.0" standalone="yes"?>' + "\n"
     @content+='<root>' + "\n"
     @content+='<capability>' + "\n"
     
     @content+="<bootuptime>#{@input.bootuptime}</bootuptime>"+ "\n"
     
     @content+='</capability>' + "\n"
     @content+='</root>' + "\n"
     @f.write(@content)   
     @f.close()       
   end
end
