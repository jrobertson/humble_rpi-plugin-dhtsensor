#!/usr/bin/env ruby

# file: humble_rpi-plugin-dhtsensor.rb


require 'dht-sensor-ffi'


class HumbleRPiPluginDhtSensor
  

  def initialize(settings: {}, variables: {})

    @pin = settings[:pin]
    
    if @pin.nil? then
      raise 'HumbleRPiPluginDhtSensor: settings error: please supply a pin'
    end
    
    h = {
      version: 11,
      temperature_threshold: 1,
      humidity_threshold: 2,
      interval: 3,
      msg_format: "%s/dht11_sensor: temperature: %s humidity: %s",
      pushrate: 60
    }.merge settings
    
    @version = h[:version]
    @temperature_threshold = h[:temperature_threshold]
    @humidity_threshold = h[:humidity_threshold]
    @interval = h[:interval]
    @msg_format = h[:msg_format]
    @pushrate = h[:pushrate]
    
    @notifier = variables[:notifier]
    @device_id = variables[:device_id] || 'pi'
    
  end

  def start()
    
    puts 'ready to monitor temperature and humidity'
    
    val = DhtSensor.read(@pin, @version)
    push val
    last_push = Time.now
    
    loop do
      
      val = DhtSensor.read(@pin, @version)

      if last_push + @pushrate < Time.now and \
            ((@old_tval - val.temperature).abs >= @temperature_threshold or \
                    (@old_hval - val.humidity).abs >= @humidity_threshold) then
        push val
        last_push = Time.now
      end      

      sleep @interval
      
    end
          
  end
  
  alias on_start start

  private
  
  def push(val)
    
    @notifier.notice @msg_format % [@device_id, val.temperature, val.humidity]
    @old_tval = val.temperature
    @old_hval = val.humidity        
    
  end
  
end