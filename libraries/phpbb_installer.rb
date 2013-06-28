
include_recipe "phpbb::auto_install"

class PhpBBInstaller
  include Capybara::DSL
  attr_accessor :domain, :db_host, :db_name, :db_user, :db_password, :admin_name, :admin_pass1, :admin_pass2, :board_email1, :board_email2

  Capybara.run_server = false
  Capybara.default_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist

  def initialize(options={})
    @domain       = options.delete :domain
    @db_host      = options.delete :db_host
    @db_name      = options.delete :db_name
    @db_user      = options.delete :db_user
    @db_password  = options.delete :db_password
    @admin_name   = options.delete :admin_name
    @admin_pass1  = options.delete :admin_pass1
    @admin_pass2  = options.delete :admin_pass2
    @board_email1 = options.delete :board_email1
    @board_email2 = options.delete :board_email2
  end

  def install
    Capybara.app_host = @domain
    visit('/install/index.php?mode=install&language=en')
    click_button("Proceed to next step")
    click_button("Start install")

    fill_in "dbhost",   with: @db_host
    fill_in "dbname",   with: @db_name
    fill_in "dbuser",   with: @db_user
    fill_in "dbpasswd", with: @db_password

    fill_in "table_prefix", with: "forum_"
    click_button "Proceed to next step"

    click_button "Proceed to next step"

    fill_in "admin_name",   with: @admin_name
    fill_in "admin_pass1",  with: @admin_pass1
    fill_in "admin_pass2",  with: @admin_pass2
    fill_in "board_email1", with: @board_email1
    fill_in "board_email2", with: @board_email2
    click_button "Proceed to next step"
    click_button "Proceed to next step"
    click_button "Proceed to next step"

    fill_in "server_name", with: @domain
    click_button "Proceed to next step"
    click_button "Proceed to next step"
    click_button "Login"
  end
end
