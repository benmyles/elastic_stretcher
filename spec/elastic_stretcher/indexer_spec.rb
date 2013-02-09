require_relative '../spec_helper'

describe Indexer do

  it "can index documents" do
    client = Client.new

    documents = [
      { id:     "1",
        index:  "elastic_stretcher_test_article",
        type:   "article",
        data:   { title: "Foo Bar", tags: ["zig", "zag"], time: Time.now } },
      { id:     "2",
        index:  "elastic_stretcher_test_article",
        type:   "article",
        data:   { title: "Bar Foo", tags: ["zag", "zig"], time: Time.now } }
    ]

    indexer = Indexer.new client, documents
    indexer.index.must_equal true

    client.close
  end

end