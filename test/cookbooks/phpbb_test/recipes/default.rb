
# Test recipe

phpbb_instance "phpbb1" do
  doc_root "/var/www/phpbb1"
  db_name "phpbb1_db"
  db_user "phpbb1_user"
  db_password "phpbb1_passwd"
  domain "phpbb1.local"
end

