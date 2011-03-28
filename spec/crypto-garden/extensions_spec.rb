# -*- encoding: utf-8 -*-

require 'spec_helper'

describe String do
  
  describe '#mod26' do
    it 'converts A to [0]' do
      'A'.mod26.should == [0]
    end

    it 'converts a to [0]' do
      'a'.mod26.should == [0]
    end

    it 'converts Z to [25]' do
      'A'.mod26.should == [0]
    end

    it 'converts a string into an array of numbers mod26' do
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.mod26.should == (0...26).to_a
    end
    
    it 'strips all white space' do
      "a b\t   c\nd".mod26.should == (0..3).to_a
    end
    
    it 'strips punctuation and non ascii letters' do
      'A!bc üd'.mod26.should == (0..3).to_a
    end
    
  end

  describe '#mod26!' do
    it 'converts all ascii letters regardless of letter-case but preservers everything else' do
      'A!bc üd'.mod26!.should == [0,'!',1,2,' ', 'ü',3]
    end
  end
  
end

describe Numeric do
  
  describe '#mod26' do
    
    it 'converts 0 to A' do
      0.mod26.should == 'A'
    end
    
    it 'converts 26 to A' do
      26.mod26.should == 'A'
    end

    it 'converts 0.0 to A' do
      0.0.mod26.should == 'A'
    end
    
    it 'converts -1 to Z' do
      -1.mod26.should == 'Z'
    end
    
    it 'converts 25 to Z' do
      25.mod26.should == 'Z'
    end
    
    it 'converts a number into the corresponding letter' do
      (0...26).map(&:mod26).join.should == 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    end
  end
  
end