class OpenLibraryService
  include HTTParty
  base_uri 'openlibrary.org'
  def initialize
    @options = { query: { format: 'json', jscmd: 'data' } }
  end

  def book_info(isbn)
    ibsn_formatted = 'ISBN:'.concat(isbn)
    @options[:query][:bibkeys] = ibsn_formatted
    response = self.class.get('/api/books', @options)
    json_data = JSON.parse response.body
    json_data = json_data[ibsn_formatted]
    { ibsn: isbn, title: json_data['title'], subtitle: json_data['subtitle'],
      number_of_pages: json_data['number_of_pages'], authors: json_data['authors'] }
  end
end
