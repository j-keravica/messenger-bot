 module Messages
   class Thanks < Base

     BUZZ_WORDS = ["thanks", "thank", "tnx"]
     OPTIONS = [":*"]

     def options
       OPTIONS
     end
   end
 end
