require 'spec_helper'

describe 'lcs' do
  describe 'suffices' do
    it 'should return suffices of a string' do
      expect(suffices("test")).to  eq(["est", "st", "t", "test"])
    end
  end

  describe 'prefix_lcs' do
    it 'should return common sub-strings of two strings from the beginning' do
      expect(prefix_lcs("bcb","bc")).to eq("bc")
      expect(prefix_lcs("cb","cd")).to eq("c")
      expect(prefix_lcs("ae","cd")).to eq("")
    end
  end

  describe 'lcs' do
    it 'should return the longest common sub-string of two strings' do
      expect(lcs("abc", "bcd")).to eq("bc")
      expect(lcs("vbdfgtest1", "asdfasdtest2")).to eq("test")
    end
  end

end
