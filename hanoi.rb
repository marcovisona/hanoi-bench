class Hanoi
  
  attr_accessor :execTime
  
  def initialize
    @stack1 = []
    @stack2 = []
    @stack3 = []
    
    @count = 0
  end
  
  def doGame(decks, quiet)
    @stack1.clear
    @stack2.clear
    @stack3.clear
    @count = 0
    @execTime=nil
    @quiet = quiet
    
    i=0;
    decks.times do 
      @stack1.push i
      i+=1
    end
    
    if !quiet
      print "Inizio\n"
      print "Stack1: " + @stack1.theStack.to_s + "\n"
      print "Stack2: " + @stack2.theStack.to_s + "\n"
      print "Stack3: " + @stack3.theStack.to_s + "\n"
    end
    
    startTime = Time.now
    hanoi(@stack1,@stack2,@stack3,@stack1.count)
    endTime = Time.now
    
    totalMoves = 2 ** decks -1
    @execTime = endTime - startTime
    
    if !quiet
      print "Fine\n"
      print "Stack1: " + @stack1.theStack.to_s + "\n"
      print "Stack2: " + @stack2.theStack.to_s + "\n"
      print "Stack3: " + @stack3.theStack.to_s + "\n"      
    end
      print "Decks:\t#{decks}\tTime:\t#{@execTime}\n"
  end
  
  def hanoi(source,dest,swap,depth)
    if depth == 1
      dest.push(source.pop)
      @count += 1
       
      if !@quiet
        print "Stack1: " + @stack1.theStack.to_s + "\n"
        print "Stack2: " + @stack2.theStack.to_s + "\n"
        print "Stack3: " + @stack3.theStack.to_s + "\n"      
      end
    else
      hanoi(source, swap, dest, depth - 1)
      dest.push(source.pop)
      @count += 1
      
      if !@quiet
        print "Stack1: " + @stack1.theStack.to_s + "\n"
        print "Stack2: " + @stack2.theStack.to_s + "\n"
        print "Stack3: " + @stack3.theStack.to_s + "\n"      
      end
      hanoi(swap, dest, source, depth - 1)  
    end
    
  end
  
end



print "hanoi\n"
h = Hanoi.new
decks = ARGV[0].to_i

h.doGame(decks, true)

# (1..3).each do |i|
#   h.doGame(i, true)
# end
