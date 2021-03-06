# RSPEC SNIPPETS (DOES NOT INCLUDE CAPYBARA)
# credit to: https://www.udemy.com/course/testing-ruby-with-rspec
# Initialize RSpect (should create .rspect and spec/rspec_helper.rb)
rspect --init

# Command to run rspect test
rspec spec/card_spec.rb

# describe: group of examples (tests), can have argument or no argument
# it: creates a single example (test) (specify method will also do the same thing)
# expect: assertion

# Card.rb class for samples 1 & 2:
class Card
    attr_reader :type

    def initialize(type)
        @type = type
    end
end

# RSpec Sample 1, checking card type as a string
RSpect.describe 'Card' do
    it 'has a type' do
        card = Card.new('Ace of Spades')
        # expect card.type is equal to 'Ace of Spades'
        expect(card.type).to eq('Ace of Spades')
        # another sample: expect (1 + 1).to eq(2)
    end
end

# RSpec Sample 2, checking card type as a class (
# as a class: RSpect will pull in additional helper methods to use)
RSpect.describe Card do
    it 'has a type' do
        card = Card.new('Ace of Spades')
        # expect card.type is equal to 'Ace of Spades'
        expect(card.type).to eq('Ace of Spades')
        # another sample: expect (1 + 1).to eq(2)
    end
end

##########################################################################################
# Card.rb class for samples 3 & 4:
class Card
    # attr_reader :rank, :suit
    attr_accessor :rank, :suit

    def initialize(rank, suit)
        @rank = rank
        @suit = suit
    end
end

# RSpec Sample 3, checking card type as a class, isolating to minimize what's being tested 
# as one test, with RSpect hook (before(:example))
RSpect.describe Card do
    
    before(:example) do
        @card = Card.new('Ace', 'Spades')      
    end

    it 'has a rank' Card do
        expect(@card.rank).to eq('Ace')
    end

    it 'has a suit' Card do
        expect(@card.suit).to eq('Spades')
    end
end



# RSpec Sample 4, checking card type as a class, isolating, cleaner version
RSpect.describe Card do
    
    def card
        Card.new('Ace', 'Spades')   
    end

    it 'has a rank' Card do
        expect(card.rank).to eq('Ace')
    end

    it 'has a suit' Card do
        expect(card.suit).to eq('Spades')
    end
end

# RSpec Sample 4, checking card type as a class, isolating, cleaner version
# using let method
RSpect.describe Card do

    # value will be cached across multiple calls in the same example but not across examples
    # you can use more than one let method in a "describe" block
    let(:card) {Card.new('Ace', 'Spades')}
    # let(:x) { 1 + 1}
    # let(:y) { x + 10 }

    it 'has a rank' Card do
        expect(card.rank).to eq('Ace')
    end

    it 'has a suit' Card do
        expect(card.suit).to eq('Spades')
    end

    # example using a custom error message
    it 'has a custom error message' do
        comparison = 'spade'
        expect(card.suit).to eq(comparison), "Hey, I expected #{comparison} but got #{card.suit} instead"
    end
end