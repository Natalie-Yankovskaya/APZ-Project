class ApplicationController < ActionController::API
  def get_current_user
    return render json: { status: STATUS['bad_request'], message: 'invalid_tokend' } if bearer_token.nil?

    puts bearer_token
    decoded_token = JWT.decode(bearer_token, CONFIG_SECRET['hmac_secret'], true, { algorithm: 'HS256' })[0]
    if decoded_token['id'].nil? && decoded_token['time'].nil?
      render json: { status: STATUS['bad_request'], message: 'invalid_token' }
    else
      @current_user = Worker.find_by(id: decoded_token['id'])
      return render json: { status: STATUS['not_found'], message: 'user_not_found' } if @current_user.nil?

      # TODO: fix this time
      if decoded_token['time'] + 60 < Time.now.utc.to_i || Time.now.utc.to_i + 60 < decoded_token['time']
        render json: { status: STATUS['bad_request'], message: 'request expired' }
      end
    end
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header&.match(pattern)
  end
end
