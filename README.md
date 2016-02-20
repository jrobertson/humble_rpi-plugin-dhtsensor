# Introducing the Humble_Rpi-plugin-dhtsensor gem


## Testing the gem

    require 'humble_rpi-plugin-dhtsensor'

    class Echo

      def notice(s)
        puts "%s: %s" % [Time.now, s]
      end
    end

    rpi = HumbleRPiPluginDhtSensor.new(settings: {pin: 4}, 
                                          variables: {notifier: Echo.new})
    rpi.start

Output:

<pre>
ready to monitor temperature and humidity
2016-02-20 13:14:35 +0000: pi/dht11_sensor: temperature: 15.0 humidity: 39.0
2016-02-20 13:15:13 +0000: pi/dht11_sensor: temperature: 16.0 humidity: 39.0
2016-02-20 13:16:15 +0000: pi/dht11_sensor: temperature: 17.0 humidity: 38.0
2016-02-20 13:18:22 +0000: pi/dht11_sensor: temperature: 18.0 humidity: 38.0
2016-02-20 13:24:47 +0000: pi/dht11_sensor: temperature: 17.0 humidity: 38.0
2016-02-20 13:25:49 +0000: pi/dht11_sensor: temperature: 16.0 humidity: 38.0
</pre>

In the above example I tested the sensor by adding a cup of water (that was previously warm) next to the DHT11 sensor at 1315hrs. I then removed the cup of water at 1319hrs and I observed it took 1 or more minutes for the temperature to change. 

Notes: 

* By default the temperature and humidity is refreshed every 3 seconds
* The temperature and humidity will be published when ever the temperature value changes by 1 or more, or if the humidity value changes by 2 or more.


## Using the plugin with the Humble RPi gem

    require 'humble_rpi'
    require 'humble_rpi-plugin-dhtsensor'

    r = HumbleRPi.new device_name: 'ottavia', sps_address: '192.168.4.140',\
      plugins: {DhtSensor: {pin: 4} }
    r.start

## Resources

* Reading the Temperature and Humidity from the DHT11 Sensor http://www.jamesrobertson.eu/snippets/2016/feb/20/reading-the-temperature-and-humidity-from-the-dht11-sensor.html

humblerpidhtsensor gem dhtsensor humblerpi

