require "rubygems"
require "bunny"
require "json"
class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  


  def new
    @ctoken = gateway.client_token.generate()
   # puts @ctoken
     # Returns a connection instance
      conn = Bunny.new('amqp://pcmdmyji:mwukPxVFjdlzhH3RdgpVIafzwI2zjavH@bonobo.rmq.cloudamqp.com/pcmdmyji')
      # The connection is established when start is called
      conn.start

      # create a channel in the TCP connection
      ch = conn.create_channel

      # Declare a queue with a given name, examplequeue. In this example is a durable shared queue used.
      q  = ch.queue("examplequeue", :durable => true)

      # Bind a queue to an exchange
      x = ch.direct("example.exchange", :durable => true)
      q.bind(x, :routing_key => "process")

      # Publish a message
      information_message = "{\"email\": \"example@mail.com\",\"name\": \"name\",\"size\": \"size\"}"

      x.publish(information_message,
        :timestamp      => Time.now.to_i,
        :routing_key    => "process"
      )
      sleep 1.0
      conn.close
     

  end


  def show
    @transaction = gateway.subscription.find(params[:id])
        # Returns a connection instance    
    #p @transaction
    #@result = _create_result_hash(@transaction)
  end

  def create
   # amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]
    first_name =params["first_name"]
    last_name = params["last_name"]
    email = params["email"]

    result = gateway.customer.create(
      :first_name => first_name,
      :last_name => last_name,
      :email => email,
      :payment_method_nonce => nonce
    )
    

    if result.success?
      #redirect_to checkout_path(result.customer.id)
      token = result.customer.credit_cards[0].token
      
      # lets create a subscription

      newSubscription = gateway.subscription.create(
        :payment_method_token => token,
        :plan_id => "KieransPlan",
      )   
    # add subscription to the current user
    id = current_user.id
    @user = User.find(id)

    @user.update_columns(subsId:newSubscription.subscription.id)

    #@user.subsId = newSubscription.subscription.id
        
    if newSubscription.success?
      redirect_to checkout_path(newSubscription.subscription.id)
      conn = Bunny.new('amqp://pcmdmyji:mwukPxVFjdlzhH3RdgpVIafzwI2zjavH@bonobo.rmq.cloudamqp.com/pcmdmyji')
      # The connection is established when start is called
      conn.start

      # Create a channel in the TCP connection
      ch = conn.create_channel
      # Declare a queue with a given name, examplequeue. In this example is a durable shared queue used.
      q  = ch.queue("examplequeue", :durable => true)

      # Method for the PDF processing
      def pdf_processing(json_information_message)
        puts "Handling pdf processing for "
        puts json_information_message['email']
        sleep 5.0
        puts "pdf processing done"
      end

      # Set up the consumer to subscribe from the queue
      q.subscribe(:block => true) do |delivery_info, properties, payload|
        json_information_message = JSON.parse(payload)
        pdf_processing(json_information_message)
        sleep 1.0
        conn.close
      end
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
      
      # end of subscription create
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
  end

  def _create_result_hash(transaction)
    

    if !@transaction.nil?
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of . See the Braintree API response and try again."
      }
    end
  end

  def gateway
    @gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => 'g82dbc9xdvtp4yx9',
      :public_key => '7gnp3pdhks7bfsr6',
      :private_key => 'c35c38c1ce0eb6b9643e273347de08fa',
    )
    end
    
   
   
  
end
