---
slug: course-design-data-storage-solutions
title: Design data integration
authors: [leiria schattschneider]
tags: [data lake, documentation, azure]
---


In this post are the key concepts I learned while doing the [AZ-305: Design data storage solutions](https://learn.microsoft.com/en-us/training/paths/design-data-storage-solutions/)

## Module 1: Design a data storage solution for non-relational data 

First thing to consider is the type of data that needs to be handled: structured, semi-structured or unstructured.

Consider Azure Blob Storage when the objective is to store vast amounts of unstructured data by using Azure Blob Storage. Blob stands for Binary Large Object. Blob Storage is often used for images and multimedia files.

The second step is to create an `Azure storage account` which will group together all of your Azure Storage services.

There are several options when creating an `Azure Storage account`  Each storage account supports different features and has its own pricing model. Review the following options and think about what storage accounts are required to support Tailwind Traders applications.

The most common one is the Standard general-purpose v2, go to the [Azure page](https://learn.microsoft.com/en-us/training/modules/design-data-storage-solution-for-non-relational-data/3-design-for-azure-storage-accounts) to check all options supported.

When choosing storage accounts consider data storage costs. Factor in data storage costs into your plan for Tailwind Traders. A storage account by itself has no financial cost. But, the settings you choose for the account do influence the cost of services in the account. Geo-redundant storage costs more than locally redundant storage. Premium performance and the hot access tier increase the cost of blobs. Do you need to keep track of expenses or billing by department or project? Are you working with partners where storage costs need to be separated? By creating multiple storage accounts, you can better control the overall costs.

<!-- I stopped here: https://learn.microsoft.com/en-us/training/modules/design-data-storage-solution-for-non-relational-data/4-design-for-data-redundancy -->
