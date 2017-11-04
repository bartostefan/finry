# frozen_string_literal: true

module TokensHelper
  def token_options
    [['All tokens', 0]] + Token.all.map { |t| [t.title, t.id] }
  end

  def truncate_token(token)
    truncate(token, length: 10)
  end
end
