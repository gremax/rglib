require 'spec_helper'

describe Rglib do
  it "has a version number" do
    expect(Rglib::VERSION).not_to be nil
  end

  subject(:author) { described_class.new("Chuck Norris", "Cool man") }

  describe Rglib::Author do
    it "should respond to name" do
      expect(author.name).to eq("Chuck Norris")
    end

    it "should respond to biography" do
      expect(author.biography).to eq("Cool man")
    end

    it "should respond to to_s method" do
      expect(author.to_s).to eq("Chuck Norris. Cool man")
    end
  end

  describe Rglib::Book do
    subject(:book) do
      described_class.new("101 of Chuck's Favorite Facts and Stories", author)
    end

    it "should respond to title" do
      expect(book.title).to eq("101 of Chuck's Favorite Facts and Stories")
    end

    it "should respond to author" do
      expect(book.author).to eq(author)
    end
  end
end
