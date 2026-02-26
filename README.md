# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-26T05:54:05.892989+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.610 |  |
| ap-northeast-2 | 0.722 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.800 |  |
| ap-southeast-3 | 0.915 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.439 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.357 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.744 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.073 | 4185 |
| us-east-2 | 0.100 | 1380 |
| us-gov-east-1 | 0.101 | 1510 |
| us-gov-west-1 | 0.294 | 162 |
| us-west-1 | 0.254 | 3120 |
| us-west-2 | 0.310 | 132 |

