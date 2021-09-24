![Microsoft Cloud Workshops](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Securing Azure IoT solutions
</div>

<div class="MCWHeader2">
Whiteboard design session trainer guide
</div>

<div class="MCWHeader3">
September 2021
</div>

Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2021 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

<!-- TOC -->

- [Trainer information](#trainer-information)
  - [Role of the trainer](#role-of-the-trainer)
  - [Whiteboard design session flow](#whiteboard-design-session-flow)
  - [Before the whiteboard design session: How to prepare](#before-the-whiteboard-design-session-how-to-prepare)
  - [During the whiteboard design session: Tips for an effective whiteboard design session](#during-the-whiteboard-design-session-tips-for-an-effective-whiteboard-design-session)
- [Securing Azure IoT solutions whiteboard design session student guide](#securing-azure-iot-solutions-whiteboard-design-session-student-guide)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study)
    - [Customer situation](#customer-situation)
    - [Customer needs](#customer-needs)
    - [Customer objections](#customer-objections)
    - [Infographic for common scenarios](#infographic-for-common-scenarios)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution)
  - [Step 3: Present the solution](#step-3-present-the-solution)
  - [Wrap-up](#wrap-up)
  - [Additional references](#additional-references)
- [Securing Azure IoT solutions whiteboard design session trainer guide](#securing-azure-iot-solutions-whiteboard-design-session-trainer-guide)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study-1)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution-1)
  - [Step 3: Present the solution](#step-3-present-the-solution-1)
  - [Wrap-up](#wrap-up-1)
  - [Preferred target audience](#preferred-target-audience)
  - [Preferred solution](#preferred-solution)
    - [High-level architecture](#high-level-architecture)
  - [Checklist of preferred objection handling](#checklist-of-preferred-objection-handling)
  - [Customer quote (to be read back to the attendees at the end)](#customer-quote-to-be-read-back-to-the-attendees-at-the-end)
[Additional references](#additional-references)
- [Trainer information](#trainer-information)
  - [Role of the trainer](#role-of-the-trainer)
  - [Whiteboard design session flow](#whiteboard-design-session-flow)
  - [Before the whiteboard design session: How to prepare](#before-the-whiteboard-design-session-how-to-prepare)
  - [During the whiteboard design session: Tips for an effective whiteboard design session](#during-the-whiteboard-design-session-tips-for-an-effective-whiteboard-design-session)
- [Securing Azure IoT solutions whiteboard design session student guide](#securing-azure-iot-solutions-whiteboard-design-session-student-guide)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study)
    - [Customer situation](#customer-situation)
    - [Customer needs](#customer-needs)
    - [Customer objections](#customer-objections)
    - [Infographic for common scenarios](#infographic-for-common-scenarios)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution)
  - [Step 3: Present the solution](#step-3-present-the-solution)
  - [Wrap-up](#wrap-up)
  - [Additional references](#additional-references)
- [Securing Azure IoT solutions whiteboard design session trainer guide](#securing-azure-iot-solutions-whiteboard-design-session-trainer-guide)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study-1)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution-1)
  - [Step 3: Present the solution](#step-3-present-the-solution-1)
  - [Wrap-up](#wrap-up-1)
  - [Preferred target audience](#preferred-target-audience)
  - [Preferred solution](#preferred-solution)
    - [High-level architecture](#high-level-architecture)
  - [Checklist of preferred objection handling](#checklist-of-preferred-objection-handling)
  - [Customer quote (to be read back to the attendees at the end)](#customer-quote-to-be-read-back-to-the-attendees-at-the-end)
[Wrap-up](#wrap-up)
[Additional references](#additional-references)
- [Trainer information](#trainer-information)
  - [Role of the trainer](#role-of-the-trainer)
  - [Whiteboard design session flow](#whiteboard-design-session-flow)
  - [Before the whiteboard design session: How to prepare](#before-the-whiteboard-design-session-how-to-prepare)
  - [During the whiteboard design session: Tips for an effective whiteboard design session](#during-the-whiteboard-design-session-tips-for-an-effective-whiteboard-design-session)
- [Securing Azure IoT solutions whiteboard design session student guide](#securing-azure-iot-solutions-whiteboard-design-session-student-guide)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study)
    - [Customer situation](#customer-situation)
    - [Customer needs](#customer-needs)
    - [Customer objections](#customer-objections)
    - [Infographic for common scenarios](#infographic-for-common-scenarios)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution)
  - [Step 3: Present the solution](#step-3-present-the-solution)
  - [Wrap-up](#wrap-up)
  - [Additional references](#additional-references)
- [Securing Azure IoT solutions whiteboard design session trainer guide](#securing-azure-iot-solutions-whiteboard-design-session-trainer-guide)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study-1)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution-1)
  - [Step 3: Present the solution](#step-3-present-the-solution-1)
  - [Wrap-up](#wrap-up-1)
  - [Preferred target audience](#preferred-target-audience)
  - [Preferred solution](#preferred-solution)
    - [High-level architecture](#high-level-architecture)
  - [Checklist of preferred objection handling](#checklist-of-preferred-objection-handling)
  - [Customer quote (to be read back to the attendees at the end)](#customer-quote-to-be-read-back-to-the-attendees-at-the-end)
[Additional references](#additional-references)
- [Trainer information](#trainer-information)
  - [Role of the trainer](#role-of-the-trainer)
  - [Whiteboard design session flow](#whiteboard-design-session-flow)
  - [Before the whiteboard design session: How to prepare](#before-the-whiteboard-design-session-how-to-prepare)
  - [During the whiteboard design session: Tips for an effective whiteboard design session](#during-the-whiteboard-design-session-tips-for-an-effective-whiteboard-design-session)
- [Securing Azure IoT solutions whiteboard design session student guide](#securing-azure-iot-solutions-whiteboard-design-session-student-guide)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study)
    - [Customer situation](#customer-situation)
    - [Customer needs](#customer-needs)
    - [Customer objections](#customer-objections)
    - [Infographic for common scenarios](#infographic-for-common-scenarios)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution)
  - [Step 3: Present the solution](#step-3-present-the-solution)
  - [Wrap-up](#wrap-up)
  - [Additional references](#additional-references)
- [Securing Azure IoT solutions whiteboard design session trainer guide](#securing-azure-iot-solutions-whiteboard-design-session-trainer-guide)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study-1)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution-1)
  - [Step 3: Present the solution](#step-3-present-the-solution-1)
  - [Wrap-up](#wrap-up-1)
  - [Preferred target audience](#preferred-target-audience)
  - [Preferred solution](#preferred-solution)
    - [High-level architecture](#high-level-architecture)
  - [Checklist of preferred objection handling](#checklist-of-preferred-objection-handling)
  - [Customer quote (to be read back to the attendees at the end)](#customer-quote-to-be-read-back-to-the-attendees-at-the-end)

<!-- /TOC -->

# Trainer information

Thank you for taking time to support the whiteboard design sessions as a trainer!

## Role of the trainer

An amazing trainer:

- Creates a safe environment in which learning can take place.

- Stimulates the participant's thinking.

- Involves the participant in the learning process.

- Manages the learning process (on time, on topic, and adjusting to benefit participants).

- Ensures individual participant accountability.

- Ties it all together for the participant.

- Provides insight and experience to the learning process.

- Effectively leads the whiteboard design session discussion.

- Monitors quality and appropriateness of participant deliverables.

- Effectively leads the feedback process.

## Whiteboard design session flow 

Each whiteboard design session uses the following flow:

**Step 1: Review the customer case study (15 minutes)**

**Outcome**

Analyze your customer's needs.

- Customer's background, situation, needs and technical requirements

- Current customer infrastructure and architecture

- Potential issues, objectives and blockers

**Step 2: Design a proof of concept solution (60 minutes)**

**Outcome**

Design a solution and prepare to present the solution to the target customer audience in a 15-minute chalk-talk format.

- Determine your target customer audience.

- Determine customer's business needs to address your solution.

- Design and diagram your solution.

- Prepare to present your solution.

**Step 3: Present the solution (30 minutes)**

**Outcome**

Present solution to your customer:

- Present solution

- Respond to customer objections

- Receive feedback

**Wrap-up (15 minutes)**

- Review preferred solution

## Before the whiteboard design session: How to prepare

Before conducting your first whiteboard design session:

- Read the Student guide (including the case study) and Trainer guide.

- Become familiar with all key points and activities.

- Plan the point you want to stress, which questions you want to drive, transitions, and be ready to answer questions.

- Prior to the whiteboard design session, discuss the case study to pick up more ideas.

- Make notes for later.

## During the whiteboard design session: Tips for an effective whiteboard design session

**Refer to the Trainer guide** to stay on track and observe the timings.

**Do not expect to memorize every detail** of the whiteboard design session.

When participants are doing activities, you can **look ahead to refresh your memory**.

- **Adjust activity and whiteboard design session pace** as needed to allow time for presenting, feedback, and sharing.

- **Add examples, points, and stories** from your own experience. Think about stories you can share that help you make your points clearly and effectively.

- **Consider creating a "parking lot"** to record issues or questions raised that are outside the scope of the whiteboard design session or can be answered later. Decide how you will address these issues, so you can acknowledge them without being derailed by them.

***Have fun**! Encourage participants to have fun and share!*

**Involve your participants.** Talk and share your knowledge but always involve your participants, even while you are the one speaking.

**Ask questions** and get them to share to fully involve your group in the learning process.

**Ask first**, whenever possible. Before launching into a topic, learn your audience's opinions about it and experiences with it. Asking first enables you to assess their level of knowledge and experience, and leaves them more open to what you are presenting.

**Wait for responses**. If you ask a question such as, "What's your experience with (fill in the blank)?" then wait. Do not be afraid of a little silence. If you leap into the silence, your participants will feel you are not serious about involving them and will become passive. Give participants a chance to think, and if no one answers, patiently ask again. You will usually get a response.

# Securing Azure IoT solutions whiteboard design session student guide

## Abstract and learning objectives

In this whiteboard design session, you will look at the process for designing an oil and gas manufacturing IoT solution that is secured following best practices.

You will learn how to monitor and manage the security of all components in the solution You will also provide Contoso guidance on defining life cycles for particular components so that they have a plan that begins with initial deployment, to expected maintenance, to planned end-of-life and ultimately through decommissioning of the device so that they can understand how Azure supports this. Additionally, you will perform some threat modeling to help Contoso think about how they might handle STRIDE threats (spoofing of user identity, tampering, repudiation, information disclosure, denial of service, elevation of privilege).

At the end of this whiteboard design session, you will be better able to architect a comprehensive and secure oil and gas manufacturing IoT solution.

The concepts covered here are targeted at an architectural design level versus simple stand-alone activities.

## Step 1: Review the customer case study

**Outcome**

Analyze your customer's needs.

Timeframe: 15 minutes

Directions:  With all participants in the session, the facilitator/SME presents an overview of the customer case study along with technical tips.

1. Meet your table participants and trainer.

2. Read all of the directions for steps 1-3 in the student guide.

3. As a table team, review the following customer case study.

### Customer situation

Contoso, Ltd. has major holdings in one of the world’s most important oil-producing regions. To overcome the challenges of monitoring and optimizing a vast number of widely dispersed field assets, Contoso, Ltd. is looking to streamline its operations with IoT solutions. They want to deploy IoT technologies to electronically collect data and use cloud-based solutions to store and analyze it in order to gain new insights into well operations and future drilling possibilities.

Their environments are very tough environments in which to work. The climate is hot, harsh, and unforgiving, and oil wells are often spaced many miles apart, so field technicians can spend much of their day just driving from one to another. Cellular and radio reception is spotty at best, so collecting data about well conditions and performance typically involves manually writing down information. The technician must then make the long trek to the central office at the end of the day to upload the data for analysis. With such remote situations, a key concern for Contoso is not only how they manage these remote devices, but more broadly how they secure the complete solution that encompasses the physical device, the software on the device, the services processing the data in the cloud and the network connecting it all.

Contoso plans to tie into existing sensors at the well head that monitor key system parameters like temperatures, pressures, and flow rates. They will deploy gateway devices route device data for processing, storage and analytics. Internal IT staff and engineers want to visualize the high-resolution data and deliver near real-time analyses. The company is placing a premium on flexibility and ease of use, with security as a fundamental.

In addition, they would also like see the solution yield benefits to their workers in the field. “The field technicians and lease operators already have tools on their phones that they use every day to see what a well is doing,” explains Miles Strom. “Our goal is to connect these tools to live data from the IoT sensors. So, instead of seeing low-resolution volumes or flow rates, they’ll see what is happening in real time. This way they can respond immediately to problems that lead to downtime or maintenance issues.”

They have implemented a proof of concept solution for collecting and analyzing device telemetry using IoT Hub, but are interested in learning about any related services in Azure that would help them to secure such solutions.

### Customer needs

1. Ensure that all IoT devices are properly registered and assigned a secure tamper-proof identity.

2. Ensure devices are operating within assigned policy standards and are not tampered with.

3. Enable an alerting solution with little to no effort configuration that will notify and allow for remediation in the case of fault or malicious activity.

4. Ensure all events are surfaced in one place for simplicity.

5. Address the need to have auditing and monitoring across a wide range of device operating systems and processor architectures (Linux, x86, x64, etc.).

6. Automate the security agent provisioning rather than having to physically or remotely "touch" all the devices.

7. Ensure only the most secure protocols are implemented and used during any transmissions

8. Ensure that in the future it will be possible to have an enterprise-wide look at any vulnerabilities or malicious events, not just specifically focused the IoT infrastructure.

9. Contoso is currently using older generic IoT devices but is considering upgrading those devices to something more secure and modern that will support future AI and Machine Learning activities.  They would like to know if Microsoft has anything that can help them.

### Customer objections

1. Contoso, Ltd staff are worried it may be impossible to manage the many thousands of IoT devices they have deployed around the world with any one product.

2. Can Azure handle all the different types of operating systems and processor architectures of their devices?

3. Will they be able to monitor for specific events on some of their proprietary devices?

4. Can Azure support non-TPM hardware devices?

5. Will the communications from a device to Azure be secure enough?

6. Can an Azure logging solution handle the massive amount of events and alerts that will need to be ingested?

7. Is it possible to assign role-based permissions based on their security objectives and policies to the IoT resources such as the Hub, Edge and individual devices?

8. Is the solution capable of being flexible in the types of reporting and alerts that can be generated based on custom logging event data?

9. Will we be able to limit the messages and network traffic to specific network IP addresses/subnets for our devices?

10. Can Microsoft provide a more modern solution to support their IoT device upgrades?

### Infographic for common scenarios

![Envisioned situation](media/commonscenerios.png)

## Step 2: Design a proof of concept solution

**Outcome**

Design a solution and prepare to present the solution to the target customer audience in a 15-minute chalk-talk format.

Timeframe: 60 minutes

**Business needs**

Directions: With all participants at your table, answer the following questions and list the answers on a flip chart:

1. Who should you present this solution to? Who is your target customer audience? Who are the decision makers?

2. What customer business needs do you need to address with your solution?

**Design**

Directions: With all participants at your table, respond to the following questions on a flip chart:

*High-level architecture*

Without getting into the details (the following sections will address the details), diagram your initial vision for handling the top-level requirements.

Briefly sketch-out and propose a high-level solution that meets the customer's business and technical needs and mitigates their objections. For this workshop, you may choose from the following technologies (you may not need all of them in the correct solution):

1. IoT Hub and Provisioning Service

2. Azure Networks and Network Security Groups

3. Virtual Private Networks (Point to Point, Site to Site) and Express Route

4. Azure Web Apps

5. Azure Log Analytics

6. Azure Security Center

7. Azure Sentinel

8. Azure Active Directory

9. Azure Time Series Insights

10. Azure Sphere

11. Azure Stream Analytics

12. Azure Service Bus

13. Azure Defender for IoT

*Device Security*

Describe how you will secure the following:

1. How will you secure the IoT Edge Devices?

2. How will you secure the IoT Devices?

3. How will you monitor and audit device access?

4. How will you monitor and audit Azure resource changes?

5. How will you create custom alerts and execute remediation and investigation activities on detection?

6. What tools would you setup to surface audit and compliance reporting to IT Executives?

*Azure Security*

Describe how you will utilize Azure security features to secure the various resources such as the following:

1. How will you secure the IoT Hub?

2. How will you secure the IoT Device Provisioning Service?

3. How can you monitor devices that cannot have an agent installed on them?

*Ensure secure Device updates*

1. How will Contoso ensure they can push updates to the field in a secure manner?

**Prepare**

Directions: With all participants at your table:

1. Identify any customer needs that are not addressed with the proposed solution.

2. Identify the benefits of your solution.

3. Determine how you will respond to the customer's objections.

Prepare a 15-minute chalk-talk style presentation to the customer.

## Step 3: Present the solution

**Outcome**

Present a solution to the target customer audience in a 15-minute chalk-talk format.

Timeframe: 30 minutes

**Presentation**

Directions:

1. Pair with another table.

2. One table is the Microsoft team and the other table is the customer.

3. The Microsoft team presents their proposed solution to the customer.

4. The customer makes one of the objections from the list of objections.

5. The Microsoft team responds to the objection.

6. The customer team gives feedback to the Microsoft team.

7. Tables switch roles and repeat Steps 2-6.

## Wrap-up

Timeframe: 15 minutes

Directions: Tables reconvene with the larger group to hear the facilitator/SME share the preferred solution for the case study.

## Additional references

|    |            |
|----------|:-------------:|
| **Description** | **Links** |
| Azure IoT Hub   | https://docs.microsoft.com/en-us/azure/iot-hub/  |
| Azure IoT Edge   | https://docs.microsoft.com/en-us/azure/iot-edge/  |
| Azure IoT Edge Security Manager  |  https://docs.microsoft.com/en-us/azure/iot-edge/iot-edge-security-manager|
| Azure IoT Edge Security Model  | <https://docs.microsoft.com/en-us/azure/iot-edge/iot-edge-security-manager/>     |
| Azure IoT Edge Security Model (Video)  | <https://channel9.msdn.com/Shows/Internet-of-Things-Show/Azure-IoT-Edge-Security-Model/>     |
| Azure IoT Edge As Gateway  |  <https://docs.microsoft.com/en-us/azure/iot-edge/iot-edge-as-gateway/>|
| Azure IoT Edge (Transparent Gateway)  |  <https://docs.microsoft.com/en-us/azure/iot-edge/how-to-create-transparent-gateway/>|
| Azure IoT Edge (Authenticate downstream device)  |  <https://docs.microsoft.com/en-us/azure/iot-edge/how-to-authenticate-downstream-device/>|
| Azure IoT Edge (Connect downstream device)  |  <https://docs.microsoft.com/en-us/azure/iot-edge/how-to-connect-downstream-device/>|
| Azure IoT Edge Certificates  |  <https://docs.microsoft.com/en-us/azure/iot-edge/iot-edge-certs/>|
| Azure Defender for IoT | https://docs.microsoft.com/en-us/azure/defender-for-iot/organizations/overview | 
| Microsoft Defender for Endpoint | https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/microsoft-defender-endpoint?view=o365-worldwide |
| Azure IoT Device Provisioning Service   | https://docs.microsoft.com/en-us/azure/iot-dps/  |
| Provisioning devices with vTPM   | https://docs.microsoft.com/en-us/azure/iot-edge/how-to-auto-provision-simulated-device-linux/  |
| Provisioning devices with sTPM   | https://docs.microsoft.com/en-us/azure/iot-edge/how-to-auto-provision-simulated-device-windows/  |
| Provisioning devices with dTPM (Raspberry PI)   | https://catalog.azureiotsolutions.com/details?title=OPTIGA-TPM-SLB-9670-Iridium-Board&source=all-devices-page/  |
| Azure Security Center for IoT  | https://docs.microsoft.com/en-us/azure/asc-for-iot/overview  |
| Azure IoT SDK  | https://github.com/Azure/azure-iot-sdks  |
| Azure IoT Security Agent  | https://github.com/Azure/Azure-IoT-Security-Agent-C  |
| Azure IoT Hub Messaging | <https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-messages-d2c/>
| Azure Service Bus | <https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview/>
| Azure Sentinel   | <https://docs.microsoft.com/en-us/azure/sentinel/>   |
| Azure Time Series Insights | <https://docs.microsoft.com/en-us/azure/time-series-insights/>
| Azure Stream Analytics | <https://docs.microsoft.com/en-us/azure/stream-analytics/stream-analytics-introduction/>
| Process real-time IoT data streams with Azure Stream Analytics | <https://docs.microsoft.com/en-us/azure/stream-analytics/stream-analytics-get-started-with-azure-stream-analytics-to-process-data-from-iot-devices/>
| Azure Policy   | <https://azure.microsoft.com/en-us/services/azure-policy/>   |
| Compliance Commitments   |  <http://azure.microsoft.com/en-us/support/trust-center/services/>  |
| Azure Trust Center  | <http://azure.microsoft.com/en-us/support/trust-center/>     |
| Azure Sphere  | <https://docs.microsoft.com/en-us/azure-sphere/>     |
| Security Best Practices for IoT  | <https://docs.microsoft.com/en-us/azure/iot-fundamentals/iot-security-best-practices>

# Securing Azure IoT solutions whiteboard design session trainer guide

## Step 1: Review the customer case study

- Check in with your table participants to introduce yourself as the trainer.

- Ask, "What questions do you have about the customer case study?"

- Briefly review the steps and Timeframes of the whiteboard design session.

- Ready, set, go! Let the table participants begin.

## Step 2: Design a proof of concept solution

- Check in with your tables to ensure that they are transitioning from step to step on time.

- Provide some feedback on their responses to the business needs and design.
  - Try asking questions first that will lead the participants to discover the answers on their own.

- Provide feedback for their responses to the customer's objections.
  - Try asking questions first that will lead the participants to discover the answers on their own.

## Step 3: Present the solution

- Determine which table will be paired with your table before Step 3 begins.

- For the first round, assign one table as the presenting team and the other table as the customer.

- Have the presenting team present their solution to the customer team.
  - Have the customer team provide one objection for the presenting team to respond to.
  - The presentation, objections, and feedback should take no longer than 15 minutes.
  - If needed, the trainer may also provide feedback.

## Wrap-up

- Have the table participants reconvene with the larger session group to hear the facilitator/SME share the following preferred solution.

## Preferred target audience

- IoT Developers and Support
- Cloud Architects
- Infrastructure Managers
- Network Engineers

## Preferred solution

### High-level architecture

Without getting into the details (the following sections will address the details), diagram your initial vision for handling the top-level requirements.

![The proposed solution shows IoT Device with IoT Edge connected to IoT Hub. The Iot Hub is then connected to Azure Stream Analytics and Azure Time Series.](media/solution-business.png "Solution Architecture")

In the solution diagram above, note the following:

- IoT Edge devices are placed in the field.
- These devices communication back to the IoT Hub
- IoT Hub sends data to other services such as Cosmos DB and Time Series Insights
- Data is saved to Data Lake for analysis later by machine learning
- App services query Cosmos DB to provide mobile field techs information

Azure IoT Hubs will keep track of devices and allow for remote execution of commands, deployments and the receiving and routing of device messages.

Azure IoT Edge devices will be used to store information when offline and then forward to the IoT Hub.

*Device Security*

![The proposed solution utilizing Azure Security Center for IoT and its agents to monitor and secure the IoT Devices.  Log data is forwarded to Log Analytics where alerts and logic apps will execute to start investigation and remediation.](media/solution-diagram-1.png "Solution Architecture")

Describe how you will secure the following:

1. How will you secure the IoT Edge Devices?

    Azure IoT Edge is inherently secure on its own through the Azure IoT Edge security manager daemon.  However, any actor with access to the device as root or administrator can make changes to the device.  For this reason, you should ensure that the device utilizes the Azure IoT Security Agent to monitor for security events or configuration changes that could affect the security integrity of the IoT Edge device.

2. How will you secure the IoT Devices?

    Similar to an IoT Edge device, these devices should have the Azure IoT Security agent installed.  Devices should also utilize hardware based secure silicon features (such as TPM, eSE, Arm TrustZone and Intel SGX) to ensure that the device is not accessed physically and modified in any way.  

    All devices should have unique certificates to identify them to the IoT Edge devices and the IoT Hub.

    Microsoft Defender for Endpoint can also be installed to provide added protection using the advanced machine learning and artificial intelligence features of the Microsoft Defender stack.

3. How will you monitor and audit device access?

    Local device logs and security events can be sent to IoT Edge devices for storage, processing and possibly forwarding to the IoT Hub.  Most major logs should be sent to the IoT Hub where you will have Azure Security Center for IoT monitoring those events and firing alerts on abnormal activity.

4. How will you monitor and audit Azure resource changes?

    By enabling Diagnostic Logging on all Azure resources, you can have those events logged into a Log Analytics workspace.

5. How will you create custom alerts and execute remediation and investigation activities on detection?

    Since all data will be ingested into Log Analytics, you can build any number of custom alerts to notify the proper individuals or execute Playbooks that start remediation or investigative activities.

6. What tools would you setup to surface audit and compliance reporting to IT Executives?

    You can utilize Power BI to surface Log Analytics data into easy to read dashboards that are accessible only to the property individuals.

Additionally:

- Use IoT Hub to manage devices, ingest all data, and send control data back to devices as needed.

- Azure IoT Device Provisioning Service will be used to register the oil wells, gas compressors and pipelines devices with the appropriate IoT Hubs.

- Process oil well data locally, detect anomalies, store data offline, and send only important data, using Azure IoT Edge devices.

- Separately send oil pipeline metrics at regular intervals.

*Azure Security*

![Once the device has been configured to send data to Azure, Azure Security Center for IoT can scan the logs for common patterns and create notification alerts.](media/solution-security.png "Solution Architecture")

Describe how you will utilize Azure security features to secure the various resources such as the following:

1. How will you secure the IoT Hub?

    - Utilizing Azure Access control (IAM) mechanisms you can set the permissions to access and modify the IoT Hub resource to the proper individuals.
    - By implementing Shared Access Policies, you can create policies that grant permission to perform actions on the IoT Hub such as Registry read, Registry write, Service connect, and Device connect
    - Using IP Filters, you can limit the devices that can connect to your IoT Hub to a set of IP Addresses.
    - Enabling Diagnostic settings to send changes to a Log Analytics workspace will enable to you fire alerts based on management plane activities.

2. How will you secure the IoT Device Provisioning Service?

    - Similar to an IoT Hub resource, you can utilize Azure Access Control (IAM) and a similar Shared Access Policies setup to achieve your desired permissions configuration.
    - You can also enable Diagnostic settings to log management plane changes.

3. How can you monitor devices that cannot have an agent installed on them?

    - Azure Defender for IoT provides an agentless monitoring sensor that uses a SPAN port to monitor traffic on the device network.

    - Any Indicators of Compromise (IoC) can be picked up from the traffic and then logs sent to Log Analytics and Sentinel for further alerting.

Additionally:

- Azure Security Agent will be deployed to all critical devices to feed important security events and data to Azure Security Center for IoT.

- Log Analytics will be used to build custom alerts based on device security data ingested from the Azure Security Agents.

- Azure Security Center for IoT will be used to provide workload protection through its intelligent threat detection analysis algorithms.

*Report/Analytics*

![Iot devices send messages to the IoT Hub which is then connected to both Stream Analytics and Time Series. Stream analytics can then use windowing techniques to write data to Cosmos DB which is then read from a custom application hosted in Azure.  Time Series can also provide real time look into the data for operations and admin staff.](media/solution-diagram-2.png "Solution Architecture")

- In this diagram, IoT devices send data to the IoT Hub where it is then forwarded to Stream Analytics and Time Series.  

- Data is aggregated in Stream Analytics and then placed in Cosmos DB.  

- Machine Learning and other basic applications then query Cosmos DB to provide reporting and metrics to field techs.

- Time Series data is analyzed by admin and operations staff.

Additionally:

- Stream Analytics can monitor device data for alert thresholds and separately send all device data to Cosmos DB.

- Use Cosmos DB to store reference data, alert information, device data, and oil well metrics used for detecting anomalies and output efficiency.

- Overlay device telemetry and other data all in one place, automatically handle schema changes and view raw data.

- Custom web app hosted in Web Apps service, accesses time series data via Time Series Insights Query APIs, connects to Cosmos DB for reference data, and manages IoT devices through IoT Service SDK.

- Use Azure Time Series Insights to store, visualize, and query all-time series data from IoT and edge devices.

*Service Bus*

![IoT Hub is connected to Azure Service Bus. Applications then subscribe to events from the Service Bus and process that their own pace.](media/solution-diagram-3.png "Solution Architecture")

In addition to Stream Analytics and Time Series Insights, Azure Service Bus can be connected to the IoT Hub to receive messages and then allow other custom applications to process the messages the are specifically looking for, at their own respective pace.

Additionally:

- Use custom endpoints and routes in IoT Hub to filter and send critical messages to a Service Bus Queue for further processing.

- Service Bus Subscribers such as Azure Functions, App Services and Event Grid can monitor for specific messages

*Ensure secure Device updates*

![An Azure Sphere guardian module can be placed with the IoT Devices to ensure a secure communication path has been created between the Azure Sphere Service Service for app and device updates.](media/solution-diagram-4.png "Solution Architecture")

Each of the remote devices has a guardian module that performs secure communication with Azure Sphere.  App and other updates are securely delivered over the internet to the devices.

1. How will Contoso ensure they can push updates to the field in a secure manner?

    Azure Sphere can be used to deploy Guardian modules that will allow for the secure updates of the devices over the internet.

## Checklist of preferred objection handling

1. Contoso, Ltd staff are worried it may be impossible to manage the many thousands of IoT devices they have deployed around the world with any one product.

    Utilizing the Azure IoT Hub Device Provisioning Service, Contoso can enable a zero-touch, just-in-time provisioning to specific IoT Hubs without any human intervention.  The service scales to many millions of devices in a secure and scalable manner that will meet Contoso's needs.

2. Can Azure handle all the different types of operating systems and processor architectures of their devices?

    The Azure IoT Agents have been released with ANSI-C standards in mind.  The code is freely available on GitHub along with an entire SDK that will enable Contoso to easily re-compile the source for any target device.

3. Will they be able to monitor for specific events on some of their proprietary devices?

    Yes, they can monitor for custom events on their proprietary devices using the Azure IoT SDK to send message and events to their specific IoT Hub(s).

4. Can Azure support non-TPM hardware devices?

    Yes, you can recompile the source code to utilize simulated/software TPMs, however this is typically not a standard or accepted way of doing secure device management in production environments.

    You can reference the following resources:
    - [Using vTPM in Linux (virtual or vTPM is sit in for a real TPM)]( https://docs.microsoft.com/en-us/azure/iot-edge/how-to-auto-provision-simulated-device-linux)
    -  [Using sTPM on Windows (software/simulated or sTPM is sit in for a recommended discrete/chip TPM)]( https://docs.microsoft.com/en-us/azure/iot-edge/how-to-auto-provision-simulated-device-windows)
    -  [Use dTPM on Linux using Raspberry Pi]( https://catalog.azureiotsolutions.com/details?title=OPTIGA-TPM-SLB-9670-Iridium-Board&source=all-devices-page)

5. Will the communications from a device to Azure be secure enough?

    Absolutely, the Azure IoT SDKs come with support for several different protocols including the latest HTTPS and SSL features such as TLS and MTLS.  Devices can be authenticated using device specific certificates and the network can be allowed using IP schemes.

    Additionally, the [Azure IoT Security Model](https://aka.ms/iot-edge-security-manager) has been designed specifically to address security needs of any IoT Architecture plus adds the flexibility to monitor for threats and motivations such as physical accessibility of devices, IP and generated insights, actions based off insights and heterogeneity in the silicon, languages and procedures.

6. Can an Azure logging solution handle the massive amount of events and alerts that will need to be ingested?

    Yes, at the lowest plan level, you can send 500MB of data to a Log Analytics workspace.  Standard and Premium plans have no limit on the amount of data uploaded even if it is terabytes per day.

7. Is it possible to assign role-based permissions based on their security objectives and policies to the IoT resources such as the Hub, Edge and individual devices?

    Yes, Azure IoT resources come with a management plane that gives you flexibility to allow various levels of permissions to target specific roles of your IoT Infrastructure.

8. Is the solution capable of being flexible in the types of reporting and alerts that can be generated based on custom logging event data?

    Yes, you can choose to utilize the out of box alert templates, or create your own templates based on common Azure and Operating System events, or even your own custom events.

9. Will we be able to limit the messages and network traffic to specific network IP addresses/subnets for our devices?

    Yes, you can enable IP Filtering in the IoT Hub to ensure that only messages that originate from specific IPs or subnet are allowed to flow through to the IoT Hub(s).

10. Can Microsoft provide a more modern solution to support their IoT device upgrades?

   Yes, using Azure Sphere, the customer can upgrade their devices using new hardware designed with security and flexibility in mind.
   Reference [this Microsoft research paper](https://www.microsoft.com/en-us/research/wp-content/uploads/2017/03/SevenPropertiesofHighlySecureDevices.pdf) for details of what makes devices secure.

## Customer quote (to be read back to the attendees at the end)

"Managing our massive worldwide IoT Infrastructure using the latest security features of Azure has given us the confidence to know our devices are running securely and efficiently with the added flexibility to change our direction at any time. Azure Sphere presents us with a path to support our future needs." 

Jack Tradewinds, CIO of Contoso, Ltd.
