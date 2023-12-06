# app/controllers/pdfs_controller.rb

class PdfsController < ApplicationController
    def generate_pdf
      @post = Post.find(params[:id])
  
      respond_to do |format|
        format.pdf do
          pdf = Prawn::Document.new
  
          # Customize the PDF content and styling
          pdf.text "Customized PDF for Post", style: :bold, size: 18, align: :center
          pdf.move_down 10
  
          pdf.text "Post Title:", style: :bold, align: :center
          pdf.text @post.title
          pdf.move_down 10
  
          pdf.text "Post Body:", style: :bold, align: :center
          pdf.text @post.body
          pdf.move_down 10
  
          pdf.text "Post Number:", style: :bold, align: :center
          pdf.text @post.number.to_s
          pdf.move_down 10
  
          # Add additional customization as needed
  
          # Send the generated PDF inline (in the browser)
          send_data pdf.render, filename: 'custom_post.pdf', type: 'application/pdf', disposition: 'inline'
        end
      end
    end
  end
  