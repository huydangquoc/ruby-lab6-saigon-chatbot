class LanguageBot < SlackRubyBot::Bot
  command 'hello' do |client, data, match|
    user = User.find_or_create_by(username: data.user)
    I18n.locale = user.locale
    text = I18n.t "hello", user: data.user
    client.say(text: text, channel: data.channel)
  end

  command 'locale' do |client, data, match|
    user = User.find_or_create_by(username: data.user)
    if match[3] != nil
      user.locale = match[3]
      user.save!
    end

  end
end
