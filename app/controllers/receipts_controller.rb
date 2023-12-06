# app/controllers/receipts_controller.rb
class ReceiptsController < ApplicationController
    def generate_pdf
      @order = Order.find(params[:id]) # Assuming you have an Order model
  
      respond_to do |format|
        format.pdf do
          pdf = Prawn::Document.new
          pdf.text "Receipt for Order ##{order.id}"
          pdf.text "Date: #{order.created_at.strftime('%B %e, %Y')}"
          # Add more content as needed
  
          send_data pdf.render, filename: "receipt_#{order.id}.pdf", type: 'application/pdf'
        end
      end
    end
  end
  