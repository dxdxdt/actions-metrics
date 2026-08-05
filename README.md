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
Updated: 2026-08-05T05:16:11.616504+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.546 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.777 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.697 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.245 | 17 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.185 | 4941 |
| us-east-2 | 0.190 | 1674 |
| us-gov-east-1 | 0.186 | 1801 |
| us-gov-west-1 | 0.184 | 211 |
| us-west-1 | 0.127 | 3885 |
| us-west-2 | 0.185 | 172 |

