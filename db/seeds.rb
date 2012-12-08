# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Rol.delete_all

#
# Roles
#
Rol.delete_all

roles = [{:nombre => 'Administrador', :descripcion => 'Administrador'},
          {:nombre => 'Director', :descripcion => 'Director'},  
          {:nombre => 'Psicologo', :descripcion => 'Psicologo'},
          {:nombre => 'Recepcionista', :descripcion => 'Recepcionista'},
          {:nombre => 'Profesor', :descripcion => 'Profesor'},
          {:nombre => 'Estudiante', :descripcion => 'Estudiante'}
  ]
  
roles.each do |rol|
  Rol.create!(rol)
end

#
# Usuarios
#
Usuario.delete_all
id_rol_administrador = Rol.find_by_nombre(:Administrador).id

usuarios = [{:usuario => 'admin', :nombre => 'General', :apellido1 => 'Usuario', :apellido2 => 'Administrador', :correo_electronico => 'admin@sccp.sa.cr', :rol_id => id_rol_administrador, :password => "admin", :password_confirmation => "admin" }
  ]
  
usuarios.each do |usuario|
  Usuario.create!(usuario)
end

Consultorio.delete_all

#
# Consultorio
#
Consultorio.delete_all

consultorios = [{:numero_consultorio => 'Consultorio B', :proposito => 'Tratamientos relajacion'},
                {:numero_consultorio => 'Consultorio 1', :proposito => 'Consultorio 1'},  
                {:numero_consultorio => 'Consultorio 3', :proposito => 'Atencion de infantes'},
                {:numero_consultorio => 'Consultorio 4', :proposito => 'Consultorio 4'},
                {:numero_consultorio => 'Consultorio 5', :proposito => 'Tratamientos relajacion'},
                {:numero_consultorio => 'Consultorio 6', :proposito => 'Consultorio 6'}
  ]
  
consultorios.each do |consultorio|
Consultorio.create!(consultorio)
end

