
# mysql -uroot -prootpass -Nse 'drop database phpbb3'
# rm -rf /var/www/phpbb3

require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'launchy'

Capybara.run_server = false
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.app_host = 'http://phpbb.local'

class Installer
  include Capybara::DSL

  def replacedb
    visit('/install/index.php?mode=install&language=en')
    click_button("Proceed to next step")
    click_button("Start install")

    fill_in "dbhost", with: "localhost"
    fill_in "dbname", with: "phpbb3"
    fill_in "dbuser", with: "phpbb_usr"
    fill_in "dbpasswd", with: "sekret"

    fill_in "table_prefix", with: "forum_"
    click_button "Proceed to next step"

    click_button "Proceed to next step"

    fill_in "admin_name",   with: "admin"
    fill_in "admin_pass1",  with: "sekret"
    fill_in "admin_pass2",  with: "sekret"
    fill_in "board_email1", with: "admin@example.com"
    fill_in "board_email2", with: "admin@example.com"
    click_button "Proceed to next step"
    click_button "Proceed to next step"
    click_button "Proceed to next step"

    fill_in "server_name", with: "phpbb.local"
    click_button "Proceed to next step"
    click_button "Proceed to next step"
    click_button "Login"
  end
end

Installer.new.replacedb

