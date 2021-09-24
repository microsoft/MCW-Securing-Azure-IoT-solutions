![Microsoft Cloud Workshops](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Securing Azure IoT solutions
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
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

- [Securing Azure IoT solutions before the hands-on lab setup guide](#securing-azure-iot-solutions-before-the-hands-on-lab-setup-guide)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
    - [Task 1: Download GitHub resources](#task-1-download-github-resources)
    - [Task 2: Deploy resources to Azure](#task-2-deploy-resources-to-azure)

<!-- /TOC -->

# Securing Azure IoT solutions before the hands-on lab setup guide

## Requirements

1. Microsoft Azure subscription must be pay-as-you-go or MSDN.

    - Trial subscriptions will not work.

## Before the hands-on lab

Duration: 30 minutes

Synopsis: In this exercise, you will set up your environment for use in the rest of the hands-on lab. You should follow all the steps provided in the Before the Hands-on Lab section to prepare your environment *before* attending the workshop.

### Task 1: Download GitHub resources

1. Open a browser window to the cloud workshop GitHub repository (<https://github.com/Microsoft/MCW-Securing-Azure-IoT-solutions>).

2. Select **Clone or download**, then select **Download Zip**.

    ![Clone or download and Download ZIP are highlighted in this screenshot of the cloud workshop GitHub repository.](media/beforehol-image1.png "Download the zip file")

3. Extract the zip file to your local machine, be sure to keep note of where you have extracted the files. You should now see a set of folders:

    ![A set of extracted folders and files are visible in File Explorer: Hands On Lab, Media, Whiteboard design session, README.md., etc.](media/beforehol-image2.png "Extract the zip file")

### Task 2: Deploy resources to Azure

1. Open your Azure Portal.

2. Select **Resource groups**.

3. Select **+Add**.

4. Type a resource group name, such as **iotsecurity-\[your initials or first name\]**.

5. Select a **Region**.

6. Select **Review + Create**, then select **Create**.

7. Select **Refresh** to see your new resource group displayed and select it.

8. In the resource group blade, select **+ Add**.  In the marketplace search box, type **Template Deployment** and then select **Template deployment (deploy using custom template)**

9. Select **Create**.

10. Select **Build your own template in the editor**.

11. In the extracted folder, open the **\\Hands-on lab\\Resources\\template.json**.

12. Copy and paste it into the window.

13. Select **Save**, you will see the dialog with the input parameters. Fill out the form:

    - Subscription: Select your **subscription**.

    - Resource group: Use an existing Resource group, or create a new one by entering a unique name, such as **iotsecurity-\[your initials or first name\]**.

    - If prompted for location: Select a **location** for the Resource group.

    - Modify the **alias** to be something unique such as "\[your initials or first name\]".

    > **Note**: Keep your alias to less than 9 characters.

    - Review the remaining parameters, but if you change anything, be sure to note it for future reference throughout the lab.

    - Select **Review + Create**

    - Select **Create**.

14. The deployment will take 25-35 minutes to complete. To view the progress, select the **Deployments** link, then select the **Microsoft.Template** deployment.

    - As part of the deployment, you will see the following items created:

       - Windows 10 (Gen2) virtual machine running Hyper-V with virtual TPM-enabled Ubuntu image.

       - Azure Data Lake Storage account

       - Azure Stream Analytics job

       - App Service Plan

       - Azure Cosmos DB Account

       - Several virtual machines and supported resources (oilwells-server-INIT, oilwells-edgevm-INIT)

       - Event Hubs namespace

       - IoT Hub

       - IoT Device Provisioning Service

       - Azure Key Vault

       - Time Series Insights environment

    >**Note**: Not all of these resources may be used in the current version of the hands-on labs.

15. As part of the deployment, both ports 3389 and 22 will be open on the Network Security Group.  It is advisable that you modify the NSG settings to only allow your internet IP to connect to those ports.

You should follow all steps provided *before* attending the hands-on lab.
