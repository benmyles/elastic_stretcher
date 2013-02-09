module ElasticStretcher
  class Client

    JNodeBuilder = org.elasticsearch.node.NodeBuilder

    class NodeClosedError < Error; end

    def initialize
      initialize_node_and_client
    end

    def client
      raise NodeClosedError if closed?
      @client
    end

    def prepare_bulk *args
      client.prepareBulk *args
    end

    def prepare_index *args
      client.prepareIndex *args
    end

    def close
      close_node
    end

    def closed?
      @closed
    end

  private

    attr_reader :node

    def initialize_node_and_client
      @node   = JNodeBuilder.nodeBuilder.client(true).node
      @client = @node.client
      @closed = false; @client
    end

    def close_node
      node.close
      @client = nil
      @node   = nil
      @closed = true
    end

  end # Client
end # ElasticStretcher