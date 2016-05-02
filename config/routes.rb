Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_up => 'registrar_usuario', :edit => 'editar_usuario', :sign_in => 'iniciar_sesion', :sign_out => 'cerrar_sesion'}

  scope(path_names: {index: 'listado', show: 'mostrar', new: 'nuevo',
                      edit: 'editar', create: 'crear', update: 'actualizar',
                      destroy: 'destruir'}) do
                        resources :categories, path: 'rubros'
                        resources :users, path: 'usuarios'
                        resources :stores, path: 'unidades'
                        resources :roles, path: 'roles'
                        resources :properties, path: 'centros'
                        resources :sales, path: 'ventas'
  end


  root to: 'sales#index'
end
