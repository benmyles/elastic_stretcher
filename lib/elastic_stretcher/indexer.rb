module ElasticStretcher
  class Indexer
    attr_reader :client, :documents

    def initialize client, documents
      @client    = client
      @documents = documents
    end

    def index
      bulk_request = client.prepare_bulk

      documents.each do |doc|
        bulk_request.add client.prepare_index(doc[:index], doc[:type], doc[:id] || generate_id)
                               .setSource(JSON doc[:data])
      end

      bulk_response = bulk_request.execute.actionGet
      !bulk_response.hasFailures
    end

  private

    def generate_id
      BSON::ObjectId.new.to_s
    end
  end # Indexer
end # ElasticStretcher