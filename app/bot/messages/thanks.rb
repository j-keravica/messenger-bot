 module Messages
   class Thanks < Base

     BUZZ_WORDS = ["thanks", "thank", "tnx"]

     def options
       [":*"]
     end
   end
 end
