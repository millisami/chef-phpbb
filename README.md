# chef-phpbb cookbook

This cookbook provides an LWRP to setup PhpBB app

# Requirements

# Usage

Add `phpbb` as dependency in your cookbook's metadata file.

    depends 'phpbb'

Now you can use the following LWRP in your cookbook's recipe.

    phpbb_instance "phpbb1" do
      doc_root "/var/www/phpbb-app"
      db_name "phpbb_db"
      db_user "phpbb_user"
      db_password "phpbb_passwd"
      domain "phpbb.local"
      settings do
        admin_name "admin"
        admin_password "sekret"
        board_email_1 "admin1@example.com"
        board_email_2 "admin2@example.com"
      end
    end

# Attributes

# Recipes

# Author

Author:: Millisami (<millisami@gmail.com>)
