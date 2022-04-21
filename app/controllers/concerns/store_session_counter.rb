module StoreSessionCounter

  def drop_session_counter
    session[:counter] = nil
    @store_session_counter = session[:counter]
  end

	def store_session_counter
    if session[:counter].nil?
      session[:counter] = 0
    end

    session[:counter] += 1
    @store_session_counter = session[:counter]
  end

end