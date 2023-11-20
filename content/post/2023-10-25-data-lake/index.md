---
slug: data-lake-in-azure
title: Data lake in Azure
authors: [leiria schattschneider]
tags: [data lake, documentation, azure]
summary: Notes about Azure Data Lake Storage Gen2
---

In this post I combined all key messages I learned going through the [Introduction to Azure Data Lake Storage Gen2](https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-introduction#what-is-a-data-lake) and [Best practices for using Azure Data Lake Storage Gen2](https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-best-practices) documention in the Azure website.

In the first section of this post you will find a *TD;LR* with the main information I foundd to be useful to take into consideration when starting to think on buiding a brand new data lake infrastructure.

## TD;LR

1. `Azure Data Lake Storage` is the current **cloud-based data lake** solution in Azure built on a `Blob Storage` (therefore, you need to have a `Blob Storage` set up in the subscription you want to create your data lake). 

1. A data lake can store all types of data in blobs which are equivalent to files. `Azure Data Lake Storage Gen2` data is organized into a hierarchy of directories and nested subdirectories in much the same way that files are organized on PCs.

1. File format, file size, and directory structure can all impact performance and cost of this `resource`, below are some rules that can be used to improve performance and reduce costs:

     - Data ingestion: use parallelization for better performance

     - File type: it is better to store a compressed file format (eg.: avro, Apache parquet)

     - File size: n general, organize your data into larger sized files for better performance (256 MB to 100 GB in size) instead of uploading a lot of small files.

     - Directory structure: the directory structure needs to be planned ahead of time thinking on how the data will be consumed, a good logic will save costs and improve performance. A general template to consider might be the following layout:

             {Region}/{SubjectMatter(s)}/In/{yyyy}/{mm}/{dd}/{hh}        
         *Example: UK/Planes/ACMEPaperCo/In/2017/08/14/updates_08142017.csv*

             {Region}/{SubjectMatter(s)}/Out/{yyyy}/{mm}/{dd}/{hh}

         *Example: UK/Planes/ACMEPaperCo/Out/2017/08/14/processed_updates_08142017.csv*
             
             {Region}/{SubjectMatter(s)}/Bad/{yyyy}/{mm}/{dd}/{hh}
         
         a `/bad` folder to move the files to for further inspection.

2. Different tools can be used to ingest, analyze, visualize, and download data in `Azure Data Lake Storage` which can depended on things like the type and size of the files to be handled by the data lake.


## What is a Data Lake?

A data lake is a single, centralized repository where you can store all your data, both structured and unstructured. A data lake enables your organization to quickly and more easily store, access, and analyze a wide variety of data in a single location. With a data lake, you don't need to conform your data to fit an existing structure. Instead, you can store your data in its raw or native format, usually as files or as binary large objects (blobs).

`Azure Data Lake Storage` is a cloud-based, enterprise data lake solution. It's engineered to store massive amounts of data in any format, and to facilitate big data analytical workloads. You use it to capture data of any type and ingestion speed in a single location for easy access and analysis using various frameworks.

## Data Lake Storage Gen2

`Azure Data Lake Storage Gen2` refers to the current implementation of Azure's Data Lake Storage solution. The previous implementation, `Azure Data Lake Storage Gen1` will be retired on February 29, 2024.

Unlike `Data Lake Storage Gen1`, `Data Lake Storage Gen2` isn't a dedicated service or account type. Instead, it's implemented as a set of capabilities that you use with the `Blob Storage` service of your Azure Storage account. You can unlock these capabilities by enabling the hierarchical namespace setting.

`Data Lake Storage Gen2` includes the following capabilities.

✓   Hadoop-compatible access

✓   Hierarchical directory structure

✓   Optimized cost and performance

✓   Finer grain security model

✓   Massive scalability

The **hierarchical namespace** is a key feature that enables `Azure Data Lake Storage Gen2` to provide high-performance data access at object storage scale and price. You can use this feature to organize all the objects and files within your storage account into a hierarchy of directories and nested subdirectories. In other words, your `Azure Data Lake Storage Gen2` data is organized in much the same way that files are organized on your computer.

Operations such as renaming or deleting a directory, become single atomic metadata operations on the directory. There's no need to enumerate and process all objects that share the name prefix of the directory.

## Built on Azure Blob Storage

The data that you ingest persist as blobs in the storage account. The service that manages blobs is the `Azure Blob Storage service`. 

Because these capabilities are built on `Blob Storage`, features such as diagnostic logging, access tiers, and lifecycle management policies are available to your account. Most `Blob Storage` features are fully supported, but some features might be supported only at the preview level and there are a handful of them that aren't yet supported. For a complete list of support statements, see [Blob Storage feature support in Azure Storage accounts](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-feature-support-in-storage-accounts). The status of each listed feature will change over time as support continues to expand.

## Network connectivity to the storage account

The network connectivity between your source data and your storage account can sometimes be a bottleneck. When your source data is on premise, consider using a dedicated link with `Azure ExpressRoute`. 


## Configure data ingestion tools for maximum parallelization

To achieve the best performance, use all available throughput by performing as many reads and writes in parallel as possible.

The following table summarizes the key settings for several popular ingestion tools.

|Tool	                |Settings|
|-----------------------|--------|
|DistCp	                |-m (mapper)|
|Azure Data Factory	    |parallelCopies|
|Sqoop	                |fs.azure.block.size, -m (mapper)|

## Ingest, process, and analyze

The following table recommends tools that you can use to ingest, analyze, visualize, and download data. Use the links in this table to find guidance about how to configure and use each tool.

| Purpose	                                                     | Tools & Tool guidance
|----------------------------------------------------------------|------------------------------------------------------
| Ingest ad hoc data	                                         | Azure portal, Azure PowerShell, Azure CLI, REST, Azure Storage Explorer, Apache DistCp, AzCopy
| Ingest relational data	                                     | Azure Data Factory
| Ingest web server logs	                                     | Azure PowerShell, Azure CLI, REST, Azure SDKs (.NET, Java, Python, and Node.js), Azure Data Factory
| Ingest from HDInsight clusters	                             | Azure Data Factory, Apache DistCp, AzCopy
| Ingest from Hadoop clusters	                                 | Azure Data Factory, Apache DistCp, WANdisco LiveData Migrator for Azure, Azure Data Box
| Ingest large data sets (several terabytes)	                 | Azure ExpressRoute
| Process & analyze data	                                     | Azure Synapse Analytics, Azure HDInsight, Databricks
| Visualize data	Power BI,                                    | Azure Data Lake Storage query acceleration
| Download data	                                             | Azure portal, PowerShell, Azure CLI, REST, Azure SDKs (.NET, Java, Python, and Node.js), Azure Storage Explorer, AzCopy, Azure Data Factory, Apache DistCp
