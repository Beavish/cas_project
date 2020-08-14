class Kieran_gem

  def self.hi(text)
    
    @result = text


    @words = []
    @cleanWords =[]  
  
    @result.each do |x|
     #words = []
     #@cleanWords =[]
      #get the values only from the hash
      values = x.values
    
      #convert it to string 
      strValue = values.to_s
      #to utf 8
      encodedValue = strValue.gsub(160.chr("UTF-8"),"") # this beautiful little function removes &nbsp; -> LIFE SAVER
      #puts encodedValue
      # remove html tags
      rmvHtml = encodedValue.gsub(/(<[^>]*>)|\n|\t/s) {""}  
      
      # remove additional chars
      rmvExtraChars = rmvHtml.tr('[]',"")
      # still some chars left, gotta get rid of them
      again = rmvExtraChars.delete('\\"')
      #split each by white space
      #word = again.split(' ')
      #word is an array covert back to string
      newWord =again.to_s
      @words.push(newWord)
      end
      #p @words
      @words.each do |ugh|
       dog = ugh.split(" ")
        dog.each do |mouse|
          @cleanWords.push(mouse)
         #p @cleanWords
        end
      end
      p @cleanWords
  end
end