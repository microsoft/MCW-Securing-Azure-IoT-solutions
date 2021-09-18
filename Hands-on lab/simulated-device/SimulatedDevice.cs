// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

// This application uses the Azure IoT Hub device SDK for .NET
// For samples see: https://github.com/Azure/azure-iot-sdk-csharp/tree/master/iothub/device/samples

using System;
using Microsoft.Azure.Devices.Client;
using Newtonsoft.Json;
using System.Text;
using System.Threading.Tasks;

namespace simulated_device
{
    class SimulatedDevice
    {
        private static DeviceClient s_deviceClient;

        // The device connection string to authenticate the device with your IoT Hub.
        // Using the Azure CLI:
        // az iot hub device-identity show-connection-string --hub-name {YourIoTHubName} --device-id MyDotnetDevice --output table
        private readonly static string s_connectionString = "HostName={YOURHUBNAME}.azure-devices.net;DeviceId={YOURDEVICENAME};SharedAccessKey={YOURKEY}";


        // Async method to send simulated telemetry
        private static async void SendDeviceToCloudMessagesAsync()
        {
            Random rand = new Random();
            string category = "Security";
            int eventId = 1000;

            while (true)
            {
                string appName = "App" + rand.Next(3).ToString().PadLeft(2,'0');
                int level = rand.Next(3);

                switch (rand.Next(3))
                {
                    case 0:
                        category = "Security";
                        eventId = rand.Next(1000, 1100);
                        break;
                    case 1:
                        category = "Application";
                        eventId = rand.Next(2000, 2100);
                        break;
                    case 2:
                        category = "System";
                        eventId = rand.Next(100, 200);
                        break;
                    case 3:
                        category = "Unknown";
                        eventId = rand.Next(10000, 11000);
                        break;
                }
                
                DateTime timestamp = DateTime.Now;
                string messageId = Guid.NewGuid().ToString();

                // Create JSON message
                var telemetryDataPoint = new
                {
                    AppName = appName,
                    TimeStamp = timestamp,
                    MessageId = messageId,
                    Category = category,
                    Level = level,
                    EventId = eventId
                };

                var messageString = JsonConvert.SerializeObject(telemetryDataPoint);
                var message = new Message(Encoding.ASCII.GetBytes(messageString));

                // Add a custom application property to the message.
                // An IoT Hub can filter on these properties without access to the message body.
                message.Properties.Add("SecurityAlert", (category == "Security") ? "true" : "false");

                // Send the telemetry message
                await s_deviceClient.SendEventAsync(message);
                Console.WriteLine("{0} > Sending message: {1}", DateTime.Now, messageString);

                await Task.Delay(1000);
            }
        }
        private static void Main(string[] args)
        {
            Console.WriteLine("IoT Hub Quickstarts #1 - Simulated device. Ctrl-C to exit.\n");

            // Connect to the IoT Hub using the MQTT protocol
            s_deviceClient = DeviceClient.CreateFromConnectionString(s_connectionString, TransportType.Mqtt);
            SendDeviceToCloudMessagesAsync();
            Console.ReadLine();
        }
    }
}
