json.extract! lead, :id, :full_name, :cie_name, :email, :phone, :project_name, :project_description, :department_in_charge, :message, :attached_files, :created_at, :updated_at
json.url lead_url(lead, format: :json)
