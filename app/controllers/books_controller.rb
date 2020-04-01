class BooksController < ApplicationController
  def top
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def create
  	@book = Book.new(book_params)
  	@books = Book.all
  	
  	respond_to do |format|
  		if @book.save
  			#flash[:complete] = "created item!"
  			format.html{redirect_to @book, notice: "Book was successfully created."}
  			#format.json { render :show, status: :created, location: @book }
  		else
  			format.html{render :index}
  			#format.html{render :new}
  			#format.json { render json: @book.errors, status: :unprocessable_entity }
  		end
  	end
  end


  	#if @book.save
  	#	redirect_to @book, notice : 'succes'
  	#else
  	#	render :new
  	#end
 

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	# book.update(book_params)
  	# redirect_to book_path(book)
  	
  	
  	@book = Book.find(params[:id])
  	respond_to do |format|
  		if @book.update(book_params)
  			#flash[:complete] = "created item!"
  			format.html{redirect_to @book, notice: "Book was successfully updated."}
  			#format.json { render :show, status: :created, location: @book }
  		else
  			format.html{render :edit}
  			#format.json { render json: @book.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	# redirect_to books_path
  	respond_to do |format|
  		if book.destroy
  			#flash[:complete] = "created item!"
  			format.html{redirect_to books_path, notice: "Book was successfully destroyed."}
  			#format.json { render :show, status: :created, location: @book }
  		else
  			format.html{render :index}
  			#format.json { render json: @book.errors, status: :unprocessable_entity }
  		end
  	end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
