# TV Show Review App

## MODELS

#### User 
>   has many reviews    
    has a secure password   
    is unique   
        attr: username   
        attr: email      
        attr: password      

#### TV Show 
>   has many reviews    
        is unique   
            attr :name  

#### Review
>   belongs to user      
        belongs to show     
            attr: content      
            attr: rating                
            foreign_key :show_id            
            foreign_key: user_id        

## CONTROLLERS

#### Application
>-   '/'         
        - shows index   

#### User
>-   get '/signup'   
        - shows user/signup 
>-    get '/login'    
        - shows user/login  
>-    post '/logout'  
        - clear session     
        - redirect /

#### Show
>-   get '/shows/:id'    
        - shows show/show      
>-    get '/shows/new'    
        - shows show/new 
>-    post '/shows'   
        - create new show    
        - redirect show/:id

#### Review 
>-   get '/reviews/:id'      
        - shows reviews/show     
>-    get '/reviews/:id/edit'     
        - shows reviews/edit        
>-    get '/reviews/new'      
        - shows/reviews/new         
>-    patch '/reviews/:id'        
        -updates reviews with id == :id     
        -redirect '/reviews/:id'        
>-    post 'reviews'      
        - creates new review        
        - redirect '/reviews/:id'       
>-    delete '/reviews/:id/delete'        
        - deletes review with id == :id     

## VIEWS 

#### Index 
>-   show latest reviews      
        show registration?

#### User
>-   action: create new user     
        view > see all reviews

#### Video Game
>-   show.erb > see all reviews for this show        
>-    new erb > action: create show > post to /shows

#### Review
>-   show.erb > action: delete review if owner > delete to /reviews/:id/delete       
                >- link_to: /reviews/:id/edit if owner       
>-  edit.erb > action: update review if owner > patch to /reviews/:id       
>-  new.erb > action: create review > post to  /reviews     