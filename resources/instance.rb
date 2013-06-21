
actions :create
default_action :create

attribute :phpbb_app_name, kind_of: String, name_attribute: true, required: true
attribute :doc_root, kind_of: String, required: true
attribute :version, kind_of: String, default: '3.0.11'
attribute :db_name, kind_of: String, required: true
attribute :db_user, kind_of: String, required: true
attribute :db_password, kind_of: String, required: true
attribute :domain, kind_of: String, required: true
