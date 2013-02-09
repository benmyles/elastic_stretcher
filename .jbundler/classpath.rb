JBUNDLER_CLASSPATH = []
JBUNDLER_CLASSPATH << '/Users/ben/.m2/repository/org/elasticsearch/elasticsearch/0.20.4/elasticsearch-0.20.4.jar'
JBUNDLER_CLASSPATH << '/Users/ben/.m2/repository/org/apache/lucene/lucene-core/3.6.2/lucene-core-3.6.2.jar'
JBUNDLER_CLASSPATH << '/Users/ben/.m2/repository/org/apache/lucene/lucene-analyzers/3.6.2/lucene-analyzers-3.6.2.jar'
JBUNDLER_CLASSPATH << '/Users/ben/.m2/repository/org/apache/lucene/lucene-queries/3.6.2/lucene-queries-3.6.2.jar'
JBUNDLER_CLASSPATH << '/Users/ben/.m2/repository/jakarta-regexp/jakarta-regexp/1.4/jakarta-regexp-1.4.jar'
JBUNDLER_CLASSPATH << '/Users/ben/.m2/repository/org/apache/lucene/lucene-memory/3.6.2/lucene-memory-3.6.2.jar'
JBUNDLER_CLASSPATH << '/Users/ben/.m2/repository/org/apache/lucene/lucene-highlighter/3.6.2/lucene-highlighter-3.6.2.jar'
JBUNDLER_CLASSPATH.freeze
JBUNDLER_CLASSPATH.each { |c| require c }
