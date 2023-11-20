---
slug: course-get-started-with-data-engineering-on-Azure
title: Get started with data engineering on Azure
authors: [leiria schattschneider]
tags: [data lake, documentation, azure]
summary: `Get started with data engineering on Azure` course - personal notes
---

In this post are the key concepts I learned while doing the [Get started with data engineering on Azure](https://learn.microsoft.com/en-us/training/paths/get-started-data-engineering/) training course from Azure.


## Module 1: Introduction to data engineering on Azure

This is the first module of this course, it expalins what a data engineer does, common tasks and Azure tool that can help this professional perform their role.

### Common data engineering tasks

Data engineer's resposibilities can include:

- data integration, data transformation, and data consolidation from various structured and unstructured data systems into structures that are suitable for building analytics solutions. 

- ensure that data pipelines and data stores are high-performing, efficient, organized, and reliable, given a specific set of business requirements and constraints.

### Describe common data engineering concepts

1. Operational and analytical data

**Operational data** is usually transactional data that is generated and stored by applications, often in a relational or non-relational database. 

**Analytical data** is data that has been optimized for analysis and reporting, often in a data warehouse.

1. Streaming data

Streaming data refers to perpetual sources of data that generate data values in real-time, often relating to specific events. Common sources of streaming data include internet-of-things (IoT) devices and social media feeds.

1. Data pipelines

Data pipelines are used to orchestrate activities that transfer and transform data. Pipelines are the primary way in which data engineers implement repeatable extract, transform, and load (ETL) **solutions that can be triggered based on a schedule or in response to events**.

1. Data lakes

A data lake is a storage repository that holds large amounts of data in native, raw formats. Data lake stores are optimized for scaling to massive volumes (terabytes or petabytes) of data. The data typically comes from multiple heterogeneous sources, and may be structured, semi-structured, or unstructured.

:::note

The idea with a data lake is to store everything in its original, untransformed state. This approach differs from a traditional data warehouse, which transforms and processes the data at the time of ingestion.

:::

1. Data warehouses

A data warehouse is a centralized repository of integrated data from one or more disparate sources. Data warehouses store current and historical data in relational tables that are organized into a schema that optimizes performance for analytical queries.

1. Apache Spark

Apache Spark is a parallel processing framework that takes advantage of in-memory processing and a distributed file storage. It's a common open-source software (OSS) tool for big data scenarios.

## Module 2: Introduction to Azure Data Lake Storage Gen2

This module covers the basics of what is a `Azure Data Lake Storage Gen2` and how it can be integrated in the different stages of a data engineering process.

### Describe the key features and benefits of Azure Data Lake Storage Gen2

Before data lakes, data could be organised in data warehouses and using business intelligence (BI) solutions, however, the downside of it is that these tools can only manage structured data organising it in relational database systems, whereas, data lakes can also handle semi-structured and unstructured data.

:::tip

Factors related to structure, data governance, and data security should be taken into consideration when designing a data lake, these can include:

- Types of data to be stored
- How the data will be transformed
- Who should access the data
- What are the typical access patterns

This approach will help determine how to plan for access control governance across your lake.
:::

### Describe where Azure Data Lake Storage Gen2 fits in the stages of analytical processing

There are four stages for processing big data solutions that are common to all architectures:

1. Ingest - The ingestion phase identifies the technology and processes that are used to acquire the source data. This data can come from files, logs, and other types of unstructured data that must be put into the data lake. The technology that is used will vary depending on the frequency that the data is transferred. For example, for batch movement of data, pipelines in `Azure Synapse Analytics` or `Azure Data Factory` may be the most appropriate technology to use. For real-time ingestion of data, Apache Kafka for HDInsight or Stream Analytics may be an appropriate choice.
    
1. Store - The store phase identifies where the ingested data should be placed. `Azure Data Lake Storage Gen2` provides a secure and scalable storage solution that is compatible with commonly used big data processing technologies.
    
1. Prep and train - The prep and train phase identifies the technologies that are used to perform data preparation and model training and scoring for machine learning solutions. Common technologies that are used in this phase are `Azure    Synapse Analytics`, `Azure Databricks`, `Azure HDInsight`, and `Azure Machine Learning`.
    
1. Model and serve - Finally, the model and serve phase involves the technologies that will present the data to users. These technologies can include visualization tools such as Microsoft Power BI, or analytical data stores such as `Azure Synapse Analytics`. Often, a combination of multiple technologies will be used depending on the business requirements.

## Module 3: Introduction to Azure Synapse Analytics

This is the last module of this path and it covers the features and capabilities of `Azure Synapse Analytics` - a cloud-based platform for big data processing and analysis.

### How it works

`Azure Synapse Analytics` combines a centralized service for data storage and processing with an extensible architecture through which linked services enable you to integrate commonly used data stores, processing platforms, and visualization tools.

A `Synapse Analytics` workspace defines an instance of the `Synapse Analytics` service in which you can manage the services and data resources needed for your analytics solution. You can create a `Synapse Analytics` workspace in an Azure subscription interactively by using the Azure portal, or you can automate deployment by using Azure PowerShell, the Azure command-line interface (CLI), or with an Azure Resource Manager or Bicep template.

After creating a `Synapse Analytics` workspace, you can manage the services in it and perform data analytics tasks with them by using Synapse Studio; a web-based portal for `Azure Synapse Analytics`.

### Determine when to use Azure Synapse Analytics

- **Large-scale data warehousing**

Data warehousing includes the need to integrate all data, including big data, to reason over data for analytics and reporting purposes from a descriptive analytics perspective, independent of its location or structure.
Advanced analytics.

- **Data exploration and discovery**

The serverless SQL pool functionality provided by `Azure Synapse Analytics` enables Data Analysts, Data Engineers and Data Scientist alike to explore the data within your data estate. This capability supports data discovery, diagnostic analytics, and exploratory data analysis.

- **Real time analytics**

`Azure Synapse Analytics` can capture, store and analyze data in real-time or near-real time with features such as Azure Synapse Link, or through the integration of services such as Azure Stream Analytics and Azure Data Explorer.

- **Data integration**

Azure Synapse Pipelines enables you to ingest, prepare, model and serve the data to be used by downstream systems. This can be used by components of `Azure Synapse Analytics` exclusively.

- **Integrated analytics**

With the variety of analytics that can be performed on the data at your disposal, putting together the services in a cohesive solution can be a complex operation. `Azure Synapse Analytics` removes this complexity by integrating the analytics landscape into one service. That way you can spend more time working with the data to bring business benefit, than spending much of your time provisioning and maintaining multiple systems to achieve the same outcomes.
<!-- 
### Hands on

[Exercise](https://microsoftlearning.github.io/dp-203-azure-data-engineer/Instructions/Labs/01-Explore-Azure-Synapse.html) -->
