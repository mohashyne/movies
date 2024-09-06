module LikesHelper


def  like_or_unlike_count(movie, like, likers)

if like  
button_to "★ Unlike (#{likers.size})", movie_likes_path(movie, like), method: :delete,  class: "like-button"
else  
# We are going to use a button_to coz a link_to takes you tto somewhere and a button changes somthing
# we don't need to add POST verb here because botton_to uses post by default
button_to "★ Like (#{likers.size})", movie_likes_path(movie),  class: "like-button"
end 
end


end
