Rails.application.routes.draw do

  resources :posts do
    member do
      get 'generate_pdf', to: 'pdfs#generate_pdf'
    end
  end
end
