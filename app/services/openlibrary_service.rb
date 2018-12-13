class OpenLibraryService
  include HTTParty
  base_uri 'openlibrary.org'
  def book_info(isbn)
    @isbn = isbn
    response = self.class.get('/api/books', request_body)
    parsing_isbn_response(response)
  end

  def request_body
    { query: { format: 'json', jscmd: 'data', bibkeys: ibsn_formatted } }
  end

  def parsing_isbn_response(response)
    json_data = JSON.parse response.body
    json_data = json_data[ibsn_formatted]
    { ibsn: isbn, title: json_data['title'], subtitle: json_data['subtitle'],
      number_of_pages: json_data['number_of_pages'], authors: json_data['authors'] }
  end

  def ibsn_formatted
    'ISBN:'.concat(@isbn)
  end
end
