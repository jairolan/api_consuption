module Gallery
  class Service
    attr_reader :users, :pages, :errors, :current_page

    def initialize(current_page = 1)
      @users = []
      @errors = nil
      @pages = 0
      @current_page = current_page
    end

    def call
      response(request)
    rescue StandardError => e
      @errors = "Ha ocurrido un error: #{e}"
    end

    def request
      HTTParty.get('https://reqres.in/api/users')
    end

    def response(res)
      body = JSON.parse(res.body)
      @pages = body['total_pages']
      @users = body['data']
    end
  end
end
