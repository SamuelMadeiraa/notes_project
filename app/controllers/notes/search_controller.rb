class Notes::SearchController < ApplicationController
   def notes
     @notes = Note.all
   end
end
